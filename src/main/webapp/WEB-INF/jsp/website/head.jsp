<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Google Fonts: Outfit -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
  rel="stylesheet"
/>
<!-- Tailwind CSS via CDN -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Icons: Phosphor Icons -->
<script src="https://unpkg.com/@phosphor-icons/web"></script>
<!-- jQuery (required for Minicart & existing logic) -->
<script src="static/js/jquery-1.11.1.min.js"></script>

<!-- Tailwind Config -->
<script>
  tailwind.config = {
    theme: {
      extend: {
        fontFamily: {
          sans: ["Outfit", "sans-serif"],
        },
        colors: {
          milk: "#F9FAFB" /* very light cool gray for clean contrast */,
          brand: {
            light: "#DBEAFE",
            DEFAULT: "#2563EB" /* Professional Blue */,
            dark: "#1E40AF",
          },
          "brand-DEFAULT": "#2563EB",
          dark: "#0F172A",
        },
      },
    },
  };
</script>
<style>
  body {
    font-family: "Outfit", sans-serif;
    background-color: theme("colors.milk");
    color: theme("colors.dark");
    margin: 0;
    padding: 0;
    overflow-x: hidden;
  }
  .glass {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.4);
  }
  .card-glass {
    background: rgba(255, 255, 255, 0.6);
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.5);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.05);
  }
  /* Smooth utilities */
  * {
    transition: all 0.25s ease-out;
  }
  .no-transition {
    transition: none !important;
  }

  /* Minicart UI Overrides */
  #PPMiniCart,
  #PPMiniCart * {
    box-sizing: border-box !important;
  }
  #PPMiniCart {
    position: absolute !important;
    right: 2rem !important;
    top: 5rem !important;
    width: 450px !important;
    background: rgba(255, 255, 255, 0.98) !important;
    backdrop-filter: blur(12px) !important;
    -webkit-backdrop-filter: blur(12px) !important;
    border: 1px solid rgba(0, 0, 0, 0.08) !important;
    border-radius: 1.5rem !important;
    box-shadow: 0 20px 40px -10px rgba(37, 99, 235, 0.2) !important;
    padding: 1.5rem !important;
    z-index: 1000 !important;
    font-family: "Outfit", sans-serif !important;
    color: #0f172a !important;
  }
  #PPMiniCart form {
    margin: 0 !important;
    padding: 0 !important;
    width: 100% !important;
    position: relative !important;
    border: none !important;
    box-shadow: none !important;
    background: transparent !important;
    border-radius: 0 !important;
  }
  #PPMiniCart ul {
    list-style: none !important;
    padding: 0 4px 0 0 !important;
    margin: 0 0 1.2rem 0 !important;
    max-height: 280px !important;
    overflow-y: auto !important;
    overflow-x: hidden !important;
    border: none !important;
    box-shadow: none !important;
    background: transparent !important;
    border-radius: 0 !important;
  }
  /* Custom scrollbar for minicart */
  #PPMiniCart ul::-webkit-scrollbar {
    width: 4px;
  }
  #PPMiniCart ul::-webkit-scrollbar-thumb {
    background: #cbd5e1;
    border-radius: 4px;
  }
  #PPMiniCart .minicart-item {
    display: flex !important;
    justify-content: space-between !important;
    align-items: center !important;
    padding-bottom: 0.75rem !important;
    margin-bottom: 0.75rem !important;
    gap: 0.5rem !important;
    width: 100% !important;
  }
  #PPMiniCart .minicart-details-name {
    flex: 1 1 auto !important;
    width: 100% !important;
    float: none !important;
    min-width: 0 !important;
  }
  #PPMiniCart .minicart-name {
    font-weight: 700 !important;
    color: #1e293b !important;
    display: block !important;
    text-decoration: none !important;
    border: none !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
    white-space: nowrap !important;
  }
  #PPMiniCart .minicart-attributes {
    display: none !important;
  }
  #PPMiniCart .minicart-details-quantity {
    width: 100% !important;
    float: none !important;
  }
  #PPMiniCart .minicart-quantity {
    width: 100% !important;
    text-align: center !important;
    border-radius: 0.5rem !important;
    padding: 0.3rem !important;
    font-size: 0.9rem !important;
    font-weight: 600 !important;
    box-sizing: border-box !important;
  }
  #PPMiniCart .minicart-details-remove {
    width: 100% !important;
    float: none !important;
    text-align: center !important;
  }
  #PPMiniCart .minicart-remove {
    background: #fee2e2 !important;
    color: #ef4444 !important;
    border: none !important;
    border-radius: 50% !important;
    width: 24px !important;
    height: 24px !important;
    font-size: 0.8rem !important;
    cursor: pointer !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    transition: all 0.2s !important;
    text-decoration: none !important;
  }
  #PPMiniCart .minicart-remove:hover {
    background: #f87171 !important;
    color: #fff !important;
  }
  #PPMiniCart .minicart-details-price {
    width: 100% !important;
    float: none !important;
    text-align: right !important;
    min-width: 0 !important;
  }
  #PPMiniCart .minicart-price {
    font-weight: 800 !important;
    color: #2563eb !important;
    font-size: 0.95rem !important;
    display: block !important;
  }
  #PPMiniCart .minicart-subtotal {
    position: static !important;
    text-align: right !important;
    padding-right: 0.25rem !important;
    font-weight: 800 !important;
    font-size: 1.15rem !important;
    padding-top: 1rem !important;
    border-top: 2px dashed #e5e7eb !important;
    margin-bottom: 1.2rem !important;
    color: #1f2937 !important;
    display: block !important;
  }
  #PPMiniCart .minicart-submit {
    position: static !important;
    width: 100% !important;
    margin-top: 1rem !important;
    background: #2563eb !important;
    background-image: none !important;
    color: #fff !important;
    border: none !important;
    padding: 1rem 0.9rem !important;
    border-radius: 1rem !important;
    font-weight: 700 !important;
    cursor: pointer !important;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1) !important;
    font-size: 1.05rem !important;
    text-shadow: none !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    line-height: 1 !important;
    box-shadow:
      0 4px 6px -1px rgba(37, 99, 235, 0.2),
      0 2px 4px -1px rgba(37, 99, 235, 0.1) !important;
  }
  #PPMiniCart .minicart-submit:hover {
    background: #1e40af !important;
    transform: translateY(-2px) !important;
    box-shadow:
      0 10px 15px -3px rgba(37, 99, 235, 0.3),
      0 4px 6px -2px rgba(37, 99, 235, 0.15) !important;
  }
