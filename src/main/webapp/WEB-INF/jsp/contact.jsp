<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>ShopTruyen | Liên hệ</title>
    <jsp:include page="website/head.jsp" />
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        .premium-shadow { box-shadow: 0 20px 25px -5px rgba(0,0,0,.05), 0 10px 10px -5px rgba(0,0,0,.02); }
    </style>
</head>
<body>
	<!-- header -->
	<jsp:include page="website/header.jsp" />
	<!-- header -->
	
	
	<!-- content -->
	<jsp:include page="website/contentContact.jsp" />
	<!-- content -->
	
	<!--footer-->
	<jsp:include page="website/footer.jsp" />
	<!--footer-->
	
	<!--search jQuery-->
	<script src="static/js/main.js"></script>
	<!--//search jQuery-->
</body>
<script src="static/js/minicart.js"></script>
<script>
paypal.minicart.render({
  strings: {
    button: "Đến Giỏ Hàng",
    buttonAlt: "Tổng tiền:",
    discount: "Giảm giá:"
  }
});

window.onload = function() {
  if (typeof updateCartBadge === 'function') updateCartBadge();
};

paypal.minicart.cart.on('add', function() {
  setTimeout(function() {
    if (typeof updateCartBadge === 'function') updateCartBadge();
  }, 150);
});

paypal.minicart.cart.on('remove', function() {
  setTimeout(function() {
    if (typeof updateCartBadge === 'function') updateCartBadge();
  }, 150);
});

if (~window.location.search.indexOf('reset=true')) {
  paypal.minicart.reset();
}
</script>
</html>