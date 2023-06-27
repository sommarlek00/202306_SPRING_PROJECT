<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>admin account</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu tree" data-widget="tree">
        <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>
        
        <!-- 한세트 li 태그 안에 a태그, ul 태그 들어있음. 기능당 1세트 사용 -->
        <!-- <span>상품관리</span> : 타이틀, <li><a href="#">상품등록</a></li> : 세부기능  -->
        <!-- 상품관리 시작 -->
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>상품관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/product/prodInsertForm">상품등록</a></li>
            <li><a href="/admin/product/prodList">상품목록</a></li>
          </ul>
        </li>
        <!-- 상품관리 끝 -->
        
        <!-- 주문관리 시작 -->
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>주문관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/order/orderList">주문목록</a></li>
            <li><a href="/admin/order/deletedOrderList">삭제 주문목록</a></li>
          </ul>
        </li>
        <!-- 주문관리 끝 -->
        
        <!-- 회원관리 시작 -->
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>회원관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/member/addUserForm">회원등록</a></li>
            <li><a href="/admin/member/userList">회원목록</a></li>
          </ul>
        </li>
        <!-- 회원관리 끝 -->
        
        <!-- 통계관리 시작 -->
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>통계관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/chart/chartList">매출통계</a></li>
          </ul>
        </li>
        <!-- 통계관리 끝 -->
        
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>