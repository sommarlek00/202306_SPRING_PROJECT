<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
<%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>  

</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
 <%@include file="/WEB-INF/views/admin/include/header.jsp" %>
 
  <!-- Left side column. contains the logo and sidebar -->
 <%@include file="/WEB-INF/views/admin/include/nav.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        
       	<div class="row">
     	<div class="col-md-12">
     		<div class="box box-primary"><!-- form에서 데이터를 전송할 때 enctype 기본값이지만 파일첨부가 포함되어 있으면 "multipart/form-data" 로 설정해야 한다 -->
     			<form id="addUserForm" action="/admin/member/addUser" method="post">
     			<div class="box-header">
     				회원 정보
     			</div>
     			<div class="box-body">	
					  <div class="form-group row">
					    <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_id" name="user_id" value="${member.user_id}" readonly>
					      </div>
					    </div>
					    					  
					  <div class="form-group row">
					    <label for="user_name" class="col-sm-2 col-form-label">이름</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_name" name="user_name" value="${member.user_name}" readonly>
					    </div>
              <label for="user_nickname" class="col-sm-2 col-form-label">닉네임</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_nickname" name="user_nickname" value="${member.user_nickname}" readonly>
					    </div>
					  </div>
					  
					  <div class="form-group row">
              <label for="user_email" class="col-sm-2 col-form-label">이메일</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_email" name="user_email" value="${member.user_email}" readonly>
					    </div>
              <label for="user_email" class="col-sm-2 col-form-label">수신여부</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_email" name="user_email" value="${member.user_email_state}" readonly>
					    </div>
					  </div>
					    
					    <div class="form-group row">
					    <label for="user_phone" class="col-sm-2 col-form-label">연락처</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_phone" name="user_phone" value="${member.user_phone}" readonly>
					    </div>
					  </div>
					  
					<div class="form-group row">
					<label for="sample2_postcode" class="col-sm-2 col-form-label">우편번호</label>
			          <div class="col-sm-4">
			            <input type="text" class="form-control" name="user_zipcode" id="sample2_postcode" value="${member.user_zipcode}" readonly>
			          </div>
                <label for="sample2_address" class="col-sm-2 col-form-label">주소</label>
			          <div class="col-sm-4">
			           <input type="text" class="form-control" name="user_addr" id="sample2_address" value="${member.user_addr}" readonly>
			          </div>
			          </div>
		
					<div class="form-group row">

					<label for="sample2_detailAddress" class="col-sm-2 col-form-label">상세주소</label>
			          <div class="col-sm-4">
			            <input type="text" class="form-control" name="user_addr_detail" id="sample2_detailAddress" value="${member.user_addr_detail}" readonly>
			            <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
			          </div>
			          </div>  

                <div class="form-group row">
                  <label for="user_name" class="col-sm-2 col-form-label">가입일</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="user_name" name="user_name" value="<fmt:formatDate value='${member.signup_date }' pattern='yyyy-MM-dd HH:mm' />" readonly>
                  </div>
                  <label for="user_nickname" class="col-sm-2 col-form-label">회원정보 수정일</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="user_nickname" name="user_nickname" value="<fmt:formatDate value='${member.update_date }' pattern='yyyy-MM-dd HH:mm' />" readonly>
                  </div>
                </div>

                <div class="form-group row">
                <label for="user_nickname" class="col-sm-2 col-form-label">최근접속일</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="user_nickname" name="user_nickname" value="<fmt:formatDate value='${member.login_date }' pattern='yyyy-MM-dd HH:mm' />" readonly>
                </div>
              </div>  

				 
     			</div>
     			<div class="box-footer">
     				<div class="form-group">
     					<ul class="uploadedList"></ul>
     				</div>    				
     				<div class="form-group row">
						  <div class="col-sm-12 text-center">
						  	<button type="button" id="btn_userList" class="btn btn-dark" id="btnProduct">회원목록</button>
						  </div>			
					</div>
     			</div>
     			</form>
     		</div>
     	</div>
     </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
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
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
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

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

</body>
</html>