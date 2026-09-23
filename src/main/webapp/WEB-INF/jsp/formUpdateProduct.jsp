<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="IE=edge">
<title>Quản lý Sản Phẩm</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="/static/admin/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="/static/admin/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="/static/admin/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/static/admin/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
  body, .main-header .logo, .main-sidebar { font-family: 'Inter', sans-serif; }
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

		<jsp:include page="admin/sidebar.jsp" />

		<div class="content-wrapper" style="background:#f4f6fb;">
			<section class="content-header" style="background:#0c1a2e; padding: 16px 24px;">
              <h1 style="color:#fff; font-size:20px; font-weight:700; margin:0;">
                <i class="fa fa-edit" style="color:#4fc3f7; margin-right:8px;"></i>
                Cập Nhật Sản Phẩm
              </h1>
              <ol class="breadcrumb" style="background:transparent; margin:4px 0 0; padding:0;">
                <li><a href="/admin" style="color:#90caf9;"><i class="fa fa-dashboard"></i> Trang Chủ</a></li>
                <li class="active" style="color:#fff;">Cập Nhật Sản Phẩm</li>
              </ol>
            </section>

			<section class="content">
                <div class="box box-primary" style="border-radius: 10px; box-shadow: 0 4px 18px rgba(0,0,0,0.08); border-top-color: #1a73e8;">
                    <div class="box-body" style="padding: 30px;">
						<c:if test="${not empty message}">
							<div class="alert alert-info">${message}</div>
						</c:if>
						<form:form action="saveChangeProduct" modelAttribute="productForm" method="post" cssClass="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label" style="font-weight:600; color:#444;">Mã Sản Phẩm</label>
								<div class="col-sm-8">
									<form:input path="id" readonly="true" cssClass="form-control" style="border-radius:6px; box-shadow:none; border:1px solid #ccc; height:40px; background:#f9f9f9; cursor:not-allowed;"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" style="font-weight:600; color:#444;">Danh Mục</label>
								<div class="col-sm-8">
									<form:select path="category.id" items="${Categories}" itemValue="id" itemLabel="name" cssClass="form-control" style="border-radius:6px; box-shadow:none; border:1px solid #ccc; height:40px;"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" style="font-weight:600; color:#444;">Tên Sản Phẩm</label>
								<div class="col-sm-8">
									<form:input path="name" cssClass="form-control" placeholder="Nhập tên sản phẩm..." style="border-radius:6px; box-shadow:none; border:1px solid #ccc; height:40px;"/>
									<form:errors path="name" cssClass="text-danger" style="margin-top:5px; display:block;"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" style="font-weight:600; color:#444;">Đơn Giá</label>
								<div class="col-sm-8">
									<form:input type="number" path="price" cssClass="form-control" placeholder="Ví dụ: 150000" style="border-radius:6px; box-shadow:none; border:1px solid #ccc; height:40px;"/>
									<form:errors path="price" cssClass="text-danger" style="margin-top:5px; display:block;"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" style="font-weight:600; color:#444;">Số Lượng</label>
								<div class="col-sm-8">
									<form:input type="number" path="quantity" cssClass="form-control" placeholder="Số lượng trong kho" style="border-radius:6px; box-shadow:none; border:1px solid #ccc; height:40px;"/>
									<form:errors path="quantity" cssClass="text-danger" style="margin-top:5px; display:block;"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" style="font-weight:600; color:#444;">Hình Ảnh</label>
								<div class="col-sm-8">
									<form:input type="file" path="image" cssClass="form-control" style="border-radius:6px; box-shadow:none; border:1px solid #ccc; height:40px; padding-top:8px;"/>
								</div>
							</div>
							
							<div class="form-group" style="margin-top:40px;">
								<div class="col-sm-offset-2 col-sm-8">
									<button type="submit" class="btn btn-primary" style="background: linear-gradient(135deg, #1a73e8, #4facfe); border:none; padding:10px 30px; border-radius:8px; font-weight:600; box-shadow: 0 4px 12px rgba(26,115,232,0.3);"><i class="fa fa-save"></i> Cập Nhật</button>
									<a href="/admin/productManager.html" class="btn btn-default" style="padding:10px 30px; border-radius:8px; margin-left:10px; font-weight:600;">Hủy Bỏ</a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success" style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning" style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary" style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel usage <input
								type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail redirect <input
								type="checkbox" class="pull-right" checked>
							</label>

							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author name in
								posts <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as online <input
								type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off notifications
								<input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat history <a
								href="javascript:void(0)" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.0 -->
	<script src="/static/admin/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="/static/admin/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="/static/admin/datatables/jquery.dataTables.min.js"></script>
	<script src="/static/admin/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="/static/admin/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="/static/admin/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/static/admin/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/static/admin/js/demo.js"></script>
	<!-- page script -->
	<script>
		$(function() {
			$("#example1").DataTable();
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});
	</script>
</body>
</html>
