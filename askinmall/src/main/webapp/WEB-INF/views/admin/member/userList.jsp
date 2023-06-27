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
<script>
  let msg = "${msg}";
  if(msg == 'modify'){
    alert("회원 정보가 수정되었습니다.");
  }else if(msg == 'delete'){
    alert("회원이 삭제되었습니다.");
  }
  </script>

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
        회원 목록
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
        	
        	<div class="box">
            <div class="box-header with-border">
              <form id="searchForm" action="/admin/member/userList" method="get">
                <div class="form-group row">
                  <div class="col-md-6">
                  <select name="type"> <!-- Criteria 클래스의 type 필드 사용 -->
                    <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----------</option>
                    <option value="I" <c:out value="${pageMaker.cri.type eq 'I'? 'selected':'' }" />>아이디</option>
                    <option value="E" <c:out value="${pageMaker.cri.type eq 'E'? 'selected':'' }" />>이메일</option>
                    <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>닉네임</option>
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
                  <th style="width: 15%">아이디</th>
                  <th style="width: 10%">이름</th>
                  <th style="width: 15%">닉네임</th>
                  <th style="width: 15%">이메일</th>
                  <th style="width: 10%">가입일</th>
                  <th style="width: 10%">최종로그인</th>
                  <th style="width: 10%">메일수신여부</th>
                  <th style="width: 5%">수정</th>

                </tr>
                
                <c:forEach items="${userList }" var="user"><!-- "product"가 productVO 클래스가 된다 -->
                <tr>
                  <td><input type="checkbox" name="check" value="${user.user_id }"></td>
                  <td>
                    <a class="move" href="${user.user_id }"><c:out value="${user.user_id }"></c:out></a>
                  </td>
                  
                  <td>
                    <c:out value="${user.user_name }"></c:out>
                  </td>

                  <td>
                  	<c:out value="${user.user_nickname }"></c:out>
                    
                  </td>
                  <td><c:out value="${user.user_email }"></c:out></td>
                  <td><fmt:formatDate value='${user.signup_date }' pattern='yyyy-MM-dd HH:mm' /></td>
                  <td><fmt:formatDate value='${user.login_date }' pattern='yyyy-MM-dd HH:mm' /></td>
 				  <td>
 				      <select id="user_email_state" name="user_email_state">
                      <option value="Y" ${user.user_email_state == 'Y' ? 'selected':''}>수신</option>
                      <option value="N" ${user.user_email_state == 'N' ? 'selected':''}>미수신</option>
                    </select>
 				  </td>
                  <td><button type="button" name="btn_editUser" data-user_id="${user.user_id }" class="btn btn-link">수정</button></td>
                </tr>
                </c:forEach>
              
              </tbody></table>
          <div id="prodBasicButtons">
            <a href='/admin/product/prodInsertForm' style="color: black;"><button type="button" class="btn btn-light btn-sm" >회원등록</button></a>
            <a href='/admin/product/prodList' style="color: black;"><button type="button" class="btn btn-light btn-sm" >회원목록</button></a>
          </div>
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

              <form id="actionForm" action="/admin/member/userList" method="get">
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

  $("ul.pagination a").on("click", function(e){
    e.preventDefault();
    actionForm.attr("action", "/admin/product/prod_list");
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    actionForm.submit();
  });

  $("a.move").on("click", function(e){
    e.preventDefault();
    let user_id = $(this).attr("href");
    actionForm.find("input[name='user_id']").remove();
    actionForm.append("<input type='hidden' name='user_id' value='" + user_id + "'>");
    actionForm.attr("action","/admin/member/userDetail");
    actionForm.submit();
    actionForm.empty();
  });


    // 목록에서 수정버튼 클릭
    $("button[name='btn_editUser']").on("click", function(){
    actionForm.append("<input type='hidden' name='user_id' value='" + $(this).data("user_id") + "'>");

    // <form id="actionForm" action="/admin/product/pro_modify" method="get"> action, method 속성 변경
    actionForm.attr("method","get");
    actionForm.attr("action", "/admin/member/userModifyForm");
    actionForm.submit(); // 완성된 actionForm을 submit해서 pro_modify 매핑주소를 요청 -> actionForm의 데이터를 pro_modify 메서드의 매개변수로 전달
    actionForm.empty();
  
  });


  // 목록에서 삭제버튼 클릭
  $("button[name='btn_deleteUser']").on("click", function(){
  
    if(!confirm("회원을 삭제하시겠습니까?")) return;

    actionForm.append("<input type='hidden' name='user_id' value='" + $(this).data("user_id") + "'>");
    actionForm.attr("method","post");
    actionForm.attr("action", "/admin/member/deleteUser");
    actionForm.submit();

  });



  // 리스트에서 제목행 체크박스 선택
  let isCheck = true; // 제목행의 상태를 체크
  $("#checkAll").on("click", function(){ // 제목행 체크박스 클릭(체크) 이벤트
    // 체크박스를 선택하면 데이터 행의 checkbox 모두 선택되도록 설정
    // 체크박스 작업할 때는 attr이 아닌 prop을 사용해야 한다
    // name 속성은 복수로 선택 가능
    // input[name='check'] : 데이터행을 가리키는 선택자
    // 제목행 체크박스가 체크되어있으면 데이터행도 모두 체크가 되도록 한다
    $("input[name='check']").prop("checked", this.checked); // attr: attribute, prop: property
    isCheck = this.checked; // 제목행 체크박스 상태 확인하는 용도의 변수
  });

  // 리스트에서 데이터행 체크박스 선택
  $("input[name='check']").on("click", function(){ // 데이터행 체크박스 클릭(체크) 이벤트
    // 제목행(상품코드, 상품명, 가격 있는 부분의 체크박스) checkbox
    $("#checkAll").prop("checked", this.checked);

    // 각 데이터 행의 체크박스 상태를 확인
    $("input[name='check']").each(function(){ // each : 존재하는 데이터 개수만큼 반복을 해주는 메서드
      if(!$(this).is(":checked")){ // 체크가 안되어있으면
        $("#checkAll").prop("checked", false); // 제목행 체크박스 해제
      }
    }); 

  });

  // 선택 상품 수정 버튼
  $("#btn_modifyCheckedUser").on("click", function(){
    if($("input[name='check']:checked").length == 0){
      alert("수정할 회원을 선택하세요");
      return;
    }

    let user_id_arr = [];
    let user_point_arr = [];
    let user_email_state_arr = [];

    $("input[name='check']:checked").each(function(){
      user_id_arr.push($(this).val());
      user_point_arr.push($(this).parent().parent().find("input[name='user_point']").val());
      user_email_state_arr.push($(this).parent().parent().find("select[name='user_email_state']").val());
    });

    $.ajax({
      url: '/admin/product/prod_checked_modify',
      type: 'post',
      data: {user_id_arr : user_id_arr, user_point_arr : user_point_arr, user_email_state_arr : user_email_state_arr},
      dataType: 'text',
      success: function(result){
        if(result == "success"){
          alert("선택된 회원의 정보가 수정되었습니다.");

          actionForm.attr("method","get");
          actionForm.attr("action","/admin/product/prod_list");
          actionForm.submit();
        }
      }

    });
  });


  // 선택 상품 삭제 버튼
  $("#btn_deleteCheckedUser").on("click", function(){
    if($("input[name='check']:checked").length == 0){
      alert("삭제할 상품을 선택하세요");
      return;
    }

    if(!confirm("선택한 상품을 삭제 하시겠습니까?")) return;

    let prod_no_arr = [];

    $("input[name='check']:checked").each(function(){
      prod_no_arr.push($(this).val());
    });

    $.ajax({
      url: '/admin/product/prod_checked_delete',
      type: 'post',
      data: {prod_no_arr:prod_no_arr},
      dataType: 'text',
      success: function(result){
        if(result == "success"){
          alert("선택 상품이 삭제되었습니다.");

          actionForm.attr("method","get");
          actionForm.attr("action","/admin/product/prod_list");
          actionForm.submit();
        }
      }

    });
  });





}); // jquery ready event end




</script>


</body>
</html>