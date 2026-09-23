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

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
  body, .main-header .logo, .main-sidebar { font-family: 'Inter', sans-serif; }
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

  .box { border: none; border-radius: 14px; box-shadow: 0 3px 14px rgba(0,0,0,0.09); margin-bottom: 22px; }
  .box-header { background: #0c1a2e; color: #fff; border-radius: 14px 14px 0 0; padding: 14px 18px; }
  .box-header .box-title { color: #fff; font-size: 16px; font-weight: 600; }
  .box-body { border-radius: 0 0 14px 14px; padding: 20px; }
  
  table.dataTable thead th { background: #0c1a2e; color: #fff; border: none; font-weight: 500; }
  .btn-add-new { background: #1a73e8; color: #fff; border-radius: 20px; font-size: 13px; font-weight: 500; padding: 6px 16px; transition: all 0.3s; }
  .btn-add-new:hover { background: #1557b0; color: #fff; box-shadow: 0 4px 10px rgba(26,115,232,0.3); }

  /* ===== TOAST ===== */
  #toast-container {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 99999;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }
  .toast-msg {
    display: flex;
    align-items: center;
    gap: 12px;
    min-width: 300px;
    max-width: 420px;
    padding: 14px 18px;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.18);
    font-family: 'Inter', sans-serif;
    font-size: 14px;
    font-weight: 500;
    color: #fff;
    opacity: 0;
    transform: translateX(60px);
    transition: opacity 0.35s ease, transform 0.35s ease;
  }
  .toast-msg.show { opacity: 1; transform: translateX(0); }
  .toast-msg.hide { opacity: 0; transform: translateX(60px); }
  .toast-success { background: linear-gradient(135deg, #1a73e8 0%, #0d47a1 100%); }
  .toast-error   { background: linear-gradient(135deg, #e53935 0%, #b71c1c 100%); }
  .toast-icon { font-size: 20px; flex-shrink: 0; }
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

	<!-- Toast container -->
	<div id="toast-container"></div>

		<jsp:include page="admin/header.jsp" />

		<jsp:include page="admin/sidebar.jsp">
			<jsp:param name="active" value="product"/>
		</jsp:include>

		<div class="content-wrapper" style="background:#f4f6fb;">
			<!-- Content Header (Page header) -->
			<section class="content-header" style="background:#0c1a2e; padding: 16px 24px;">
				<div style="display:flex; justify-content:space-between; align-items:center;">
					<h1 style="color:#fff; font-size:20px; font-weight:700; margin:0;">
						<i class="fa fa-cube" style="color:#4fc3f7; margin-right:8px;"></i>
						Quản Lý Sản Phẩm
					</h1>
					<a href="addProduct" class="btn btn-add-new">
						<i class="fa fa-plus"></i> Thêm Sản Phẩm Mới
					</a>
				</div>
				<ol class="breadcrumb" style="position:static; float:none; background:transparent; margin:8px 0 0; padding:0;">
					<li><a href="/admin" style="color:#90caf9;"><i class="fa fa-dashboard"></i> Trang Chủ</a></li>
					<li class="active" style="color:#fff;">Sản Phẩm</li>
				</ol>
			</section>
			

			<!-- Main content -->
			<section class="content">
				<div class="row">					
					<div class="col-xs-12">
						<!-- Start Table -->
						<div class="box">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th width="25px">Mã</th>
											<th>Danh Mục</th>
											<th>Tên</th>
											<th>Đơn Giá</th>
											<th>Số Lượng</th>
											
											<th>Lựa Chọn</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="product" items="${products}">
											<tr>
												<td>${product.id}</td>
												<td>${product.category.name}</td>
												<td>${product.name}</td>
												<td>${product.price} đ</td>
												<td>${product.quantity}</td>
												
												<td>
													
													<a href="editProduct?proID=${product.id}" ><span class="glyphicon glyphicon-pencil"></span></a>
													&nbsp;&nbsp;
													<a href="product/${product.id}/delete" onclick="return confirm('Bạn chắc chắn muốn xóa ?')"><span class="glyphicon glyphicon-trash"></span></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th width="25px">Mã</th>
											<th>Danh Mục</th>
											<th>Tên</th>
											<th>Đơn Giá</th>
											<th>Số Lượng</th>
											
											<th>Lựa Chọn</th>
										</tr>
									</tfoot>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- End Table -->
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- footer -->
			<footer
				style="border-top: 1px solid #d2d6de; text-align: center; background: #fff; color: #444; height: 60px; line-height: 60px;">
				<strong>Copyright &copy; 2026 | Nhóm 3</a>
				</strong>
			</footer>
			<!-- footer -->
			<!-- /.content -->
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

			// ===== Toast helper =====
			function showToast(message, type) {
				var icon = type === 'success' ? '&#10003;' : '&#9888;';
				var cls  = type === 'success' ? 'toast-success' : 'toast-error';
				var id   = 'toast-' + Date.now();
				var html = '<div id="' + id + '" class="toast-msg ' + cls + '">' +
					'<span class="toast-icon">' + icon + '</span>' +
					'<span>' + message + '</span>' +
					'</div>';
				$('#toast-container').append(html);
				setTimeout(function(){ $('#' + id).addClass('show'); }, 30);
				setTimeout(function(){ removeToast(id); }, 4500);
			}
			window.removeToast = function(id) {
				var el = $('#' + id);
				el.addClass('hide').removeClass('show');
				setTimeout(function(){ el.remove(); }, 400);
			};

			// Đọc flash attributes từ server
			<c:if test="${not empty toastError}">
				showToast('${toastError}', 'error');
			</c:if>
			<c:if test="${not empty toastSuccess}">
				showToast('${toastSuccess}', 'success');
			</c:if>
		});
	</script>
</body>
</html>
