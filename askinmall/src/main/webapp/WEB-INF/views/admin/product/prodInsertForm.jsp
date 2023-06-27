<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
     			<form id="productForm" action="/admin/product/insertProd" method="post" enctype="multipart/form-data">
     			<div class="box-header">
     				상품 등록 폼
     			</div>
     			<div class="box-body">	
					  <div class="form-group row">
					    <label for="pdt_name" class="col-sm-2 col-form-label">카테고리</label>
					    <div class="col-sm-3">
					    	<select name="category_cd_prt" id="firstCategory" class="form-control"><!-- 카테고리 클릭 이벤트는 해당 select 태그의 id로 설정 -->
					    		<option value="">1차카테고리 선택</option>
					    		<c:forEach items="${categoryList }" var="category"><!-- model 객체명을 사용해 1차  카테고리 출력 -->
					    		<option value="${category.category_cd }">${category.category_name }</option><!-- category 이름으로 CategoryVO를 참조하여 원하는 필드의 값을 출력 -->
					    		</c:forEach>					    		
					     	</select>
					    </div>
						<div class="col-sm-3">					    	
					    	<select name="category_cd" id="secondCategory" class="form-control">
					    		<option>2차카테고리 선택</option>
					    	</select>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="prod_name" class="col-sm-2 col-form-label">상품명</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="prod_name" name="prod_name">
					    </div>
					    <label for="prod_price" class="col-sm-2 col-form-label">상품가격</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="prod_price" name="prod_price">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="prod_discount" class="col-sm-2 col-form-label">할인율</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="prod_discount" name="prod_discount">
					    </div>
					    <label for="prod_company" class="col-sm-2 col-form-label">제조사</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="prod_company" name="prod_company">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="pdt_img" class="col-sm-2 col-form-label">상품이미지</label>
					    <div class="col-sm-4"> <!-- name="pdt_img" 존재안함.  스프링에서는 Null 이 됨.-->
					      <input type="file" class="form-control" id="uploadFile" name="uploadFile">
					    </div>
					    <label for="pdt_img" class="col-sm-2 col-form-label">미리보기 이미지</label><!-- 업로드하기 위해 선택한 파일 중 첫번째 파일이 보여진다 -->
					    <div class="col-sm-4">
					      <img id="change_img" style="width: 200px;height: 200px;">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="prod_detail" class="col-sm-2 col-form-label">상품설명</label>
					    <div class="col-sm-10">
					      <textarea class="form-control" id="prod_detail" name="prod_detail" rows="3"></textarea>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="prod_stock" class="col-sm-2 col-form-label">수량</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="prod_stock" name="prod_stock">
					    </div>
					    <label for="prod_buy_state" class="col-sm-2 col-form-label">판매여부</label>
					    <div class="col-sm-4">
					      <select id="prod_buy_state" name="prod_buy_state">
					      	<option value="Y">판매가능</option>
					      	<option value="N">판매불가능</option>
					      </select>
					    </div>
					  </div>	  
				 
     			</div>
     			<div class="box-footer">
     				<div class="form-group">
     					<ul class="uploadedList"></ul>
     				</div>    				
     				<div class="form-group row">
						  <div class="col-sm-12 text-center">
						  	<button type="submit" class="btn btn-dark" id="btnProduct">상품등록</button>
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
<script src="/bower_components/ckeditor/ckeditor.js"> // 부트스트랩 폴더 내에 있는 ckeditor 파일 참조 </script>
<script>
$(document).ready(function(){
  // ckeditor 버전 4.12.1 (standard) 
  // ckeditor 툴바(Toolbar) 환경설정. javascript object 구문사용
  let ckeditor_config = {
    resize_enabled : false,
    enterMode : CKEDITOR.ENTER_BR,
    shiftEnterMode : CKEDITOR.ENTER_P,
    toolbarCanCollapse : true,
    removePlugins : "elementspath",
    // 설정하면 에디터에서 사진 첨부 창에 업로드 탭이 표시
    filebrowserUploadUrl : '/admin/product/imageUpload' // '서버로 전송' 버튼을 클릭하면 /admin/product/imageUpload 매핑 주소를 요청
}

// 에디터를 제공할 textarea의 id를 넣어준다 
  CKEDITOR.replace("prod_detail", ckeditor_config);

  console.log("버전: " + CKEDITOR.version);

  // 1차 카테고리 선택해서 2차 카테고리 가져오기
  // 1차 카테고리 id 참조
  // .change : select 태그에서 선택한 값이 변경되었을 때 이벤트 설정
  $("#firstCategory").change(function(){
    let category_cd = $(this).val(); // 여러 항목중 선택이 된 자기 자신을 참조

    // console.log("1차 카테고리 코드: " + cate_code);

    // 스프링에 매개변수로 전달한다 (@PathVariable로 설정됨)
    let url = "/admin/product/subCategory/" + category_cd + ".json";

    $.getJSON(url, function(subCategoryData){

      // console.log(subCategoryData); // 넘어온 데이터를 [0] ~ [5] 인덱스 번호로 사용할 수 있다

      let optionStr = "";
      let secondCategory = $("#secondCategory");

      secondCategory.find("option").remove(); // 1차카테고리를 클릭할 때마다 이전의 2차카테고리 부분 상태를 초기화
      secondCategory.append("<option value=''>2차카테고리 선택</option>");

      // 1차 카테고리 개수가 6개이기 때문에 (인덱스값 0~6) 
      // subCategoryData의 데이터 인덱스 길이(개수)만큼 반복되어 option 태그 6개가 만들어짐
      // handlebars도 사용 가능
        for(let i=0; i<subCategoryData.length; i++){
          optionStr += "<option value='" + subCategoryData[i].category_cd + "'>" + subCategoryData[i].category_name + "</option>";
        }

       // console.log(optionStr);

       secondCategory.append(optionStr) // 자식 수준으로 추가
       

    });

  });


  //파일로 첨부 된 이미지 미리보기. <input type="file" class="form-control" id="uploadFile" name="uploadFile">
  // 사용자가 파일을 선택하는 순간 change 이벤트가 실행되어 e 변수에 들어온다
  $("#uploadFile").on("change", function(e){ // 파라미터를 넣어줘야함
    let file = e.target.files[0]; // 선택한 파일들 중 첫번째 파일

    // 첨부된 파일을 읽기 위한 파일입력객체
    let reader = new FileReader(); // 파일을 읽는 기능을 가진 객체 생성

    // reader 객체가 파일을 로딩했을 때 실행
    reader.onload = function(e) {
      $("#change_img").attr("src", e.target.result); // 미리보기 이미지 태그 속성에 파일 원본 이미지 참조 (e.target.result)
    }

    // 파일 객체를 해당 메서드의 매개변수로 전달해서 동작하면 위의 onload 이벤트가 실행된다
    reader.readAsDataURL(file); // reader객체에 파일 객체를 할당
  });



}); // ready event end
</script>


</body>
</html>