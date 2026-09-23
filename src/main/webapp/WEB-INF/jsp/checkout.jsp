<%@ page pageEncoding="utf-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Shop Milk | Đặt Hàng</title>
    <jsp:include page="website/head.jsp" />
    <link
      href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
      rel="stylesheet"
    />
    <style>
      #cartDetail tr:not(:first-child) {
        border-bottom: 1px solid #f3f4f6;
      }
      #cartDetail td {
        padding: 1rem 1rem;
        color: #4b5563;
        font-weight: 500;
        font-size: 0.875rem;
      }
      #cartDetail tr:not(:first-child) td:nth-child(1) {
        text-align: center;
        color: #9ca3af;
      }
      #cartDetail tr:not(:first-child) td:nth-child(2) {
        color: #1f2937;
        font-weight: 700;
        padding-right: 1rem;
      }
      #cartDetail tr:not(:first-child) td:nth-child(3) {
        color: #dc2626;
        font-weight: 800;
      }
      #cartDetail tr:not(:first-child) td:nth-child(4) {
        text-align: center;
        font-weight: 700;
        color: #2563eb;
      }
    </style>
  </head>
  <body
    class="bg-milk font-sans selection:bg-brand-DEFAULT selection:text-white"
  >
    <!-- header -->
    <jsp:include page="website/header.jsp" />
    <!-- header -->

    <!-- Breadcrumbs -->
    <div class="bg-white border-b border-gray-100 mb-8">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
        <nav
          class="flex text-sm font-medium text-gray-500"
          aria-label="Breadcrumb"
        >
          <ol class="flex items-center space-x-2 sm:space-x-4">
            <li>
              <a
                href="home"
                class="hover:text-brand-DEFAULT transition-colors flex items-center"
                ><i class="ph ph-house mr-1.5 text-lg"></i> Trang Chủ</a
              >
            </li>
            <li><i class="ph ph-caret-right text-gray-400"></i></li>
            <li class="text-brand-DEFAULT font-semibold" aria-current="page">
              Đặt Hàng
            </li>
          </ol>
        </nav>
      </div>
    </div>

    <!-- Checkout Section -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-20">
      <div class="flex flex-col lg:flex-row gap-8">
        <!-- Left Column: Customer Information -->
        <div class="w-full lg:w-3/5">
          <div
            class="bg-white rounded-[2rem] p-8 lg:p-10 shadow-sm border border-gray-100"
          >
            <h2
              class="text-2xl font-extrabold text-gray-900 mb-8 pb-4 border-b border-gray-100 flex items-center"
            >
              <i
                class="ph-fill ph-user-circle text-brand-DEFAULT mr-3 text-3xl"
              ></i>
              Thông Tin Khách Hàng
            </h2>
            <form:form
              id="orderForm"
              modelAttribute="orderForm"
              class="space-y-6"
            >
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label class="block text-sm font-bold text-gray-700 mb-2"
                    >Họ Tên Quý Khách</label
                  >
                  <form:input
                    path="customerName"
                    id="customerName"
                    placeholder="Nhập họ và tên..."
                    class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-3 focus:outline-none focus:ring-2 focus:ring-brand-DEFAULT/50 focus:bg-white transition-colors"
                  />
                </div>
                <div>
                  <label class="block text-sm font-bold text-gray-700 mb-2"
                    >Số Điện Thoại</label
                  >
                  <form:input
                    path="phoneNumber"
                    id="phoneNumber"
                    placeholder="Nhập số điện thoại..."
                    maxlength="10"
                    class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-3 focus:outline-none focus:ring-2 focus:ring-brand-DEFAULT/50 focus:bg-white transition-colors"
                  />
                </div>
              </div>

              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2"
                  >Địa Chỉ Giao Hàng</label
                >
                <form:textarea
                  path="address"
                  id="address"
                  placeholder="Nhập địa chỉ nhận hàng chi tiết..."
                  rows="3"
                  class="w-full bg-gray-50 border border-gray-200 text-gray-900 rounded-xl px-4 py-3 focus:outline-none focus:ring-2 focus:ring-brand-DEFAULT/50 focus:bg-white transition-colors"
                />
              </div>

              <form:input id="orderTotal" type="hidden" path="total" />
              <input
                id="noProductInCart"
                type="hidden"
                name="noProductInCart"
              />

              <div class="mt-10 pt-6 border-t border-gray-100 flex justify-end">
                <button
                  id="btnSave"
                  type="button"
                  onclick="return datHang();"
                  class="bg-brand-DEFAULT hover:bg-brand-600 text-white font-bold text-lg rounded-xl px-10 py-4 shadow-lg shadow-brand-DEFAULT/30 hover:shadow-xl transition-all active:scale-95 flex items-center w-full sm:w-auto justify-center"
                >
                  <i class="ph-fill ph-check-circle mr-2 text-xl"></i> Xác Nhận
                  Đặt Hàng
                </button>
              </div>
            </form:form>
          </div>
        </div>

        <!-- Right Column: Order Summary -->
        <div class="w-full lg:w-2/5">
          <!-- Delivery Method -->
          <div
            class="bg-brand-50 rounded-[2rem] p-8 mb-6 border border-brand-100/50"
          >
            <h3 class="text-xl font-bold text-brand-DEFAULT mb-4">
              Hình thức vận chuyển
            </h3>
            <div class="space-y-3">
              <label
                class="flex items-center space-x-3 cursor-pointer group bg-white p-4 rounded-xl shadow-sm border border-brand-100 transition-all hover:border-brand-DEFAULT"
              >
                <input
                  type="radio"
                  name="delivery"
                  checked
                  class="form-radio h-5 w-5 text-brand-DEFAULT focus:ring-brand-DEFAULT"
                />
                <span class="text-sm font-bold text-gray-800"
                  >GIAO HÀNG NHANH</span
                >
              </label>
              <label
                class="flex items-center space-x-3 cursor-pointer group bg-white/50 p-4 rounded-xl border border-transparent transition-all hover:bg-white hover:border-gray-200"
              >
                <input
                  type="radio"
                  name="delivery"
                  class="form-radio h-5 w-5 text-gray-400 focus:ring-brand-DEFAULT"
                />
                <span class="text-sm font-medium text-gray-500"
                  >GIAO HÀNG THƯỜNG</span
                >
              </label>
            </div>
          </div>

          <!-- Cart Details -->
          <div
            class="bg-white rounded-[2rem] p-8 shadow-sm border border-gray-100 relative overflow-hidden"
          >
            <div
              class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-brand-300 to-brand-DEFAULT"
            ></div>
            <h3
              class="text-xl font-bold text-gray-900 mb-6 flex items-center justify-between"
            >
              <span>Thông Tin Đơn Hàng</span>
              <i class="ph-fill ph-receipt text-brand-DEFAULT/30 text-3xl"></i>
            </h3>

            <div
              class="overflow-x-auto text-sm mb-6 rounded-xl border border-gray-100 overflow-hidden"
            >
              <!-- Notice: cartDetail element must receive innerHTML via JS -->
              <table class="w-full text-left bg-white" id="cartDetail">
                <tr
                  class="bg-gray-50 text-gray-600 font-bold border-b border-gray-100"
                >
                  <td
                    class="py-3 px-4 text-center w-12 rounded-tl-xl border-r border-gray-100"
                  >
                    STT
                  </td>
                  <td class="py-3 px-4 border-r border-gray-100">Tên SP</td>
                  <td class="py-3 px-4 border-r border-gray-100">Giá</td>
                  <td class="py-3 px-4 text-center w-16 rounded-tr-xl">SL</td>
                </tr>
                <!-- JS appends items here -->
              </table>
            </div>

            <div
              class="bg-gray-50 rounded-xl p-6 flex justify-between items-center border border-gray-100"
            >
              <span
                class="font-bold text-gray-600 uppercase tracking-widest text-sm"
                >Tổng cộng</span
              >
              <span
                id="TotalCart"
                class="text-2xl font-black text-brand-DEFAULT tracking-tight"
              ></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!--footer-->
    <jsp:include page="website/footer.jsp" />
    <!--footer-->

    <!--search jQuery-->
    <script src="static/js/main.js"></script>
    <!--//search jQuery-->
    <script src="static/js/minicart.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <!--smooth-scrolling-of-move-up-->

    <script src="static/js/Order.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $(".scroll").click(function (event) {
          event.preventDefault();
          $("html,body").animate(
            { scrollTop: $(this.hash).offset().top },
            1000,
          );
        });
        var items = paypal.minicart.cart.items(),
          cartTotal = paypal.minicart.cart.total(),
          productPrice = 0,
          quantity = 0;

        // Cập nhật badge
        if (typeof updateCartBadge === 'function') updateCartBadge();

        if (items.length > 0) {
          for (var i = 0; i < items.length; i++) {
            quantity = items[i].get("quantity");
            productPrice = items[i].get("amount");
            var formattedPrice = Number(productPrice).toLocaleString("vi-VN");

            document.getElementById("cartDetail").innerHTML +=
              "<tr> <td>" +
              (i + 1) +
              "</td> <td>" +
              items[i].get("item_name") +
              "</td> <td>" +
              formattedPrice +
              " đ</td> <td>" +
              quantity +
              "</td> </tr>";

            document.getElementById("orderForm").innerHTML +=
              '<input type="hidden" value="' +
              items[i].get("item_name") +
              '" name="productName' +
              (i + 1) +
              '" />' +
              '<input type="hidden" value="' +
              quantity +
              '" name="productQuantity' +
              (i + 1) +
              '" />';
          }

          var noProductInCart = document.getElementById("noProductInCart");
          if (noProductInCart) {
            noProductInCart.value = items.length;
          }
        }

        var mainCartTotal = document.getElementById("TotalCart");
        if (mainCartTotal) {
          mainCartTotal.innerHTML =
            Number(cartTotal).toLocaleString("vi-VN") + " đ";
        }

        var orderTotalInput = document.getElementById("orderTotal");
        if (orderTotalInput) {
          orderTotalInput.value = cartTotal;
        }
      });
    </script>
  </body>

  <!--//smooth-scrolling-of-move-up-->
  <!--Bootstrap core JavaScript
    ================================================== -->
  <!--Placed at the end of the document so the pages load faster -->
  <script src="static/js/bootstrap.js"></script>

  <script>
    paypal.minicart.render({
      strings: {
        button: "VNĐ",
        buttonAlt: "Tổng tiền:",
        discount: "Giảm giá:",
      },
    });

    //function datHang có toarst thông báo thành công
    function datHang() {
      var customerName = document.getElementById("customerName").value;
      var phoneNumber = document.getElementById("phoneNumber").value;
      var address = document.getElementById("address").value;
      var orderTotal = Number.parseInt(
        document.getElementById("orderTotal").value,
      );

      if (customerName == "") {
        toastr.error("Họ Tên không được để trống");
        return;
      }
      if (phoneNumber == "") {
        toastr.error("Số điện thoại không được để trống");
        return;
      }
      if (address == "") {
        toastr.error("Địa chỉ không được để trống");
        return;
      }

      $.ajax({
        url: "/order",
        method: "post",
        data: $("#orderForm").serialize(),
        success: function () {
          toastr.success("Đặt hàng thành công", { timeOut: 2000 });
          try {
            paypal.minicart.reset(); // xóa hết giỏ hàng
            if (typeof updateCartBadge === "function") updateCartBadge();
          } catch (e) {}
          setTimeout(function () {
            window.location.href = "/home";
          }, 900);
        },
        error: function (xhr) {
          // Nếu server trả 400 với message (ResponseStatusException), ưu tiên hiện message đó
          var msg = "Đặt hàng thất bại, vui lòng thử lại";
          try {
            if (xhr && xhr.responseJSON && xhr.responseJSON.message) msg = xhr.responseJSON.message;
            else if (xhr && xhr.responseText) msg = xhr.responseText;
          } catch (e) {}
          toastr.error(msg);
        },
      });
    }

    paypal.minicart.cart.on("add", function () {
      setTimeout(function() {
        if (typeof updateCartBadge === 'function') updateCartBadge();
      }, 150);
    });

    paypal.minicart.cart.on("remove", function () {
      setTimeout(function() {
        if (typeof updateCartBadge === 'function') updateCartBadge();
      }, 150);
    });

    if (~window.location.search.indexOf("reset=true")) {
      paypal.minicart.reset();
    }
  </script>
</html>