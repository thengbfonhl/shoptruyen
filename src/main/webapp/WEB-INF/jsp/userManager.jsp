<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản Lý Người Dùng - Admin</title>
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

  .box { border: none; border-radius: 14px; box-shadow: 0 3px 14px rgba(0,0,0,0.09); margin-bottom: 22px; }
  .box-header { background: #0c1a2e; color: #fff; border-radius: 14px 14px 0 0; padding: 14px 18px; }
  .box-header .box-title { color: #fff; font-size: 16px; font-weight: 600; }
  .box-body { border-radius: 0 0 14px 14px; padding: 20px; }
  
  table.dataTable thead th { background: #0c1a2e; color: #fff; border: none; font-weight: 500; }

  .role-badge { border-radius: 12px; padding: 4px 12px; font-size: 12px; font-weight: 600; display: inline-block; }
  .role-admin { background: #e74c3c; color: #fff; }
  .role-user  { background: #3498db; color: #fff; }
  .user-avatar { width: 36px; height: 36px; border-radius: 50%; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: inline-flex; align-items: center; justify-content: center; color: white; font-weight: 600; font-size: 14px; margin-right: 8px; vertical-align: middle; }
  .action-btn { border-radius: 6px; padding: 4px 10px; font-size: 12px; }
  .select-role { border-radius: 15px; padding: 3px 10px; font-size: 12px; border: 1px solid #ccc; cursor: pointer; }

  /* KPI Cards for User Manager */
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
  .kpi-total   { background: linear-gradient(135deg, #0061a8, #00c6fb); }
  .kpi-admin   { background: linear-gradient(135deg, #c0392b, #ff6b6b); }
  .kpi-user    { background: linear-gradient(135deg, #11998e, #38ef7d); }
  .kpi-active  { background: linear-gradient(135deg, #4b2fc7, #764ba2); }
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="admin/header.jsp" />
  <jsp:include page="admin/sidebar.jsp">
    <jsp:param name="active" value="user"/>
  </jsp:include>

  <div class="content-wrapper" style="background:#f4f6fb;">
    <section class="content-header" style="background:#0c1a2e; padding: 16px 24px;">
      <h1 style="color:#fff; font-size:20px; font-weight:700; margin:0;">
        <i class="fa fa-users" style="color:#4fc3f7; margin-right:8px;"></i> Quản Lý Người Dùng
        <small style="font-size:13px; color:#90caf9; font-weight:400; margin-left:8px;">Danh sách và phân quyền</small>
      </h1>
      <ol class="breadcrumb" style="background:transparent; margin:4px 0 0; padding:0;">
        <li><a href="/admin" style="color:#90caf9;"><i class="fa fa-dashboard"></i> Trang Chủ</a></li>
        <li class="active" style="color:#fff;">Người Dùng</li>
      </ol>
    </section>

    <section class="content">

      <!-- Flash message -->
      <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert"><span>&times;</span></button>
          <i class="fa fa-check-circle"></i> ${message}
        </div>
      </c:if>

      <!-- Stat row -->
      <div class="row">
        <div class="col-md-3 col-xs-6">
          <div class="kpi-card kpi-total">
            <i class="fa fa-users kpi-icon"></i>
            <h2>${totalUsers}</h2>
            <p>Tổng Người Dùng</p>
          </div>
        </div>
        <div class="col-md-3 col-xs-6">
          <div class="kpi-card kpi-admin">
            <i class="fa fa-user-secret kpi-icon"></i>
            <h2 id="adminCount">...</h2>
            <p>Quản Trị Viên</p>
          </div>
        </div>
        <div class="col-md-3 col-xs-6">
          <div class="kpi-card kpi-user">
            <i class="fa fa-user kpi-icon"></i>
            <h2 id="userCount">...</h2>
            <p>Người Dùng Thường</p>
          </div>
        </div>
        <div class="col-md-3 col-xs-6">
          <div class="kpi-card kpi-active">
            <i class="fa fa-check kpi-icon"></i>
            <h2>100%</h2>
            <p>Tỉ Lệ Hoạt Động</p>
          </div>
        </div>
      </div>

      <!-- Bảng người dùng -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-table"></i> Danh Sách Người Dùng</h3>
              <div class="box-tools pull-right">
                <a href="/register" class="btn btn-success btn-sm">
                  <i class="fa fa-plus"></i> Thêm Người Dùng
                </a>
              </div>
            </div>
            <div class="box-body table-responsive">
              <table id="userTable" class="table table-bordered table-striped table-hover">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Người Dùng</th>
                    <th>Email</th>
                    <th>Họ</th>
                    <th>Tên</th>
                    <th>Vai Trò</th>
                    <th>Phân Quyền</th>
                    <th>Thao Tác</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="user" items="${users}">
                    <tr>
                      <td>${user.id}</td>
                      <td>
                        <span class="user-avatar">
                          ${not empty user.firstName ? user.firstName.substring(0,1).toUpperCase() : 'U'}
                        </span>
                        ${user.firstName} ${user.lastName}
                      </td>
                      <td>${user.mail}</td>
                      <td>${user.firstName}</td>
                      <td>${user.lastName}</td>
                      <td>
                        <c:choose>
                          <c:when test="${user.role == 'admin'}">
                            <span class="role-badge role-admin"><i class="fa fa-star"></i> Admin</span>
                          </c:when>
                          <c:otherwise>
                            <span class="role-badge role-user"><i class="fa fa-user"></i> User</span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td>
                        <form action="/admin/updateUserRole" method="post" style="display:inline;">
                          <input type="hidden" name="userId" value="${user.id}"/>
                          <select name="role" class="select-role" onchange="this.form.submit()" title="Đổi quyền">
                            <option value="user"  ${user.role == 'user'  ? 'selected' : ''}>👤 User</option>
                            <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>⭐ Admin</option>
                          </select>
                        </form>
                      </td>
                      <td>
                        <a href="/admin/user/${user.id}/delete"
                           class="btn btn-danger btn-xs action-btn"
                           onclick="return confirm('Bạn chắc chắn muốn xóa người dùng ${user.firstName} ${user.lastName}?')">
                          <i class="fa fa-trash"></i> Xóa
                        </a>
                      </td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empty users}">
                    <tr><td colspan="8" class="text-center text-muted" style="padding:30px;">
                      <i class="fa fa-user-times fa-3x" style="display:block; margin-bottom:10px;"></i>
                      Chưa có người dùng nào
                    </td></tr>
                  </c:if>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

    </section>

    <footer style="border-top:1px solid #d2d6de; text-align:center; background:#fff; color:#444; height:50px; line-height:50px;">
      <strong>Copyright &copy; 2026 | ShopMilk Admin</strong>
    </footer>
  </div>

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
$(function() {
  var table = $('#userTable').DataTable({
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json"
    },
    "order": [[0, "asc"]],
    "pageLength": 15,
    "columnDefs": [{ "orderable": false, "targets": [6, 7] }]
  });

  // Tính số admin/user
  var adminCnt = 0, userCnt = 0;
  $('#userTable tbody tr').each(function() {
    var roleTd = $(this).find('td:eq(5)').text().trim();
    if(roleTd.indexOf('Admin') >= 0) adminCnt++;
    else userCnt++;
  });
  $('#adminCount').text(adminCnt);
  $('#userCount').text(userCnt);
});
</script>
</body>
</html>
