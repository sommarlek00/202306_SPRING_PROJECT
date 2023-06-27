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

<script>
  let msg = "${msg}";
  if(msg == 'delete'){
    alert("주문이 삭제되었습니다.");
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
        주문 목록
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
              
              <div class="form-group row">
                <div class="col-md-12">
                <form id="searchForm">
                  기간별 검색 <input type="date" name="sDate" value="${sDate}"> ~ <input type="date" name="eDate" value="${eDate}">
                  <select name="type">
                  <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--------</option>
                  <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>주문번호</option>
                  <option value="I" <c:out value="${pageMaker.cri.type eq 'I'? 'selected':'' }" />>주문자ID</option>
                  <option value="R" <c:out value="${pageMaker.cri.type eq 'R'? 'selected':'' }" />>수령인</option>
                </select>
                <input type="text" name="keyword" placeholder="검색어를 입력하세요" value='<c:out value="${pageMaker.cri.keyword }"/>'>
                <input type="hidden" name="pageNum" value="1">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                <button type="button" id="btn_searchOrder" class="btn btn-success">검색</button>
              </form>
              </div>
            </div>

            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody><tr><!-- width: 합이 100% 맞춰지게 조절 -->
                  <th style="width: 5%"><input type="checkbox" id="checkAll"></th>
                  <th style="width: 20%">주문일자</th>
                  <th style="width: 10%">주문번호</th>
                  <th style="width: 25%">주문자/수령인</th>
                  <th style="width: 20%">주문금액/배송비</th>
                  <th style="width: 10%">결제방식</th>
                  <th colspan="2" style="width: 10%">주문관리</th>
                </tr>

                <c:forEach items="${orderList }" var="order">
                <tr>
                  <td><input type="checkbox" name="check" value="${order.ord_no }"></td>
                  <td>
                  	<fmt:formatDate value="${order.ord_date }" pattern="yyyy-MM-dd HH:mm"/>
                  </td>
                  <td>
                    ${order.ord_no }
                  </td>
                  <td>
                   ${order.user_id } / ${order.ord_name }
                  </td>
                  <td>
                  ${order.ord_total_amount }
                  </td>
                  <td>${order.pay_method }</td><!-- 태그 속성에 프로그래밍 목적으로 값을 설정해서 저장하는 문법 : data-변수명="값" -->
                  <td><button type="button" name="btn_orderInfo" data-ord_no="${order.ord_no }" class="btn btn-link">상세정보</button></td>
                  <td><button type="button" name="btn_deleteOrder" data-ord_no="${order.ord_no }" class="btn btn-link">삭제</button></td>
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
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                <li ${pageMaker.cri.pageNum == pageNum ? "class='active'": ""}><a href="${pageNum}">${pageNum }</a></li><!-- active 클릭한 페이지 표시 설정-->
               </c:forEach>
                <c:if test="${pageMaker.next }">
                <li><a href="${pageMaker.endPage + 1}">[next]</a></li>
                </c:if>
              </ul>

              <form id="actionForm" action="/admin/order/orderList" method="get">
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

<!-- 1) Include Handlebars from a CDN -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="orderInfoView" type="text/x-handlebars-template">
  <table class="table table-bordered">
    <tbody>
    <tr>
    <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
    <th style="width: 8%">주문상품</th>
    <th style="width: 20%">판매가</th>
    <th style="width: 10%">수량</th>
    <th style="width: 20%">주문금액</th>
    <th style="width: 15%">상태</th>
    <th style="width: 15%">배송비</th>
    <th style="width: 10%">비고</th>
    </tr>
  {{#each .}}
    <tr>
      <td style="width: 2%">
        <input type="checkbox" id="checkAll">
        <input type="hidden" name="ord_no" value="{{ord_no}}">
      </td>
      <td style="width: 8%"><img src="{{imageView prod_upload_folder prod_img}}"> {{prod_name}}</td>
      <td style="width: 20%">{{ord_detail_amount}}<input type="hidden" name="ord_detail_amount" value="{{ord_detail_amount}}"></td>
      <td style="width: 10%">{{ord_detail_qty}}</td>
      <td style="width: 20%">주문금액</td>
      <td style="width: 15%">상태</td>
      <td style="width: 15%">무료</td>
      <td style="width: 10%"><button type="button" name="btn_deleteOrderProd" data-prod_no="{{prod_no}}" class="btn btn-link">삭제</button></td>
    </tr>
  {{/each}}
  </tbody>
</table>
</script>

<script>
  Handlebars.registerHelper("imageView", function(folder, file) {
    
    let url = "/admin/order/displayImage?folderName=" + folder.replace(/\\/g,"/") + "&fileName=" + "s_" + file; 
    return  url;
  })
</script>

<script>
$(document).ready(function(){


    // 검색 클릭
    let searchForm = $("#searchForm");
    let actionForm = $("#actionForm");

    $("#btn_searchOrder").on("click", function(){
      searchForm.attr("action", "/admin/order/orderList");
      searchForm.find("input[name='pageName']").val(1);
      searchForm.submit();
    });

    $("ul.pagination a").on("click", function(e){
    e.preventDefault();

    actionForm.attr("action", "/admin/order/orderList");
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));

    actionForm.find("input[name='sDate']").remove();
    actionForm.find("input[name='eDate']").remove();

    actionForm.append("<input type='hidden' name='sDate' value='${sDate}'>");
    actionForm.append("<input type='hidden' name='eDate' value='${eDate}'>");
    actionForm.submit();
    });


    // 상세 버튼 클릭
    $("button[name='btn_orderInfo']").on("click", function(){

      let ord_no = $(this).data("ord_no");  
      let url = "/admin/order/orderInfo?ord_no=" + ord_no; 

      // ajax 요청에서 주문상세정보 json형태로 받는 작업
      $.getJSON(url, function(data){

       console.log(data); 
                
      let templateObj = Handlebars.compile($("#orderInfoView").html());
      let orderInfoView = templateObj(data);

      $("#modalDetailView").empty();
      $("#modalDetailView").append(orderInfoView);

      $('#orderInfoModal').modal('show');

    });
  });

  // 상세 내역에서 삭제 클릭
  $("div#modalDetailView").on("click", "button[name='btn_deleteOrderProd']", function(){
    if(!confirm("해당 주문 상품을 삭제하시겠습니까?")) return;
    let cur_row = $(this).parent().parent();
    let prod_no = $(this).data("prod_no");
    let ord_no = $(this).parent().parent().find("input[name='ord_no']").val();
    let ord_detail_amount = $(this).parent().parent().find("input[name='ord_detail_amount']").val();
    
    $.ajax({
      url: '/admin/order/deleteOrderInfoProd',
      type: 'post',
      data: {ord_no : ord_no, prod_no : prod_no, ord_detail_amount : ord_detail_amount },
      dataType: 'text',
      success: function(result){
        if(result == 'success'){
          alert("주문상품이 삭제되었습니다.");
          cur_row.remove();
        }
      }
    });
  });


  // 주문 삭제
  $("button[name='btn_deleteOrder']").on("click", function(){
    if(!confirm("해당 주문을 삭제하시겠습니까?")) return;

    actionForm.append("<input type='hidden' name='ord_no' value='" + $(this).data("ord_no") + "'>");
    actionForm.attr("method","post");
    actionForm.attr("action", "/admin/order/deleteOrder");
    actionForm.submit();
  });



}); // jquery ready event end

</script>

<!-- Modal -->
<div class="modal fade" id="orderInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주문상세내역</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalDetailView">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">선택삭제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>