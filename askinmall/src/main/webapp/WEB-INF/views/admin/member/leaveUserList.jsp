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
<style>
  #selectedProd{
    text-align: right;
  }

  #prodBasicButtons{
    margin: 5px;
    color: black;
  }

</style>

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
      <h4>
        탈퇴 신청 목록
      </h4>
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
        	
        	<div class="box">
            <div class="box-header with-border">
              <form id="searchForm" action="/admin/member/leaveUserList" method="get">
                <div class="form-group row">
                  <div class="col-md-6">
                  <select name="type"> <!-- Criteria 클래스의 type 필드 사용 -->
                    <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----------</option>
                    <option value="I" <c:out value="${pageMaker.cri.type eq 'I'? 'selected':'' }" />>아이디</option>
                    <option value="N" <c:out value="${pageMaker.cri.type eq 'E'? 'selected':'' }" />>이메일</option>
                    <option value="E" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>닉네임</option>
                  </select>
                  <input type="text" name="keyword" placeholder="검색어를 입력하세요" value='<c:out value="${pageMaker.cri.keyword }"/>'> <!-- 검색기능을 사용하면 Criteria의 모든 필드 값을 전달 받음-->
                  <input type="hidden" name="pageNum" value="1">
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                </div>
              </div>  
              </form>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody><tr><!-- width: 합이 100% 맞춰지게 조절 -->
                  <th style="width: 5%"><input type="checkbox" id="checkAll"></th><!-- 체크박스 아이디 설정 -->
                  <th style="width: 10%">아이디</th>
                  <th style="width: 15%">이름</th>
                  <th style="width: 15%">이메일</th>
                  <th style="width: 10%">신청일</th>
                  <th style="width: 10%">탈퇴처리여부</th>
                  <th colspan="2" style="width: 10%">탈퇴관리</th>

                </tr>
                
                <c:forEach items="${leaveUserList }" var="leaveUser"><!-- "product"가 productVO 클래스가 된다 -->
                <tr>
                  <td><input type="checkbox" name="check" value="${leaveUser.leave_user_id }"></td>
                  <td>
                    <c:out value="${leaveUser.leave_user_id }"></c:out>
                  </td>
                  
                  <td>
                    <c:out value="${leaveUser.leave_user_name }"></c:out>
                  </td>
                  <td><c:out value="${leaveUser.leave_user_email }"></c:out></td>
                  <td><fmt:formatDate value='${leaveUser.leave_date }' pattern='yyyy-MM-dd HH:mm' /></td>
 				  <td>
            <c:out value="${leaveUser.leave_user_state }"></c:out>
 				  </td>
                  <td><button type="button" name="btn_deleteLeaveUser" data-leave_user_id="${leaveUser.leave_user_id }" class="btn btn-link">탈퇴처리</button></td>
                </tr>
                </c:forEach>
              
              </tbody></table>

            </div>
            <!-- /.box-body -->
            <!-- [prev] 1 2 3 4 5 [next] 출력 작업 -->
            <div class="box-footer clearfix">
              <ul class="pagination pagination-sm no-margin pull-right">

               <c:if test="${pageMaker.prev }">
                <li><a href="${pageMaker.startPage - 1}">[prev]</a></li>
                </c:if>

                <!-- pageMaker.cri.pageNum getCri, getPageNum이 동작한다 -->
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                <li ${pageMaker.cri.pageNum == pageNum ? "class='active'": ""}><a href="${pageNum}">${pageNum }</a></li><!-- active 클릭한 페이지 표시 설정-->
               </c:forEach>
                <c:if test="${pageMaker.next }">
                <li><a href="${pageMaker.endPage + 1}">[next]</a></li>
                </c:if>
              </ul>

              <form id="actionForm" action="/admin/member/leaveUserList" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                <input type="hidden" name="type" value="${pageMaker.cri.type}">
                <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
              </form>

            </div>
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

<script>
  $(document).ready(function(){

  let actionForm = $("#actionForm");  

  // 탈퇴 처리 버튼 클릭
  $("button[name='btn_deleteLeaveUser']").on("click", function(){
  
  if(!confirm("회원을 삭제하시겠습니까?")) return;

  actionForm.append("<input type='hidden' name='leave_user_id' value='" + $(this).data("leave_user_id") + "'>");
  actionForm.attr("method","post");
  actionForm.attr("action", "/admin/member/deleteUser");
  actionForm.submit();

});

  });


</script>


</body>
</html>