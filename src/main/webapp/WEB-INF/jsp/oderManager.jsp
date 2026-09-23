<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản lý Danh mục</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
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
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<jsp:include page="admin/header.jsp" />

		<jsp:include page="admin/sidebar.jsp" />

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					QUẢN LÝ ĐƠN HÀNG <small>advanced tables</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Quản lý Đơn hàng</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<c:choose>
					<c:when test="${mode != null}">
						<div class="row">
							<div class="col-xs-12"><div class="box">
									<div class="box-header">
										<h3 style="padding-right: 20px;" class="box-title">ĐƠN HÀNG ${orderID}</h3>
										<form action="checkedOrder" method="post">
											<input type="hidden" value="${orderID}" name="orderID" />
											<input type="radio" value="1" name="orderStatus" /> Xác nhận Đơn hàng
											<input type="radio" value="0" name="orderStatus" /> Hủy Đơn hàng
											<input style="float: right; border: none; background-color: #3c8dbc; padding: 3px 10px; color: #FFF;" type="submit" value="LƯU DỮ LIỆU" />
										</form>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<table id="example1" class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>Mã ĐH</th>
													<th>Tên Sản Phẩm</th>
													<th>Đơn Giá</th>
													<th>Số Lượng</th>
													<th>Thành Tiền</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="orderDetail" items="${orderDetails}">
													<tr>
														<td>${orderDetail.order.id}</td>
														<td>${orderDetail.product.name}</td>
														<td>${orderDetail.product.price}</td>
														<td>${orderDetail.quantity}</td>
														<td>${orderDetail.product.price * orderDetail.quantity}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-xs-12">
								<div class="box">
									<div class="box-header">
										<h3 class="box-title">ĐƠN HÀNG MỚI</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<table id="example2" class="table table-bordered table-hover">
											<thead>
												<tr>
													<th>Mã ĐH</th>
													<th>Tên Khách hàng</th>
													<th>Số điện thoại</th>
													<th>Địa chỉ</th>
													<th>Ngày Thanh Toán</th>
													<th>Tổng Tiền</th>
													<th>Lựa Chọn</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="order" items="${newOrder}">
													<tr>
														<td>${order.id}</td>
														<td>${order.customerName}</td>
														<td>${order.phoneNumber}</td>
														<td>${order.address}</td>
														<td>${order.date}</td>
														<td>${order.total}</td>
														<td>
															<a href="viewOrderDetail?orderID=${order.id}"
															style="border: none; background-color: #3c8dbc; padding: 0 10px; color: #FFF;">
															Chi Tiết</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th>Mã ĐH</th>
													<th>Tên Khách hàng</th>
													<th>Số điện thoại</th>
													<th>Địa chỉ</th>
													<th>Ngày Thanh Toán</th>
													<th>Tổng Tiền</th>
													<th>Lựa Chọn</th>
												</tr>
											</tfoot>
										</table>
									</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->

								<div class="box">
									<div class="box-header">
										<h3 class="box-title">ĐƠN HÀNG ĐÃ THANH TOÁN</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<table id="example1" class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>Mã ĐH</th>
													<th>Tên Khách hàng</th>
													<th>Số điện thoại</th>
													<th>Địa chỉ</th>
													<th>Ngày Thanh Toán</th>
													<th>Tổng Tiền</th>
													<th>Lựa Chọn</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="order" items="${checkedOrder}">
													<tr>
														<td>${order.id}</td>
														<td>${order.customerName}</td>
														<td>${order.phoneNumber}</td>
														<td>${order.address}</td>
														<td>${order.date}</td>
														<td>${order.total}</td>
														<td>
															<a href="viewOrderDetail?orderID=${order.id}"
															style="border: none; background-color: #3c8dbc; padding: 0 10px; color: #FFF;">
															Chi Tiết</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th>Mã ĐH</th>
													<th>Tên Khách hàng</th>
													<th>Số điện thoại</th>
													<th>Địa chỉ</th>
													<th>Ngày Thanh Toán</th>
													<th>Tổng Tiền</th>
													<th>Lựa Chọn</th>
												</tr>
											</tfoot>
										</table>
									</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
						</div>
					</c:otherwise>
				</c:choose>
				<!-- /.row -->
			</section>
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
		<footer style="border-top: 1px solid #d2d6de; text-align: center; background: #fff; color: #444; height: 60px; line-height: 60px;">
			<strong>Copyright &copy; 2026 | Nhóm 3
			</strong>
		</footer>
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
