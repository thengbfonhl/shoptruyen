<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ShopMilk | Admin Dashboard</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3 -->
<link rel="stylesheet" href="/static/admin/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- AdminLTE -->
<link rel="stylesheet" href="/static/admin/css/AdminLTE.min.css">
<link rel="stylesheet" href="/static/admin/css/skins/_all-skins.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
  body, .sidebar-menu, .main-header .logo, .content-wrapper {
    font-family: 'Inter', sans-serif;
  }
  /* Override AdminLTE skin để match màu Home */
  .skin-blue .main-header .logo { background: #0c1a2e; }
  .skin-blue .main-header .navbar { background: #0c1a2e; }
  .skin-blue .main-sidebar { background: #0c1a2e; }
  .skin-blue .sidebar-menu > li.active > a,
  .skin-blue .sidebar-menu > li:hover > a { background: #1a73e8; }
  .skin-blue .sidebar-menu > li > a { color: #b0bec5; }
  .skin-blue .sidebar-menu > li > a:hover { color: #fff; }
  .sidebar-menu .treeview-menu > li > a { color: #90a4ae !important; }
  .sidebar-menu .treeview-menu > li.active > a { color: #fff !important; }
  .main-header .logo span { color: #4fc3f7; font-weight: 700; }
  .main-header .navbar .sidebar-toggle { color: #90caf9; }
  body { background: #f4f6fb; }
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="admin/header.jsp" />
  <jsp:include page="admin/sidebar.jsp">
    <jsp:param name="active" value="dashboard"/>
  </jsp:include>

  <!-- jQuery PHẢI load trước Chart.js và AdminLTE -->
  <script src="/static/admin/jQuery/jQuery-2.2.0.min.js"></script>
  <!-- Bootstrap -->
  <script src="/static/admin/js/bootstrap.min.js"></script>
  <!-- SlimScroll -->
  <script src="/static/admin/slimScroll/jquery.slimscroll.min.js"></script>
  <!-- FastClick -->
  <script src="/static/admin/fastclick/fastclick.js"></script>
  <!-- AdminLTE App -->
  <script src="/static/admin/js/app.min.js"></script>
  <!-- Chart.js load TRƯỚC content.jsp -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>

  <!-- Content với charts (scripts dùng Chart phải load sau Chart.js) -->
  <jsp:include page="admin/content.jsp" />

</div>
</body>
</html>