<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
/* ===== Dashboard modern style theo theme trang Home ===== */
.dash-kpi-row { margin-bottom: 24px; }
.kpi-card {
  border-radius: 14px;
  padding: 22px 20px;
  color: #fff;
  position: relative;
  overflow: hidden;
  box-shadow: 0 4px 18px rgba(0,0,0,0.13);
  margin-bottom: 16px;
  transition: transform 0.2s, box-shadow 0.2s;
  text-decoration: none;
  display: block;
}
.kpi-card:hover { transform: translateY(-3px); box-shadow: 0 8px 28px rgba(0,0,0,0.18); }
.kpi-card .kpi-icon {
  position: absolute; right: 18px; top: 50%; transform: translateY(-50%);
  font-size: 52px; opacity: 0.18;
}
.kpi-card h2 { font-size: 36px; font-weight: 700; margin: 0 0 4px; }
.kpi-card p  { margin: 0; font-size: 13px; opacity: 0.9; font-weight: 500; }
.kpi-card .kpi-link { display:block; margin-top:10px; font-size:12px; opacity:0.85; }

.kpi-pending   { background: linear-gradient(135deg, #f7971e, #ffd200); }
.kpi-shipping  { background: linear-gradient(135deg, #0061a8, #00c6fb); }
.kpi-done      { background: linear-gradient(135deg, #11998e, #38ef7d); color:#fff; }
.kpi-cancelled { background: linear-gradient(135deg, #c0392b, #ff6b6b); }
.kpi-products  { background: linear-gradient(135deg, #4b2fc7, #764ba2); }
.kpi-users     { background: linear-gradient(135deg, #0c1a2e, #1a73e8); }

.dash-box {
  border: none;
  border-radius: 14px;
  box-shadow: 0 3px 14px rgba(0,0,0,0.09);
  margin-bottom: 22px;
}
.dash-box .box-header {
  background: #0c1a2e;
  color: #fff;
  border-radius: 14px 14px 0 0;
  padding: 14px 18px;
}
.dash-box .box-header h3 {
  color: #fff;
  font-size: 15px;
  font-weight: 600;
  margin: 0;
}
.dash-box .box-header h3 i { margin-right: 8px; color: #4fc3f7; }
.dash-box .box-body { background: #fff; border-radius: 0 0 14px 14px; padding: 18px; }

.recent-table th {
  background: #0c1a2e;
  color: #fff;
  font-weight: 500;
  font-size: 13px;
  border: none !important;
}
.recent-table td { vertical-align: middle; font-size: 13px; border-color: #f0f4f8 !important; }
.recent-table tbody tr:hover { background: #f0f7ff; }
.btn-confirm-ship {
  background: linear-gradient(90deg,#0061a8,#00c6fb);
  color: #fff; border: none;
  border-radius: 20px; padding: 3px 12px; font-size: 12px;
}
.btn-confirm-ship:hover { opacity: 0.85; color:#fff; }
.badge-price {
  background: #e8f5e9; color: #2e7d32;
  border-radius: 20px; padding: 3px 9px; font-weight: 600; font-size:12px;
}
.section-divider {
  color: #0c1a2e; font-weight: 700; font-size: 16px;
  border-left: 4px solid #1a73e8; padding-left: 10px; margin: 22px 0 14px;
}
</style>

<div class="content-wrapper" style="background:#f4f6fb;">
  <!-- Page Header -->
  <section class="content-header" style="background:#0c1a2e; padding: 16px 24px;">
    <h1 style="color:#fff; font-size:20px; font-weight:700; margin:0;">
      <i class="fa fa-dashboard" style="color:#4fc3f7; margin-right:8px;"></i>
      Dashboard
      <small style="font-size:13px; color:#90caf9; font-weight:400; margin-left:8px;">Tổng quan hệ thống ShopMilk</small>
    </h1>
    <ol class="breadcrumb" style="background:transparent; margin:4px 0 0; padding:0;">
      <li><a href="/admin" style="color:#90caf9;"><i class="fa fa-home"></i> Trang Chủ</a></li>
      <li style="color:#fff;">Dashboard</li>
    </ol>
  </section>

  <section class="content" style="padding: 20px;">

    <!-- KPI Row 1: Đơn hàng -->
    <p class="section-divider"><i class="fa fa-shopping-cart"></i> Tình Trạng Đơn Hàng</p>
    <div class="row dash-kpi-row">
      <div class="col-md-3 col-sm-6">
        <a href="/admin/orderManager?status=0" class="kpi-card kpi-pending">
          <i class="fa fa-clock-o kpi-icon"></i>
          <h2>${pendingOrders}</h2>
          <p>Chờ Xác Nhận</p>
          <span class="kpi-link">Xem chi tiết <i class="fa fa-arrow-right"></i></span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="/admin/orderManager?status=1" class="kpi-card kpi-shipping">
          <i class="fa fa-truck kpi-icon"></i>
          <h2>${shippingOrders}</h2>
          <p>Đang Giao</p>
          <span class="kpi-link">Xem chi tiết <i class="fa fa-arrow-right"></i></span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="/admin/orderManager?status=2" class="kpi-card kpi-done">
          <i class="fa fa-check-circle kpi-icon"></i>
          <h2>${completedOrders}</h2>
          <p>Hoàn Thành</p>
          <span class="kpi-link">Xem chi tiết <i class="fa fa-arrow-right"></i></span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="/admin/orderManager?status=3" class="kpi-card kpi-cancelled">
          <i class="fa fa-times-circle kpi-icon"></i>
          <h2>${cancelledOrders}</h2>
          <p>Đã Hủy</p>
          <span class="kpi-link">Xem chi tiết <i class="fa fa-arrow-right"></i></span>
        </a>
      </div>
    </div>

    <!-- KPI Row 2: Tổng quan -->
    <div class="row" style="margin-bottom:22px;">
      <div class="col-md-6">
        <a href="/admin/productManager" class="kpi-card kpi-products" style="display:flex; align-items:center; gap:20px; padding:18px 24px;">
          <i class="fa fa-shopping-bag" style="font-size:38px; opacity:0.9;"></i>
          <div>
            <h2 style="font-size:30px;">${totalProducts}</h2>
            <p>Tổng Sản Phẩm Trong Kho</p>
          </div>
          <i class="fa fa-arrow-right" style="margin-left:auto; opacity:0.6; font-size:18px;"></i>
        </a>
      </div>
      <div class="col-md-6">
        <a href="/admin/userManager" class="kpi-card kpi-users" style="display:flex; align-items:center; gap:20px; padding:18px 24px;">
          <i class="fa fa-users" style="font-size:38px; opacity:0.9;"></i>
          <div>
            <h2 style="font-size:30px;">${totalUsers}</h2>
            <p>Tổng Tài Khoản Người Dùng</p>
          </div>
          <i class="fa fa-arrow-right" style="margin-left:auto; opacity:0.6; font-size:18px;"></i>
        </a>
      </div>
    </div>

    <!-- Biểu đồ -->
    <p class="section-divider"><i class="fa fa-bar-chart"></i> Thống Kê</p>
    <div class="row">
      <div class="col-md-8">
        <div class="dash-box">
          <div class="box-header">
            <h3><i class="fa fa-line-chart"></i> Doanh Thu Theo Tháng</h3>
          </div>
          <div class="box-body">
            <canvas id="revenueChart" style="min-height:260px;"></canvas>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="dash-box">
          <div class="box-header">
            <h3><i class="fa fa-pie-chart"></i> Trạng Thái Đơn</h3>
          </div>
          <div class="box-body">
            <canvas id="orderStatusChart" style="min-height:200px;"></canvas>
            <div style="margin-top:12px;">
              <div style="display:flex; justify-content:space-between; margin-bottom:5px;">
                <span><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#f7971e;margin-right:5px;"></span>Chờ xác nhận</span>
                <strong>${pendingOrders}</strong>
              </div>
              <div style="display:flex; justify-content:space-between; margin-bottom:5px;">
                <span><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#00c6fb;margin-right:5px;"></span>Đang giao</span>
                <strong>${shippingOrders}</strong>
              </div>
              <div style="display:flex; justify-content:space-between; margin-bottom:5px;">
                <span><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#38ef7d;margin-right:5px;"></span>Hoàn thành</span>
                <strong>${completedOrders}</strong>
              </div>
              <div style="display:flex; justify-content:space-between;">
                <span><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#ff6b6b;margin-right:5px;"></span>Đã hủy</span>
                <strong>${cancelledOrders}</strong>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Đơn hàng chờ -->
    <p class="section-divider"><i class="fa fa-list-alt"></i> Đơn Hàng Chờ Xác Nhận</p>
    <div class="dash-box">
      <div class="box-header" style="display:flex; justify-content:space-between; align-items:center;">
        <h3><i class="fa fa-clock-o"></i> Cần Xử Lý</h3>
        <a href="/admin/orderManager" class="btn btn-sm" style="background:#1a73e8; color:#fff; border-radius:20px; font-size:12px;">
          Xem Tất Cả <i class="fa fa-arrow-right"></i>
        </a>
      </div>
      <div class="box-body" style="padding:0;">
        <table class="table recent-table" style="margin:0;">
          <thead>
            <tr>
              <th style="padding:12px 16px;">#</th>
              <th>Khách Hàng</th>
              <th>SĐT</th>
              <th>Địa Chỉ</th>
              <th>Sản Phẩm</th>
              <th>Tổng Tiền</th>
              <th>Ngày</th>
              <th>Thao Tác</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="order" items="${recentOrders}">
              <tr>
                <td style="padding:10px 16px; font-weight:600; color:#0c1a2e;">#${order.id}</td>
                <td><strong>${order.customerName}</strong></td>
                <td>${order.phoneNumber}</td>
                <td style="max-width:160px; word-break:break-word; font-size:12px; color:#666;">${order.address}</td>
                <td style="max-width:200px;">
                  <ul style="padding-left:15px; margin-bottom:0; font-size:12px; color:#555;">
                    <c:forEach var="detail" items="${order.orderDetails}">
                      <li>${detail.product.name} <strong>(x${detail.quantity})</strong></li>
                    </c:forEach>
                  </ul>
                </td>
                <td><span class="badge-price"><fmt:formatNumber value="${order.total}" pattern="#,###"/> đ</span></td>
                <td style="font-size:12px; color:#888;"><fmt:formatDate value="${order.date}" pattern="dd/MM/yyyy"/></td>
                <td>
                  <a href="/admin/viewOrderDetail?orderID=${order.id}"
                     class="btn btn-default btn-xs" style="color:#1a73e8; margin-right:4px;" title="Xem Chi Tiết">
                    <i class="fa fa-eye"></i>
                  </a>
                  <form action="/admin/updateOrderStatus" method="post" style="display:inline;">
                    <input type="hidden" name="orderID" value="${order.id}"/>
                    <input type="hidden" name="orderStatus" value="1"/>
                    <button type="submit" class="btn btn-primary btn-xs" title="Xác nhận giao">
                      <i class="fa fa-truck"></i>
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            <c:if test="${empty recentOrders}">
              <tr>
                <td colspan="8" style="text-align:center; padding:30px; color:#aaa;">
                  <i class="fa fa-check-circle" style="font-size:28px; display:block; margin-bottom:8px; color:#4CAF50;"></i>
                  Không có đơn hàng nào đang chờ xác nhận
                </td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </div>
    </div>

  </section>
</div>

<script>
// Fix lỗi EL null: dùng c:out với default="0"
var pendingOrders   = parseInt('<c:out value="${pendingOrders}"   default="0"/>') || 0;
var shippingOrders  = parseInt('<c:out value="${shippingOrders}"  default="0"/>') || 0;
var completedOrders = parseInt('<c:out value="${completedOrders}" default="0"/>') || 0;
var cancelledOrders = parseInt('<c:out value="${cancelledOrders}" default="0"/>') || 0;

var revenueData = [
  <c:forEach var="rev" items="${revenueByMonth}" varStatus="loop">
    <c:out value="${rev}" default="0"/><c:if test="${!loop.last}">,</c:if>
  </c:forEach>
  <c:if test="${empty revenueByMonth}">0,0,0,0,0,0,0,0,0,0,0,0</c:if>
];

// Biểu đồ doanh thu
new Chart(document.getElementById('revenueChart'), {
  type: 'bar',
  data: {
    labels: ['T1','T2','T3','T4','T5','T6','T7','T8','T9','T10','T11','T12'],
    datasets: [{
      label: 'Doanh thu (VNĐ)',
      data: revenueData,
      backgroundColor: 'rgba(26,115,232,0.75)',
      borderColor: '#1a73e8',
      borderWidth: 0,
      borderRadius: 6,
      hoverBackgroundColor: '#0c1a2e'
    }]
  },
  options: {
    responsive: true,
    plugins: { legend: { display: false } },
    scales: {
      y: {
        beginAtZero: true,
        grid: { color: 'rgba(0,0,0,0.04)' },
        ticks: {
          callback: function(val) {
            if(val >= 1000000) return (val/1000000).toFixed(0)+'M';
            if(val >= 1000)    return (val/1000).toFixed(0)+'K';
            return val;
          }
        }
      },
      x: { grid: { display: false } }
    }
  }
});

// Biểu đồ donut trạng thái
new Chart(document.getElementById('orderStatusChart'), {
  type: 'doughnut',
  data: {
    labels: ['Chờ xác nhận','Đang giao','Hoàn thành','Đã hủy'],
    datasets: [{
      data: [pendingOrders, shippingOrders, completedOrders, cancelledOrders],
      backgroundColor: ['#f7971e','#00c6fb','#38ef7d','#ff6b6b'],
      borderWidth: 3,
      borderColor: '#fff',
      hoverOffset: 6
    }]
  },
  options: {
    responsive: true,
    cutout: '68%',
    plugins: { legend: { display: false } }
  }
});
</script>