</style>

<script>
  // Kiểm tra trạng thái đăng nhập từ Spring Security
  var isUserAuthenticated = false;
  <sec:authorize access="isAuthenticated()">
  isUserAuthenticated = true;
  </sec:authorize>

  // Chặn hành động thêm vào giỏ hàng khi chưa đăng nhập (Sử dụng capture phase)
  document.addEventListener("submit", function (e) {
    if (!isUserAuthenticated && e.target && e.target.nodeName === 'FORM') {
      var cmd = e.target.querySelector('input[name="cmd"]');
      // Nếu là form thêm vào giỏ hàng (không phải form bên trong minicart popup)
      if (cmd && cmd.value === '_cart' && !e.target.closest("#PPMiniCart")) {
        e.preventDefault();
        e.stopImmediatePropagation();
        alert("Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng!");
        window.location.href = "${pageContext.request.contextPath}/login";
      }
    }
  }, true);

  // Global interceptor to redirect minicart submit button to the checkout page instead of PayPal
  document.addEventListener("submit", function (e) {
    if (e.target && e.target.closest && e.target.closest("#PPMiniCart")) {
      e.preventDefault();
      window.location.href = "${pageContext.request.contextPath}/order";
    }
  });

  // Global cart navbar updater - đọc từ localStorage của PayPal Minicart
  // PayPal Minicart lưu: key='PPMiniCart', value=encodeURIComponent(JSON.stringify({value:[...items], expires:"..."}))
  function updateCartBadge() {
    try {
      var badge   = document.getElementById('cartBadge');
      var totalEl = document.getElementById('cartTotal');
      var totalQty   = 0;
      var totalPrice = 0;

      if (window.paypal && window.paypal.minicart && window.paypal.minicart.cart) {
        var cartItems = window.paypal.minicart.cart.items();
        for (var i = 0; i < cartItems.length; i++) {
          var qty   = parseInt(cartItems[i].get('quantity')) || 1;
          var price = parseFloat(cartItems[i].get('amount'))  || 0;
          totalQty   += qty;
          totalPrice += price * qty;
        }
      }

      if (totalQty > 0) {
        if (badge)   { badge.textContent = totalQty > 99 ? '99+' : totalQty; badge.classList.remove('hidden'); }
        if (totalEl) totalEl.textContent = totalPrice.toLocaleString('vi-VN') + ' \u0111 (' + totalQty + ')';
      } else {
        if (badge)   badge.classList.add('hidden');
        if (totalEl) totalEl.textContent = '0 \u0111 (0)';
      }
    } catch(e) { /* silent */ }
  }

  // Expose global — mỗi trang gọi sau khi minicart.render() xong
  window.updateCartBadge = updateCartBadge;
</script>
