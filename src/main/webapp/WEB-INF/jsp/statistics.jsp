<%@ page pageEncoding="utf-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Thống Kê & Báo Cáo - Admin</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="/static/admin/css/bootstrap.min.css">
        <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="/static/admin/css/AdminLTE.min.css">
        <link rel="stylesheet" href="/static/admin/css/skins/_all-skins.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
        <style>
          body,
          .main-header .logo,
          .main-sidebar {
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

          .box {
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
            border: none;
          }

          .box-header {
            border-bottom: 2px solid #f0f0f0;
            border-radius: 10px 10px 0 0;
          }

          .stat-card {
            border-radius: 12px;
            padding: 24px;
            color: white;
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
          }

          .stat-card .icon-bg {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 60px;
            opacity: 0.2;
          }

          .stat-card h2 {
            font-size: 42px;
            font-weight: 700;
            margin: 0;
          }

          .stat-card p {
            margin: 5px 0 0;
            font-size: 14px;
            opacity: 0.9;
          }

          .stat-total {
            background: linear-gradient(135deg, #667eea, #764ba2);
          }

          .stat-users {
            background: linear-gradient(135deg, #f093fb, #f5576c);
          }

          .stat-revenue {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            color: #222;
          }

          .stat-revenue h2,
          .stat-revenue p {
            color: #222;
          }

          .stat-orders {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            color: #222;
          }

          .stat-orders h2,
          .stat-orders p {
            color: #222;
          }

          .chart-wrapper {
            padding: 10px 0;
          }

          .section-title {
            font-size: 16px;
            font-weight: 600;
            color: #444;
            margin: 0;
          }

          .progress-item {
            margin-bottom: 24px;
          }

          .progress-item .label-name {
            font-weight: 500;
            color: #555;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
          }

          .progress-item .progress {
            margin-bottom: 0;
            border-radius: 4px;
          }

          .progress-item .count {
            float: right;
            font-weight: 600;
          }
        </style>
      </head>

      <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

          <jsp:include page="admin/header.jsp" />
          <jsp:include page="admin/sidebar.jsp">
            <jsp:param name="active" value="statistics" />
          </jsp:include>

          <div class="content-wrapper" style="background:#f4f6fb;">
            <section class="content-header" style="background:#0c1a2e; padding: 16px 24px;">
              <h1 style="color:#fff; font-size:20px; font-weight:700; margin:0;">
                <i class="fa fa-bar-chart" style="color:#4fc3f7; margin-right:8px;"></i>
                Thống Kê & Báo Cáo
                <small style="font-size:13px; color:#90caf9; font-weight:400; margin-left:8px;">Tổng hợp dữ liệu kinh doanh</small>
              </h1>
              <ol class="breadcrumb" style="background:transparent; margin:4px 0 0; padding:0;">
                <li><a href="/admin" style="color:#90caf9;"><i class="fa fa-dashboard"></i> Trang Chủ</a></li>
                <li class="active" style="color:#fff;">Thống Kê</li>
              </ol>
            </section>

            <section class="content">

              <!-- KPI Cards -->
              <div class="row">
                <div class="col-md-3 col-sm-6">
                  <div class="stat-card stat-total">
                    <span class="icon-bg"><i class="fa fa-shopping-bag"></i></span>
                    <h2>${totalProducts}</h2>
                    <p>Tổng Sản Phẩm</p>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="stat-card stat-users">
                    <span class="icon-bg"><i class="fa fa-users"></i></span>
                    <h2>${totalUsers}</h2>
                    <p>Tổng Người Dùng</p>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="stat-card stat-orders">
                    <span class="icon-bg"><i class="fa fa-check-circle"></i></span>
                    <h2>${countCompleted}</h2>
                    <p>Đơn Hoàn Thành</p>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="stat-card" style="background: linear-gradient(135deg, #fa709a, #fee140);">
                    <span class="icon-bg" style="color:#333;"><i class="fa fa-times-circle"></i></span>
                    <h2 style="color:#333;">${countCancelled}</h2>
                    <p style="color:#333; opacity:0.8;">Đơn Đã Hủy</p>
                  </div>
                </div>
              </div>

              <!-- Row 1: Biểu đồ doanh thu + Trạng thái đơn -->
              <div class="row">
                <div class="col-md-8">
                  <div class="box">
                    <div class="box-header with-border">
                      <h3 class="section-title"><i class="fa fa-line-chart text-blue"></i> Doanh Thu Theo Tháng (Đơn
                        Hoàn Thành)</h3>
                    </div>
                    <div class="box-body chart-wrapper">
                      <canvas id="revenueLineChart" style="min-height:360px; max-height:360px;"></canvas>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="box">
                    <div class="box-header with-border">
                      <h3 class="section-title"><i class="fa fa-pie-chart text-red"></i> Phân Bổ Trạng Thái Đơn</h3>
                    </div>
                    <div class="box-body chart-wrapper">
                      <canvas id="statusPieChart" style="min-height:270px; max-height:270px;"></canvas>
                      <!-- Legend 2 cột (Flex) -->
                      <div style="display: flex; flex-wrap: wrap; justify-content: space-between; margin-top:20px; padding: 0 15px;">
                        <div style="width: 48%;">
                          <div class="progress-item" style="margin-bottom:12px;">
                            <span class="label-name" style="font-size:13px; margin-bottom:4px;">
                              <span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#f39c12;margin-right:6px;"></span>
                              <span style="flex-grow: 1;">Chờ xác nhận</span>
                              <span class="count">${countPending}</span>
                            </span>
                            <div class="progress progress-sm" style="height:6px; margin-bottom:0;">
                              <div class="progress-bar" style="background:#f39c12; width:${(countPending+countShipping+countCompleted+countCancelled) > 0 ? (countPending*100/(countPending+countShipping+countCompleted+countCancelled)) : 0}%"></div>
                            </div>
                          </div>
                        </div>
                        <div style="width: 48%;">
                          <div class="progress-item" style="margin-bottom:12px;">
                            <span class="label-name" style="font-size:13px; margin-bottom:4px;">
                              <span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#00c0ef;margin-right:6px;"></span>
                              <span style="flex-grow: 1;">Đang giao</span>
                              <span class="count">${countShipping}</span>
                            </span>
                            <div class="progress progress-sm" style="height:6px; margin-bottom:0;">
                              <div class="progress-bar" style="background:#00c0ef; width:${(countPending+countShipping+countCompleted+countCancelled) > 0 ? (countShipping*100/(countPending+countShipping+countCompleted+countCancelled)) : 0}%"></div>
                            </div>
                          </div>
                        </div>
                        <div style="width: 48%;">
                          <div class="progress-item" style="margin-bottom:0;">
                            <span class="label-name" style="font-size:13px; margin-bottom:4px;">
                              <span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#00a65a;margin-right:6px;"></span>
                              <span style="flex-grow: 1;">Hoàn thành</span>
                              <span class="count">${countCompleted}</span>
                            </span>
                            <div class="progress progress-sm" style="height:6px; margin-bottom:0;">
                              <div class="progress-bar" style="background:#00a65a; width:${(countPending+countShipping+countCompleted+countCancelled) > 0 ? (countCompleted*100/(countPending+countShipping+countCompleted+countCancelled)) : 0}%"></div>
                            </div>
                          </div>
                        </div>
                        <div style="width: 48%;">
                          <div class="progress-item" style="margin-bottom:0;">
                            <span class="label-name" style="font-size:13px; margin-bottom:4px;">
                              <span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#dd4b39;margin-right:6px;"></span>
                              <span style="flex-grow: 1;">Đã hủy</span>
                              <span class="count">${countCancelled}</span>
                            </span>
                            <div class="progress progress-sm" style="height:6px; margin-bottom:0;">
                              <div class="progress-bar" style="background:#dd4b39; width:${(countPending+countShipping+countCompleted+countCancelled) > 0 ? (countCancelled*100/(countPending+countShipping+countCompleted+countCancelled)) : 0}%"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Row 2: Biểu đồ tồn kho vs đã bán -->
              <div class="row">
                <div class="col-md-4">
                  <div class="box">
                    <div class="box-header with-border">
                      <h3 class="section-title"><i class="fa fa-pie-chart text-green"></i> Tỉ Lệ Tồn Kho & Đã Bán</h3>
                    </div>
                    <div class="box-body chart-wrapper">
                      <canvas id="stockSoldChart" style="min-height:270px; max-height:270px;"></canvas>
                      <!-- Legend 2 cột (Flex) -->
                      <div style="display: flex; flex-wrap: wrap; justify-content: space-between; margin-top:20px; padding: 0 15px;">
                        <div style="width: 48%;">
                          <div class="progress-item" style="margin-bottom:0;">
                            <span class="label-name" style="font-size:13px; margin-bottom:4px;">
                              <span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#3498db;margin-right:6px;"></span>
                              <span style="flex-grow: 1;">Tồn Kho</span>
                              <span class="count">${sumStock}</span>
                            </span>
                            <div class="progress progress-sm" style="height:6px; margin-bottom:0;">
                              <div class="progress-bar" style="background:#3498db; width:${(sumStock+sumSold) > 0 ? (sumStock*100/(sumStock+sumSold)) : 0}%"></div>
                            </div>
                          </div>
                        </div>
                        <div style="width: 48%;">
                          <div class="progress-item" style="margin-bottom:0;">
                            <span class="label-name" style="font-size:13px; margin-bottom:4px;">
                              <span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:#2ecc71;margin-right:6px;"></span>
                              <span style="flex-grow: 1;">Đã Bán</span>
                              <span class="count">${sumSold}</span>
                            </span>
                            <div class="progress progress-sm" style="height:6px; margin-bottom:0;">
                              <div class="progress-bar" style="background:#2ecc71; width:${(sumStock+sumSold) > 0 ? (sumSold*100/(sumStock+sumSold)) : 0}%"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="col-md-8">
                  <div class="box">
                    <div class="box-header with-border">
                      <h3 class="section-title"><i class="fa fa-table text-aqua"></i> Bảng Chi Tiết Top 10 Sản Phẩm</h3>
                    </div>
                    <div class="box-body table-responsive">
                      <table class="table table-striped table-hover table-bordered" style="margin-top:0;">
                        <thead style="background:#0c1a2e; color:#fff;">
                          <tr>
                            <th>#</th>
                            <th>Tên Sản Phẩm</th>
                            <th style="text-align:center;">Tồn Kho</th>
                            <th style="text-align:center;">Đã Bán</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="name" items="${productNames}" varStatus="loop">
                            <tr>
                              <td style="width:50px;">${loop.index + 1}</td>
                              <td><strong><c:out value="${name}" /></strong></td>
                              <td style="text-align:center;">
                                <span class="label" style="background:#3498db; font-size:12px;">${stockList[loop.index]}</span>
                              </td>
                              <td style="text-align:center;">
                                <span class="label" style="background:#2ecc71; font-size:12px;">${soldList[loop.index]}</span>
                              </td>
                            </tr>
                          </c:forEach>
                          <c:if test="${empty productNames}">
                            <tr><td colspan="4" class="text-center text-muted">Chưa có dữ liệu</td></tr>
                          </c:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Bảng chi tiết tồn kho -->
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header with-border">
                      <h3 class="section-title"><i class="fa fa-table text-aqua"></i> Bảng Chi Tiết Sản Phẩm</h3>
                    </div>
                    <div class="box-body table-responsive">
                      <table class="table table-hover table-bordered">
                        <thead style="background:#f4f6f9;">
                          <tr>
                            <th>#</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Tồn Kho</th>
                            <th>Đã Bán</th>
                            <th>Tỉ Lệ Bán</th>
                            <th>Trạng Thái</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="row" items="${productNames}" varStatus="loop">
                            <c:set var="stock" value="${stockList[loop.index]}" />
                            <c:set var="sold" value="${soldList[loop.index]}" />
                            <c:set var="total" value="${stock + sold}" />
                            <tr>
                              <td>${loop.count}</td>
                              <td><strong>${row}</strong></td>
                              <td><span class="badge" style="background:#3498db; font-size:13px;">${stock}</span></td>
                              <td><span class="badge" style="background:#2ecc71; font-size:13px;">${sold}</span></td>
                              <td style="min-width:150px;">
                                <c:choose>
                                  <c:when test="${total > 0}">
                                    <div class="progress progress-sm" style="margin:0;">
                                      <div class="progress-bar progress-bar-success" style="width:${sold*100/total}%">
                                      </div>
                                    </div>
                                    <small class="text-muted">
                                      <fmt:formatNumber value="${sold*100/total}" pattern="0.0" />% đã bán
                                    </small>
                                  </c:when>
                                  <c:otherwise><small class="text-muted">0%</small></c:otherwise>
                                </c:choose>
                              </td>
                              <td>
                                <c:choose>
                                  <c:when test="${stock == 0}">
                                    <span class="label label-danger">Hết hàng</span>
                                  </c:when>
                                  <c:when test="${stock < 10}">
                                    <span class="label label-warning">Sắp hết</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="label label-success">Còn hàng</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                            </tr>
                          </c:forEach>
                          <c:if test="${empty productNames}">
                            <tr>
                              <td colspan="6" class="text-center text-muted" style="padding:30px;">
                                <i class="fa fa-info-circle fa-2x" style="display:block; margin-bottom:8px;"></i>
                                Chưa có dữ liệu thống kê
                              </td>
                            </tr>
                          </c:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>

            </section>

            <footer
              style="border-top:1px solid #d2d6de; text-align:center; background:#fff; color:#444; height:50px; line-height:50px;">
              <strong>Copyright &copy; 2026 | ShopMilk Admin</strong>
            </footer>
          </div>

          <aside class="control-sidebar control-sidebar-dark"></aside>
          <div class="control-sidebar-bg"></div>
        </div>

        <script src="/static/admin/jQuery/jQuery-2.2.0.min.js"></script>
        <script src="/static/admin/js/bootstrap.min.js"></script>
        <script src="/static/admin/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="/static/admin/fastclick/fastclick.js"></script>
        <script src="/static/admin/js/app.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
        <script>
          // ========================
          // Data từ server
          // ========================
          var revenueData = [
  <c:forEach var="rev" items="${revenueByMonth}" varStatus="loop">
    ${rev}<c:if test="${!loop.last}">,</c:if>
  </c:forEach>
  <c:if test="${empty revenueByMonth}">0,0,0,0,0,0,0,0,0,0,0,0</c:if>
          ];

          var productLabels = [
  <c:forEach var="name" items="${productNames}" varStatus="loop">
    "<c:out value='${name}'/>"
    <c:if test="${!loop.last}">,</c:if>
  </c:forEach>
  <c:if test="${empty productNames}">""</c:if>
          ];
          var stockData = [
  <c:forEach var="s" items="${stockList}" varStatus="loop">
    ${s}<c:if test="${!loop.last}">,</c:if>
  </c:forEach>
  <c:if test="${empty stockList}">0</c:if>
          ];
          var soldData = [
  <c:forEach var="s" items="${soldList}" varStatus="loop">
    ${s}<c:if test="${!loop.last}">,</c:if>
  </c:forEach>
  <c:if test="${empty soldList}">0</c:if>
          ];

          // ========================
          // 1. Biểu đồ doanh thu Line
          // ========================
          new Chart(document.getElementById('revenueLineChart'), {
            type: 'line',
            data: {
              labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
              datasets: [{
                label: 'Doanh Thu (VNĐ)',
                data: revenueData,
                borderColor: '#4facfe',
                backgroundColor: 'rgba(79, 172, 254, 0.15)',
                borderWidth: 3,
                pointBackgroundColor: '#4facfe',
                pointRadius: 5,
                pointHoverRadius: 7,
                fill: true,
                tension: 0.4
              }]
            },
            options: {
              responsive: true,
              plugins: {
                legend: { display: false },
                tooltip: {
                  callbacks: {
                    label: function (ctx) {
                      var val = ctx.raw;
                      if (val >= 1000000) return 'Doanh thu: ' + (val / 1000000).toFixed(1) + ' triệu đ';
                      if (val >= 1000) return 'Doanh thu: ' + (val / 1000).toFixed(0) + 'K đ';
                      return 'Doanh thu: ' + val + ' đ';
                    }
                  }
                }
              },
              scales: {
                y: {
                  beginAtZero: true,
                  grid: { color: 'rgba(0,0,0,0.05)' },
                  ticks: {
                    callback: function (val) {
                      if (val >= 1000000) return (val / 1000000).toFixed(0) + 'M';
                      if (val >= 1000) return (val / 1000).toFixed(0) + 'K';
                      return val;
                    }
                  }
                },
                x: { grid: { display: false } }
              }
            }
          });

          // ========================
          // 2. Biểu đồ trạng thái đơn Pie
          // ========================
          new Chart(document.getElementById('statusPieChart'), {
            type: 'doughnut',
            data: {
              labels: ['Chờ xác nhận', 'Đang giao', 'Hoàn thành', 'Đã hủy'],
              datasets: [{
                data: [
                  ${ not empty countPending? countPending: 0 },
                  ${ not empty countShipping? countShipping: 0 },
                  ${ not empty countCompleted? countCompleted: 0 },
                  ${ not empty countCancelled? countCancelled: 0 }
                ],
                backgroundColor: ['#f39c12', '#00c0ef', '#00a65a', '#dd4b39'],
                borderWidth: 3,
                borderColor: '#fff',
                hoverOffset: 8
              }]
            },
            options: {
              responsive: true,
              maintainAspectRatio: false,
              cutout: '65%',
              plugins: {
                legend: { display: false }
              }
            }
          });

          // ========================
          // 3. Biểu đồ Tồn kho vs Đã bán (Doughnut)
          // ========================
          new Chart(document.getElementById('stockSoldChart'), {
            type: 'doughnut',
            data: {
              labels: ['Tồn Kho', 'Đã Bán'],
              datasets: [{
                data: [
                  ${ not empty sumStock ? sumStock : 0 },
                  ${ not empty sumSold ? sumSold : 0 }
                ],
                backgroundColor: ['#3498db', '#2ecc71'],
                borderWidth: 3,
                borderColor: '#fff',
                hoverOffset: 8
              }]
            },
            options: {
              responsive: true,
              maintainAspectRatio: false,
              cutout: '65%',
              plugins: {
                legend: { display: false }
              }
            }
          });
        </script>
      </body>

      </html>