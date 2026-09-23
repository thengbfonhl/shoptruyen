<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Chi tiết Sản phẩm | Shop Milk</title>
    <jsp:include page="website/head.jsp" />
  </head>
  <body>
    <!--header-->
    <jsp:include page="website/header.jsp"></jsp:include>
    <!--//header-->

    <!--single-page-->
    <jsp:include page="website/detailContent.jsp"></jsp:include>
    <!--//single-page-->

    <!--footer-->
    <jsp:include page="website/footer.jsp"></jsp:include>
    <!--//footer-->
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

        $().UItoTop({ easingType: "easeOutQuart" });
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
      strings: {
        button: "Đến Giỏ Hàng",
        buttonAlt: "Tổng tiền:",
        discount: "Giảm giá:",
      },
    });

    window.onload = function () {
      if (typeof updateCartBadge === 'function') updateCartBadge();
    };

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