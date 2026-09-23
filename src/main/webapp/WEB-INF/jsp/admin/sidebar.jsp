<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<aside class="main-sidebar">
    <section class="sidebar">
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/static/admin/img/avatar04.png" class="img-circle" >
        </div>
        <div class="pull-left info">
          <p>Admin Panel</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">ĐIỀU HƯỚNG</li>

        <li class="${param.active == 'dashboard' ? 'active' : ''}">
          <a href="/admin">
            <i class="fa fa-dashboard"></i> <span>Tổng Quan</span>
          </a>
        </li>

        <li class="treeview ${param.active == 'product' || param.active == 'category' ? 'active menu-open' : ''}">
          <a href="#">
            <i class="fa fa-shopping-bag"></i>
            <span>Sản Phẩm</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="${param.active == 'product' ? 'active' : ''}">
              <a href="/admin/productManager"><i class="fa fa-list"></i> Danh Sách Sản Phẩm</a>
            </li>
            <li>
              <a href="/admin/addProduct"><i class="fa fa-plus-circle"></i> Thêm Sản Phẩm</a>
            </li>
            <li class="${param.active == 'category' ? 'active' : ''}">
              <a href="/admin/categoryManager"><i class="fa fa-tags"></i> Quản Lý Danh Mục</a>
            </li>
          </ul>
        </li>

        <li class="${param.active == 'order' ? 'active' : ''}">
          <a href="/admin/orderManager">
            <i class="fa fa-shopping-cart"></i>
            <span>Quản Lý Đơn Hàng</span>
          </a>
        </li>

        <li class="${param.active == 'user' ? 'active' : ''}">
          <a href="/admin/userManager">
            <i class="fa fa-users"></i>
            <span>Quản Lý Người Dùng</span>
          </a>
        </li>

        <li class="${param.active == 'statistics' ? 'active' : ''}">
          <a href="/admin/statistics">
            <i class="fa fa-bar-chart"></i>
            <span>Thống Kê & Báo Cáo</span>
          </a>
        </li>

        <li class="header">HỆ THỐNG</li>
        <li>
          <a href="/home">
            <i class="fa fa-home"></i> <span>Về Trang Chủ</span>
          </a>
        </li>
        <li>
          <a href="/perform_logout">
            <i class="fa fa-sign-out"></i> <span>Đăng Xuất</span>
          </a>
        </li>
      </ul>
    </section>
  </aside>