<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản Lý Đơn Hàng - Admin</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="/static/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/static/admin/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="/static/admin/css/AdminLTE.min.css">
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

  /* KPI Cards */
  .kpi-card {
    border-radius: 14px; padding: 22px 20px; color: #fff; position: relative;
    overflow: hidden; box-shadow: 0 4px 18px rgba(0,0,0,0.13);
    margin-bottom: 20px; display: block;
  }
  .kpi-card .kpi-icon {
    position: absolute; right: 18px; top: 50%; transform: translateY(-50%);
    font-size: 52px; opacity: 0.18;
  }
  .kpi-card h2 { font-size: 36px; font-weight: 700; margin: 0 0 4px; }
  .kpi-card p  { margin: 0; font-size: 13px; opacity: 0.9; font-weight: 500; }
  .kpi-pending   { background: linear-gradient(135deg, #f7971e, #ffd200); }
  .kpi-shipping  { background: linear-gradient(135deg, #0061a8, #00c6fb); }
  .kpi-done      { background: linear-gradient(135deg, #11998e, #38ef7d); color:#fff; }
  .kpi-cancelled { background: linear-gradient(135deg, #c0392b, #ff6b6b); }

  .status-filter-tabs { margin-bottom: 20px; }
  .status-filter-tabs .btn { border-radius: 20px; margin-right: 8px; margin-bottom: 8px; font-weight: 500; border: none; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
  .status-filter-tabs .btn.active { box-shadow: inset 0 3px 5px rgba(0,0,0,0.125); }
  
  .box { border: none; border-radius: 14px; box-shadow: 0 3px 14px rgba(0,0,0,0.09); margin-bottom: 22px; }
  .box-header { background: #0c1a2e; color: #fff; border-radius: 14px 14px 0 0; padding: 14px 18px; }
  .box-header .box-title { color: #fff; font-size: 16px; font-weight: 600; }
  .box-header .box-title i { margin-right: 8px; color: #4fc3f7; }
  .box-body { border-radius: 0 0 14px 14px; padding: 20px; }
  
  table.dataTable thead th { background: #0c1a2e; color: #fff; border: none; font-weight: 500; }
  table.dataTable tbody td { vertical-align: middle; }

  /* Custom Select cho Bulk Action */
  .bulk-action-wrapper {
    background: #fff;
    border: 1px solid #e0e6ed;
    border-radius: 8px;
    padding: 8px 12px;
    display: inline-flex;
    align-items: center;
    box-shadow: 0 2px 8px rgba(0,0,0,0.04);
    margin-bottom: 15px;
  }
  .bulk-select {
    border: none;
    background: transparent;
    font-size: 14px;
    font-weight: 500;
    color: #333;
    width: 230px;
    outline: none;
    cursor: pointer;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    padding-right: 25px;
    position: relative;
    background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="%23666" viewBox="0 0 16 16"><path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/></svg>') no-repeat right center;
  }
  .bulk-select:focus { outline: none; }
  .btn-bulk-apply {
    background: linear-gradient(135deg, #1a73e8, #4facfe);
    color: #fff;
    border: none;
    border-radius: 6px;
    padding: 6px 16px;
    font-size: 13px;
    font-weight: 600;
    margin-left: 12px;
    box-shadow: 0 2px 6px rgba(26,115,232,0.3);
    transition: all 0.3s;
  }
  .btn-bulk-apply:hover {
    box-shadow: 0 4px 10px rgba(26,115,232,0.4);
    transform: translateY(-1px);
    color: #fff;
  }

  /* Custom Status Labels */
  .status-badge {
    font-size: 12px;
    padding: 6px 12px;
    border-radius: 20px;
    font-weight: 600;
    display: inline-block;
  }
  .status-pending { color: #f39c12; background: rgba(243, 156, 18, 0.1); }
  .status-shipping { color: #00c0ef; background: rgba(0, 192, 239, 0.1); }
  .status-completed { color: #00a65a; background: rgba(0, 166, 90, 0.1); }
  .status-cancelled { color: #dd4b39; background: rgba(221, 75, 57, 0.1); }
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="admin/header.jsp" />
  <jsp:include page="admin/sidebar.jsp">
    <jsp:param name="active" value="order"/>
  </jsp:include>

  <div class="content-wrapper" style="background:#f4f6fb;">
    <!-- Header -->
    <section class="content-header" style="background:#0c1a2e; padding: 16px 24px;">
      <h1 style="color:#fff; font-size:20px; font-weight:700; margin:0;">
        <i class="fa fa-shopping-cart" style="color:#4fc3f7; margin-right:8px;"></i>
        Quản Lý Đơn Hàng
        <small style="font-size:13px; color:#90caf9; font-weight:400; margin-left:8px;">Theo dõi và cập nhật trạng thái</small>
      </h1>
      <ol class="breadcrumb" style="background:transparent; margin:4px 0 0; padding:0;">
        <li><a href="/admin" style="color:#90caf9;"><i class="fa fa-dashboard"></i> Trang Chủ</a></li>
        <li class="active" style="color:#fff;">Quản Lý Đơn Hàng</li>
      </ol>
    </section>

    <section class="content">

      <!-- Thống kê trạng thái -->
      <div class="row">
        <div class="col-xs-6 col-md-3">
          <div class="kpi-card kpi-pending">
            <i class="fa fa-clock-o kpi-icon"></i>
            <h2>${countPending}</h2>
            <p>Chờ Xác Nhận</p>
          </div>
        </div>
        <div class="col-xs-6 col-md-3">
          <div class="kpi-card kpi-shipping">
            <i class="fa fa-truck kpi-icon"></i>
            <h2>${countShipping}</h2>
            <p>Đang Giao</p>
          </div>
        </div>
        <div class="col-xs-6 col-md-3">
          <div class="kpi-card kpi-done">
            <i class="fa fa-check-circle kpi-icon"></i>
            <h2>${countCompleted}</h2>
            <p>Hoàn Thành</p>
          </div>
        </div>
        <div class="col-xs-6 col-md-3">
          <div class="kpi-card kpi-cancelled">
            <i class="fa fa-times-circle kpi-icon"></i>
            <h2>${countCancelled}</h2>
            <p>Đã Hủy</p>
          </div>
        </div>
      </div>

      <!-- Filter tabs -->
      <div class="row">
        <div class="col-xs-12">
          <div class="status-filter-tabs">
            <a href="/admin/orderManager" class="btn ${currentStatus == -1 ? 'btn-default active' : 'btn-default'}">
              <i class="fa fa-list"></i> Tất Cả
            </a>
            <a href="/admin/orderManager?status=0" class="btn ${currentStatus == 0 ? 'btn-warning active' : 'btn-default'}">
              <i class="fa fa-clock-o"></i> Chờ Xác Nhận
              <span class="badge" style="background:#e67e22;">${countPending}</span>
            </a>
            <a href="/admin/orderManager?status=1" class="btn ${currentStatus == 1 ? 'btn-info active' : 'btn-default'}">
              <i class="fa fa-truck"></i> Đang Giao
              <span class="badge" style="background:#00b0cf;">${countShipping}</span>
            </a>
            <a href="/admin/orderManager?status=2" class="btn ${currentStatus == 2 ? 'btn-success active' : 'btn-default'}">
              <i class="fa fa-check"></i> Hoàn Thành
              <span class="badge" style="background:#00a65a;">${countCompleted}</span>
            </a>
            <a href="/admin/orderManager?status=3" class="btn ${currentStatus == 3 ? 'btn-danger active' : 'btn-default'}">
              <i class="fa fa-times"></i> Đã Hủy
              <span class="badge" style="background:#dd4b39;">${countCancelled}</span>
            </a>
          </div>
        </div>
      </div>

      <!-- Chi tiết đơn hàng (nếu có) -->
      <c:if test="${mode == 'viewDetail' and not empty selectedOrder}">
        <div class="row">
          <div class="col-xs-12">
            <div class="box box-info">
              <div class="box-header with-border">
                <h3 class="box-title">
                  <i class="fa fa-eye"></i> Chi Tiết Đơn #${orderID}
                  <c:if test="${not empty selectedOrder}">
                    — ${selectedOrder.customerName}
                    <span style="margin-left:10px;">
                      <c:choose>
                        <c:when test="${selectedOrder.status == 0}"><span class="status-badge status-pending">⏳ Chờ Xác Nhận</span></c:when>
                        <c:when test="${selectedOrder.status == 1}"><span class="status-badge status-shipping">🚚 Đang Giao</span></c:when>
                        <c:when test="${selectedOrder.status == 2}"><span class="status-badge status-completed">✅ Hoàn Thành</span></c:when>
                        <c:when test="${selectedOrder.status == 3}"><span class="status-badge status-cancelled">❌ Đã Hủy</span></c:when>
                      </c:choose>
                    </span>
                  </c:if>
                </h3>
                <div class="box-tools pull-right">
                  <a href="/admin/orderManager" class="btn btn-default btn-sm" style="border-radius:6px; font-weight:600;"><i class="fa fa-arrow-left"></i> Đóng Lại</a>
                </div>
              </div>
              <div class="box-body">
                <c:if test="${not empty selectedOrder}">
                  <div class="row" style="margin-bottom:20px;">
                    <div class="col-md-6">
                      <p><strong>Khách hàng:</strong> ${selectedOrder.customerName}</p>
                      <p><strong>Điện thoại:</strong> ${selectedOrder.phoneNumber}</p>
                      <p><strong>Địa chỉ:</strong> ${selectedOrder.address}</p>
                    </div>
                    <div class="col-md-6">
                      <p><strong>Ngày đặt:</strong> <fmt:formatDate value="${selectedOrder.date}" pattern="dd/MM/yyyy"/></p>
                      <p><strong>Tổng tiền:</strong> <span style="font-size:18px; font-weight:700; color:#e74c3c;"><fmt:formatNumber value="${selectedOrder.total}" pattern="#,###"/> đ</span></p>
                      <p><strong>Trạng thái:</strong>
                        <c:choose>
                          <c:when test="${selectedOrder.status == 0}"><span class="status-badge status-pending">⏳ Chờ Xác Nhận</span></c:when>
                          <c:when test="${selectedOrder.status == 1}"><span class="status-badge status-shipping">🚚 Đang Giao</span></c:when>
                          <c:when test="${selectedOrder.status == 2}"><span class="status-badge status-completed">✅ Hoàn Thành</span></c:when>
                          <c:when test="${selectedOrder.status == 3}"><span class="status-badge status-cancelled">❌ Đã Hủy</span></c:when>
                        </c:choose>
                      </p>
                    </div>
                  </div>
                  
                  <!-- Form đổi trạng thái dạng nút -->
                  <div style="margin-bottom:20px; padding: 15px 20px; background: #f8f9fa; border-radius: 8px; border: 1px solid #e9ecef; display: flex; align-items: center;">
                    <strong style="margin-right:20px; color:#444;">Thao tác nhanh:</strong>
                    <form action="/admin/updateOrderStatus" method="post" style="margin: 0; display: inline-block;">
                      <input type="hidden" name="orderID" value="${selectedOrder.id}"/>
                      
                      <button type="submit" name="orderStatus" value="0" class="btn btn-sm ${selectedOrder.status == 0 ? 'btn-warning active' : 'btn-default'}" style="border-radius:20px; padding: 6px 16px; margin-right:8px; font-weight:600; box-shadow:none;">
                        <i class="fa fa-clock-o"></i> Chờ Xác Nhận
                      </button>
                      
                      <button type="submit" name="orderStatus" value="1" class="btn btn-sm ${selectedOrder.status == 1 ? 'btn-info active' : 'btn-default'}" style="border-radius:20px; padding: 6px 16px; margin-right:8px; font-weight:600; box-shadow:none;">
                        <i class="fa fa-truck"></i> Đang Giao
                      </button>
                      
                      <button type="submit" name="orderStatus" value="2" class="btn btn-sm ${selectedOrder.status == 2 ? 'btn-success active' : 'btn-default'}" style="border-radius:20px; padding: 6px 16px; margin-right:8px; font-weight:600; box-shadow:none;" onclick="return confirm('Xác nhận Đã Giao Hàng Thành Công?');">
                        <i class="fa fa-check"></i> Hoàn Thành
                      </button>
                      
                      <button type="submit" name="orderStatus" value="3" class="btn btn-sm ${selectedOrder.status == 3 ? 'btn-danger active' : 'btn-default'}" style="border-radius:20px; padding: 6px 16px; font-weight:600; box-shadow:none;" onclick="return confirm('Bạn có chắc chắn muốn Hủy đơn hàng này?');">
                        <i class="fa fa-times"></i> Hủy Đơn
                      </button>
                    </form>
                  </div>
                </c:if>

                <table class="table table-bordered table-striped table-hover" style="margin-bottom:0;">
                  <thead style="background:#f4f6f9;">
                    <tr>
                      <th>Tên Sản Phẩm</th>
                      <th>Đơn Giá</th>
                      <th>Số Lượng</th>
                      <th>Thành Tiền</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="detail" items="${selectedOrder.orderDetails}">
                      <tr>
                        <td>${detail.product.name}</td>
                        <td><fmt:formatNumber value="${detail.product.price}" pattern="#,###"/> đ</td>
                        <td>${detail.quantity}</td>
                        <td><fmt:formatNumber value="${detail.amount}" pattern="#,###"/> đ</td>
                      </tr>
                    </c:forEach>
                    <c:if test="${empty selectedOrder.orderDetails}">
                      <tr>
                        <td colspan="4" class="text-center text-muted" style="padding: 30px;">
                          <i class="fa fa-box-open fa-3x" style="color: #bdc3c7; margin-bottom: 15px; display: block;"></i>
                          <span style="font-size: 15px;">Đơn hàng này không có sản phẩm nào (có thể là dữ liệu rác).</span>
                        </td>
                      </tr>
                    </c:if>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </c:if>

      <!-- Bảng đơn hàng -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">
                <i class="fa fa-list"></i>
                Danh Sách Đơn Hàng
                <c:choose>
                  <c:when test="${currentStatus == 0}"> — Chờ Xác Nhận</c:when>
                  <c:when test="${currentStatus == 1}"> — Đang Giao</c:when>
                  <c:when test="${currentStatus == 2}"> — Hoàn Thành</c:when>
                  <c:when test="${currentStatus == 3}"> — Đã Hủy</c:when>
                  <c:otherwise> — Tất Cả</c:otherwise>
                </c:choose>
              </h3>
            </div>
            <div class="box-body table-responsive">
              <%-- Bulk control nằm NGOÀI form để DataTable không di chuyển mất --%>
              <div class="bulk-action-wrapper">
                <span style="color:#666; font-size:13px; margin-right:8px;"><i class="fa fa-cogs"></i> Thao tác:</span>
                <select id="bulkStatusSelect" class="bulk-select">
                  <option value="" disabled selected>-- Chọn trạng thái mới --</option>
                  <option value="0">Chuyển sang Chờ Xác Nhận</option>
                  <option value="1">Chuyển sang Đang Giao</option>
                  <option value="2">Chuyển sang Hoàn Thành</option>
                  <option value="3">Chuyển sang Đã Hủy</option>
                </select>
                <button type="button" onclick="submitBulkAction()" class="btn-bulk-apply">
                  <i class="fa fa-check"></i> Áp Dụng
                </button>
              </div>

              <%-- Form ẩn - chỉ chứa hidden inputs, không chứa DataTable --%>
              <form id="bulkActionForm" action="/admin/bulkUpdateOrderStatus" method="post" style="display:none;">
                <input type="hidden" id="hiddenBulkStatus" name="bulkStatus" value="">
              </form>
              
                <table id="orderTable" class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width: 40px; text-align: center;">
                        <input type="checkbox" id="selectAll">
                      </th>
                      <th>#</th>
                      <th>Khách Hàng</th>
                      <th>SĐT</th>
                      <th>Địa Chỉ</th>
                      <th>Sản Phẩm</th>
                      <th>Tổng Tiền</th>
                      <th>Ngày Đặt</th>
                      <th>Trạng Thái</th>
                      <th>Thao Tác</th>
                    </tr>
                  </thead>
                <tbody>
                  <c:forEach var="order" items="${orders}">
                    <tr>
                      <td style="text-align: center;">
                        <input type="checkbox" name="orderIds" class="order-checkbox" value="${order.id}">
                      </td>
                      <td>${order.id}</td>
                      <td><strong>${order.customerName}</strong></td>
                      <td>${order.phoneNumber}</td>
                      <td style="max-width:180px; word-break:break-word;">${order.address}</td>
                      <td style="max-width:250px;">
                        <ul style="padding-left:15px; margin-bottom:0; font-size:13px; color:#555;">
                          <c:forEach var="detail" items="${order.orderDetails}">
                            <li>${detail.product.name} <strong>(x${detail.quantity})</strong></li>
                          </c:forEach>
                        </ul>
                      </td>
                      <td><strong><fmt:formatNumber value="${order.total}" pattern="#,###"/> đ</strong></td>
                      <td><fmt:formatDate value="${order.date}" pattern="dd/MM/yyyy"/></td>
                      <td>
                        <c:choose>
                          <c:when test="${order.status == 0}">
                            <span class="status-badge status-pending">⏳ Chờ Xác Nhận</span>
                          </c:when>
                          <c:when test="${order.status == 1}">
                            <span class="status-badge status-shipping">🚚 Đang Giao</span>
                          </c:when>
                          <c:when test="${order.status == 2}">
                            <span class="status-badge status-completed">✅ Hoàn Thành</span>
                          </c:when>
                          <c:when test="${order.status == 3}">
                            <span class="status-badge status-cancelled">❌ Đã Hủy</span>
                          </c:when>
                        </c:choose>
                      </td>
                      <td>
                        <a href="/admin/viewOrderDetail?orderID=${order.id}" class="btn btn-info btn-xs" title="Xem Chi Tiết">
                          <i class="fa fa-eye"></i>
                        </a>
                        <!-- Quick action buttons -->
                        <c:if test="${order.status == 0}">
                          <form action="/admin/updateOrderStatus" method="post" style="display:inline;">
                            <input type="hidden" name="orderID" value="${order.id}"/>
                            <input type="hidden" name="orderStatus" value="1"/>
                            <button type="submit" class="btn btn-primary btn-xs" title="Xác nhận giao">
                              <i class="fa fa-truck"></i>
                            </button>
                          </form>
                          <form action="/admin/updateOrderStatus" method="post" style="display:inline;" onsubmit="return confirm('Hủy đơn này?')">
                            <input type="hidden" name="orderID" value="${order.id}"/>
                            <input type="hidden" name="orderStatus" value="3"/>
                            <button type="submit" class="btn btn-danger btn-xs" title="Hủy đơn">
                              <i class="fa fa-times"></i>
                            </button>
                          </form>
                        </c:if>
                        <c:if test="${order.status == 1}">
                          <form action="/admin/updateOrderStatus" method="post" style="display:inline;">
                            <input type="hidden" name="orderID" value="${order.id}"/>
                            <input type="hidden" name="orderStatus" value="2"/>
                            <button type="submit" class="btn btn-success btn-xs" title="Hoàn thành">
                              <i class="fa fa-check"></i>
                            </button>
                          </form>
                        </c:if>
                      </td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empty orders}">
                    <tr><td colspan="10" class="text-center text-muted" style="padding:30px;">
                      <i class="fa fa-inbox fa-3x" style="display:block; margin-bottom:10px;"></i>
                      Không có đơn hàng nào
                    </td></tr>
                  </c:if>
                </tbody>
              </table>
              </form>
            </div>
          </div>
        </div>
      </div>

    </section>

    <footer style="border-top: 1px solid #d2d6de; text-align: center; background: #fff; color: #444; height: 50px; line-height: 50px;">
      <strong>Copyright &copy; 2024 | ShopMilk Admin</strong>
    </footer>
  </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark"></aside>
  <div class="control-sidebar-bg"></div>
</div>

<script src="/static/admin/jQuery/jQuery-2.2.0.min.js"></script>
<script src="/static/admin/js/bootstrap.min.js"></script>
<script src="/static/admin/datatables/jquery.dataTables.min.js"></script>
<script src="/static/admin/datatables/dataTables.bootstrap.min.js"></script>
<script src="/static/admin/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/static/admin/fastclick/fastclick.js"></script>
<script src="/static/admin/js/app.min.js"></script>
<script>
var dtTable;
$(function() {
  dtTable = $('#orderTable').DataTable({
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json"
    },
    "order": [[1, "desc"]],
    "pageLength": 15,
    "columnDefs": [
      { "orderable": false, "targets": 0 },
      { "type": "num", "targets": 1 }
    ]
  });

  // Select all: chỉ áp dụng cho các row đang hiển thị
  $('#selectAll').on('click', function(){
    var rows = dtTable.rows({ 'search': 'applied' }).nodes();
    $('input.order-checkbox', rows).prop('checked', this.checked);
  });
});

function submitBulkAction() {
  // Lấy status từ select nằm ngoài DataTable
  var status = $('#bulkStatusSelect').val();
  if (status === null || status === '') {
    alert('Vui lòng chọn trạng thái muốn cập nhật!');
    return;
  }

  // Lấy TẤT CẢ checked checkboxes (kể cả trang bị DataTable ẩn)
  var checkedIds = [];
  if (dtTable) {
    dtTable.rows().nodes().each(function(row) {
      var cb = $('input.order-checkbox:checked', row);
      if (cb.length) checkedIds.push(cb.val());
    });
  }
  // Fallback phòng khi dtTable chưa khởi tạo
  $('.order-checkbox:checked').each(function() {
    var v = $(this).val();
    if (checkedIds.indexOf(v) === -1) checkedIds.push(v);
  });

  if (checkedIds.length === 0) {
    alert('Vui lòng chọn ít nhất một đơn hàng!');
    return;
  }

  if (confirm('Bạn có chắc chắn muốn thay đổi trạng thái cho ' + checkedIds.length + ' đơn hàng đã chọn?')) {
    var form = $('#bulkActionForm');
    // Gán bulkStatus vào hidden input
    $('#hiddenBulkStatus').val(status);
    // Xóa orderIds cũ (nếu đã gọi trước đó)
    form.find('input[name="orderIds"]').remove();
    // Thêm từng orderId
    $.each(checkedIds, function(i, id) {
      form.append($('<input>').attr({ type: 'hidden', name: 'orderIds', value: id }));
    });
    form.submit();
  }
}
</script>
</body>
</html>
