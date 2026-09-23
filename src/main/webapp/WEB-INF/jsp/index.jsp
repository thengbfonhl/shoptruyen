<%@ page pageEncoding="utf-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Shop Milk | Home</title>
    <jsp:include page="website/head.jsp" />
    <style>
      /* Hide minicart popup on home screen */
      #PPMiniCart { display: none !important; }
    </style>
  </head>
  <body>
    <!-- header -->
    <jsp:include page="website/header.jsp" />
    <!-- header -->

    <!--banner-->
    <jsp:include page="website/banner.jsp" />
    <!--banner-->

    <!-- content -->
    <jsp:include page="website/content.jsp" />
    <!-- content -->

    <!--footer-->
    <jsp:include page="website/footer.jsp" />
    <!--footer-->

    <!--search jQuery-->
    <script src="static/js/main.js"></script>
    <!--//search jQuery-->

    <!--smooth-scrolling-of-move-up-->
    <script type="text/javascript">
      $(document).ready(function () {
        var defaults = {
          containerID: "toTop", // fading element id
          containerHoverID: "toTopHover", // fading element hover id
          scrollSpeed: 1200,
          easingType: "linear",
        };

        /* $().UItoTop({ easingType: 'easeOutQuart' }); */
      });
    </script>
    <!--//smooth-scrolling-of-move-up-->
    <!--Bootstrap core JavaScript
    ================================================== -->
    <!--Placed at the end of the document so the pages load faster -->
    <script src="static/js/bootstrap.js"></script>
  </body>
  <script src="static/js/minicart.js"></script>
  <script>
    paypal.minicart.render({
      strings: { button: "Đến Giỏ Hàng", buttonAlt: "Tổng tiền:", discount: "Giảm giá:" }
    });

    // Gọi ngay sau render để cập nhật navbar
    if (typeof updateCartBadge === 'function') updateCartBadge();

    paypal.minicart.cart.on("add", function () {
      if (typeof updateCartBadge === 'function') updateCartBadge();
    });

    paypal.minicart.cart.on("remove", function () {
      if (typeof updateCartBadge === 'function') updateCartBadge();
    });

    if (~window.location.search.indexOf("reset=true")) {
      paypal.minicart.reset();
    }
  </script>
</html>