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
  <title>ASKIN Admin page</title>
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
    alert("상품이 수정되었습니다.");
  }else if(msg == 'delete'){
    alert("상품이 삭제되었습니다.");
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
        	
        	<div class="box">
            <div class="box-header with-border">
              <div class="form-group row">
                <div class="col-md-6">
                   <form id="searchForm" action="/admin/product/prodList" method="get">
                      <select name="type">
                      <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--------</option>
                      <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
                      <option value="C" <c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>제조사</option>
                      <option value="D" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>내용</option>
                      <option value="NC" <c:out value="${pageMaker.cri.type eq 'NP'? 'selected':'' }" />>상품명 or 제조사</option>
                      <option value="ND" <c:out value="${pageMaker.cri.type eq 'NC'? 'selected':'' }" />>상품명 or 내용</option>
                      <option value="NCD" <c:out value="${pageMaker.cri.type eq 'NPC'? 'selected':'' }" />>상품명 or 제조사 or 내용</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요" value='<c:out value="${pageMaker.cri.keyword }"/>'>
                    <input type="hidden" name="pageNum" value="1">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                    <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                    </form>
                  </div>

                <div class="col-md-6" id="selectedProd"> <!-- style="float: right;" -->
                  <button type="button" id="btn_modifyCheckedProd" class="btn btn-secondary btn-sm">선택상품수정</button>
                  <button type="button" id="btn_deleteCheckedProd" class="btn btn-secondary btn-sm">선택상품삭제</button>
                </div> 
            </div>


            <form id="searchCategoryForm" action="/admin/product/prodList" method="get">  
                <div class="form-group row">
                  <div class="col-md-12">
                  <select name="category_cd_prt" id="firstCategory">
                    <option value="">1차 카테고리</option>
                    <c:forEach items="${categoryList }" var="category">
                    <option value="${category.category_cd }">${category.category_name }</option>
                    </c:forEach>
                  </select>
                  <select name="category_cd" id="secondCategory">
                    <option value="">2차 카테고리</option>
                  </select>
                  <input type="hidden" name="pageNum" value="1">
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <button type="submit" id="btn_searchCategory" class="btn btn-secondary btn-sm">검색</button>
                  </div>
              </div>
            </form>

              

            </div>
              
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody><tr><!-- width: 합이 100% 맞춰지게 조절 -->
                  <th style="width: 70px"><input type="checkbox" id="checkAll"></th><!-- 체크박스 아이디 설정 -->
                  <th style="width: 100px">상품코드</th>
                  <th style="width: 500px">상품명</th>
                  <th style="width: 200px">가격</th>
                  <th style="width: 300px">제조사</th>
                  <th style="width: 100px">수량</th>
                  <th style="width: 100px">판매여부</th>
                  <th style="width: 100px">수정</th>
                  <th style="width: 100px">삭제</th>
                </tr>
                <c:forEach items="${productList }" var="product"><!-- "product"가 productVO 클래스가 된다 -->
                <tr>
                  <td><input type="checkbox" name="check" value="${product.prod_no }"></td>
                  <td>
                    <input type="hidden" name="category_cd" value="${product.category_cd }">
                    <c:out value="${product.prod_no }"></c:out>
                  </td>
                  <td>
                    <a class="move" href="${product.prod_no }"><img src="/admin/product/displayImage?folderName=${product.prod_upload_folder}&fileName=s_${product.prod_img}" /> </a>
                    <a class="move" href="${product.prod_no }"><c:out value="${product.prod_name }"></c:out></a>
                  </td>
                  <td>
                    <input type="text" name="prod_price" value="${product.prod_price }">
                  </td>
                  <td><c:out value="${product.prod_company }"></c:out></td>
                  <td><c:out value="${product.prod_stock }"></c:out></td>
                 <td>
                    <select id="prod_buy_state" name="prod_buy_state">
                      <option value="Y" ${product.prod_buy_state == 'Y' ? 'selected':''}>판매가능</option>
                      <option value="N" ${product.prod_buy_state == 'N' ? 'selected':''}>판매불가능</option>
                    </select>
                  </td>
 
                  <td><button type="button" name="btn_modifyProd" data-prod_no="${product.prod_no }" class="btn btn-link">수정</button></td>
                  <td><button type="button" name="btn_deleteProd" data-prod_no="${product.prod_no }" class="btn btn-link">삭제</button></td>
                </tr>
                </c:forEach>
              
              </tbody></table>
            </div>
            <div id="prodBasicButtons">
            <a href='/admin/product/prodInsertForm' style="color: black;"><button type="button" class="btn btn-light btn-sm" >상품등록</button></a>
            <a href='/admin/product/prodList' style="color: black;"><button type="button" class="btn btn-light btn-sm" >상품목록</button></a>
          </div>

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

              <form id="actionForm" action="/admin/product/prodList" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                <input type="hidden" name="type" value="${pageMaker.cri.type}">
                <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                <input type="hidden" name="category_cd" value="${category_cd}">
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



<script>
$(document).ready(function(){

  let actionForm = $("#actionForm");

  $("ul.pagination a").on("click", function(e){
    e.preventDefault();
    actionForm.attr("action", "/admin/product/prodList");
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    actionForm.submit();
  });

  $("a.move").on("click", function(e){
    e.preventDefault();
    let prod_no = $(this).attr("href");
    actionForm.find("input[name='prod_no']").remove();
    actionForm.find("input[name='category_cd']").remove();
    actionForm.append("<input type='hidden' name='prod_no' value='" + prod_no + "'>");
    
    let category_cd = $(this).parent().parent().find("input[name='category_cd']").val();
    actionForm.append("<input type='hidden' name='category_cd' value='" + category_cd + "'>");
    actionForm.attr("action","/admin/product/prodDetail");
    actionForm.submit();
  });


    // 목록에서 수정버튼 클릭
    $("button[name='btn_modifyProd']").on("click", function(){
    actionForm.empty();
    actionForm.append("<input type='hidden' name='prod_no' value='" + $(this).data("prod_no") + "'>"); // 액션폼에 pro_num 추가 작업

    // 클라이언트 쪽에서 2차 카테고리를 먼저 받는다
    // 2차카테고리 추가
    // 수정버튼(btn_productEdit) -> td -> tr
    let category_cd = $(this).parent().parent().find("input[name='category_cd']").val();
    actionForm.append("<input type='hidden' name='category_cd' value='" + category_cd + "'>");

    // <form id="actionForm" action="/admin/product/pro_modify" method="get"> action, method 속성 변경
    actionForm.attr("method","get");
    actionForm.attr("action", "/admin/product/prodModifyForm");
    actionForm.submit(); // 완성된 actionForm을 submit해서 pro_modify 매핑주소를 요청 -> actionForm의 데이터를 pro_modify 메서드의 매개변수로 전달

    // 수정 버튼을 클릭하면 이동하는 주소
    // 위에서 append 작업을 한 pro_num, cat_code 가 파라미터로 전달 -> 매핑주소에 쿼리스트링으로 붙는다
    // pageNum=1&amount=10&type=&keyword= : Criteria cri 부분
    // http://localhost:8081/admin/product/pro_modify?pageNum=1&amount=10&type=&keyword=&pro_num=3&cat_code=21


  
  });


  // 목록에서 삭제버튼 클릭
  $("button[name='btn_deleteProd']").on("click", function(){
  
    if(!confirm("상품을 삭제하시겠습니까?")) return;

    actionForm.append("<input type='hidden' name='prod_no' value='" + $(this).data("prod_no") + "'>");
    actionForm.attr("method","post");
    actionForm.attr("action", "/admin/product/deleteProd");
    actionForm.submit();

  });


  let isCheck = true;
  $("#checkAll").on("click", function(){ 
    $("input[name='check']").prop("checked", this.checked);
    isCheck = this.checked;
  });

  $("input[name='check']").on("click", function(){

    $("#checkAll").prop("checked", this.checked);

    $("input[name='check']").each(function(){
      if(!$(this).is(":checked")){
        $("#checkAll").prop("checked", false);
      }
    }); 

  });

  // 선택 상품 수정
  $("#btn_modifyCheckedProd").on("click", function(){
    if($("input[name='check']:checked").length == 0){
      alert("수정할 상품을 선택하세요");
      return;
    }

    let prod_no_arr = [];
    let prod_price_arr = [];
    let prod_buy_state_arr = [];

    $("input[name='check']:checked").each(function(){
      prod_no_arr.push($(this).val());
      prod_price_arr.push($(this).parent().parent().find("input[name='prod_price']").val());
      prod_buy_state_arr.push($(this).parent().parent().find("select[name='prod_buy_state']").val());
    });

    $.ajax({
      url: '/admin/product/modifyCheckedProd',
      type: 'post',
      data: {prod_no_arr:prod_no_arr, prod_price_arr:prod_price_arr, prod_buy_state_arr:prod_buy_state_arr},
      dataType: 'text',
      success: function(result){
        if(result == "success"){
          alert("선택 상품이 수정되었습니다.");

          actionForm.attr("method","get");
          actionForm.attr("action","/admin/product/prodList");
          actionForm.submit();
        }
      }

    });
  });


  // 선택 상품 삭제
  $("#btn_deleteCheckedProd").on("click", function(){
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
      url: '/admin/product/deleteCheckedProd',
      type: 'post',
      data: {prod_no_arr:prod_no_arr},
      dataType: 'text',
      success: function(result){
        if(result == "success"){
          alert("선택 상품이 삭제되었습니다.");

          actionForm.attr("method","get");
          actionForm.attr("action","/admin/product/prodList");
          actionForm.submit();
        }
      }

    });
  });



  // 카테고리 검색 기능. 2차 카테고리 출력
  $("#firstCategory").change(function(){
    let category_cd = $(this).val();
    let url = "/admin/product/subCategory/" + category_cd + ".json";

    $.getJSON(url, function(subCategoryData){

      let optionStr = "";
      let secondCategorySearch = $("#secondCategory");

      secondCategorySearch.find("option").remove();
      secondCategorySearch.append("<option value=''>2차 카테고리</option>");

        for(let i=0; i<subCategoryData.length; i++){
          optionStr += "<option value='" + subCategoryData[i].category_cd + "'>" + subCategoryData[i].category_name + "</option>";
        }

        secondCategorySearch.append(optionStr)
    });
  });


}); // jQuery ready event end


</script>

</body>
</html>