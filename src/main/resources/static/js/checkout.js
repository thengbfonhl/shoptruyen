function showFieldError(id, message) {
  var input = document.getElementById(id);
  var error = document.getElementById(id + 'Error');
  error.textContent = message;
  error.hidden = !message;
  input.setAttribute('aria-invalid', String(!!message));
  input.style.borderColor = message ? '#dc2626' : '';
  return !message;
}

function validateCustomerName() {
  var value = document.getElementById('customerName').value.trim();
  var message = '';
  if (!value) message = 'Vui lòng nhập họ tên.';
  else if (value.length < 2 || value.length > 50) message = 'Họ tên phải từ 2 đến 50 ký tự.';
  else if (!/^[\p{L}\p{M}]+(?:[ '\u2019.-][\p{L}\p{M}]+)*$/u.test(value))
    message = 'Họ tên chỉ được chứa chữ cái, khoảng trắng, dấu chấm, dấu nháy hoặc dấu gạch nối giữa các phần tên.';
  return showFieldError('customerName', message);
}

function validateAddress() {
  var value = document.getElementById('address').value.trim();
  var message = '';
  if (!value) message = 'Vui lòng nhập địa chỉ giao hàng.';
  else if (value.length < 10 || value.length > 255)
    message = 'Địa chỉ phải từ 10 đến 255 ký tự. Vui lòng ghi rõ đường, phường/xã, tỉnh/thành phố.';
  else if (!/[\p{L}\p{N}]/u.test(value)) message = 'Vui lòng nhập địa chỉ hợp lệ, không chỉ gồm ký tự đặc biệt.';
  return showFieldError('address', message);
}

function validateOrderFields() {
  var nameValid = validateCustomerName();
  var phoneValid = validatePhoneNumber();
  var addressValid = validateAddress();
  if (!nameValid || !phoneValid || !addressValid) {
    document.getElementById(!nameValid ? 'customerName' : (!phoneValid ? 'phoneNumber' : 'address')).focus();
    return false;
  }
  ['customerName', 'address'].forEach(function (id) {
    var input = document.getElementById(id);
    input.value = input.value.trim();
  });
  return true;
}

function validatePhoneNumber() {
  var input = document.getElementById('phoneNumber');
  var error = document.getElementById('phoneNumberError');
  var valid = /^0[0-9]{9}$/.test(input.value);
  error.textContent = valid ? '' : (input.value === ''
    ? 'Vui lòng nhập số điện thoại.'
    : 'Số điện thoại phải gồm đúng 10 chữ số và bắt đầu bằng 0.');
  error.hidden = valid;
  input.setAttribute('aria-invalid', String(!valid));
  input.style.borderColor = valid ? '' : '#dc2626';
  return valid;
}

function renderCheckoutCart() {
  var items = paypal.minicart.cart.items();
  var table = document.getElementById('cartDetail');
  while (table.rows.length > 1) table.deleteRow(1);
  var fields = document.getElementById('cartFields');
  fields.textContent = '';
  items.forEach(function (item, index) {
    var row = table.insertRow();
    [index + 1, item.get('item_name'),
      Number(item.get('amount')).toLocaleString('vi-VN') + ' đ',
      item.get('quantity')].forEach(function (value) {
        row.insertCell().textContent = value;
      });
    var button = document.createElement('button');
    button.type = 'button';
    var icon = document.createElement('i');
    icon.className = 'ph ph-trash text-xl';
    icon.setAttribute('aria-hidden', 'true');
    button.appendChild(icon);
    button.title = 'Xóa sản phẩm';
    button.className = 'text-red-600 hover:text-red-800 font-bold px-2 py-2 rounded-lg hover:bg-red-50';
    button.setAttribute('aria-label', 'Xóa ' + item.get('item_name'));
    button.addEventListener('click', function () {
      paypal.minicart.cart.remove(index);
      renderCheckoutCart();
    });
    row.insertCell().appendChild(button);
    [['productName', item.get('item_name')], ['productQuantity', item.get('quantity')]]
      .forEach(function (entry) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = entry[0] + (index + 1);
        input.value = entry[1];
        fields.appendChild(input);
      });
  });
  if (!items.length) {
    var empty = table.insertRow().insertCell();
    empty.colSpan = 5;
    empty.textContent = 'Giỏ hàng trống. Hãy thêm truyện để đặt hàng.';
  }
  var total = paypal.minicart.cart.total();
  document.getElementById('TotalCart').textContent = Number(total).toLocaleString('vi-VN') + ' đ';
  document.getElementById('orderTotal').value = total;
  document.getElementById('noProductInCart').value = items.length;
  document.getElementById('btnSave').disabled = !items.length;
  if (typeof updateCartBadge === 'function') updateCartBadge();
}

document.addEventListener('DOMContentLoaded', function () {
  [['customerName', validateCustomerName], ['address', validateAddress]].forEach(function (field) {
    var input = document.getElementById(field[0]);
    input.addEventListener('input', field[1]);
    input.addEventListener('blur', field[1]);
  });
  var phone = document.getElementById('phoneNumber');
  phone.addEventListener('input', validatePhoneNumber);
  phone.addEventListener('blur', validatePhoneNumber);
  document.getElementById('orderForm').addEventListener('submit', function (event) {
    event.preventDefault();
    datHang();
  });
  ['add', 'remove', 'change', 'reset'].forEach(function (event) {
    paypal.minicart.cart.on(event, function () { setTimeout(renderCheckoutCart, 0); });
  });
  renderCheckoutCart();
});
