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
     			<form id="addUserForm" action="/admin/member/addUser" method="post">
     			<div class="box-header">
     				회원 등록 폼
     			</div>
     			<div class="box-body">	
					  <div class="form-group row">
					    <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_id" name="user_id">
					      </div>
			          <label for="email" class="col-sm-2 col-form-label">아이디</label>
			          <div class="col-sm-4">
			            <button type="button" id="btn_idCheck" class="btn btn-outline-secondary" >중복확인</button>
			          </div>
					    </div>
					    
					    <div class="form-group row">
					    <label for="user_password" class="col-sm-2 col-form-label">비밀번호</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_password" name="user_password">
					    </div>
					    <label for="prod_price" class="col-sm-2 col-form-label">비밀번호 확인</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_password_confirm" name="user_password_confirm">
					    </div>
					  </div>
					  
					  <div class="form-group row">
					    <label for="user_name" class="col-sm-2 col-form-label">이름</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_name" name="user_name">
					    </div>
					    <label for="user_email" class="col-sm-2 col-form-label">이메일</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_email" name="user_email">
					    </div>
					  </div>
					  
					  <div class="form-group row">
					    <label for="user_nickname" class="col-sm-2 col-form-label">닉네임</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_nickname" name="user_nickname">
					    </div>
					   <label for="email" class="col-sm-2 col-form-label">닉네임</label>
			          <div class="col-sm-4">
			            <button type="button" id="btn_nicknameCheck" class="btn btn-outline-secondary" >중복확인</button>
			          </div>
					    </div>
					    
					    <div class="form-group row">
					    <label for="user_phone" class="col-sm-2 col-form-label">연락처</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="예시) 01012345678">
					    </div>
					  </div>
					  
					<div class="form-group row">
					<label for="sample2_postcode" class="col-sm-2 col-form-label">우편번호</label>
			          <div class="col-sm-4">
			            <input type="text" class="form-control" name="user_zipcode" id="sample2_postcode" ><!-- 다음 api에서 가져온 id -->
			          </div>
			          <label for="email" class="col-sm-2 col-form-label">우편번호</label>
			          <div class="col-sm-4">
			            <button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-outline-secondary" >찾기</button>
			          </div>
			          </div>
		
					<div class="form-group row">
					<label for="sample2_address" class="col-sm-2 col-form-label">주소</label>
			          <div class="col-sm-4">
			           <input type="text" class="form-control" name="user_addr" id="sample2_address" placeholder="서울특별시 강남구">
			          </div>
					<label for="sample2_detailAddress" class="col-sm-2 col-form-label">상세주소</label>
			          <div class="col-sm-4">
			            <input type="text" class="form-control" name="user_addr_detail" id="sample2_detailAddress" placeholder="상세주소를 입력해주세요.">
			            <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
			          </div>
			          </div>  
				 
     			</div>
     			<div class="box-footer">
     				<div class="form-group">
     					<ul class="uploadedList"></ul>
     				</div>    				
     				<div class="form-group row">
						  <div class="col-sm-12 text-center">
						  	<button type="button" id="btn_join" class="btn btn-dark" id="btnProduct">회원등록</button>
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

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
  </div>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');
  
      function closeDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_layer.style.display = 'none';
      }
  
      function sample2_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("sample2_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample2_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample2_postcode').value = data.zonecode;
                  document.getElementById("sample2_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample2_detailAddress").focus();
  
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_layer.style.display = 'none';
              },
              width : '100%',
              height : '100%',
              maxSuggestItems : 5
          }).embed(element_layer);
  
          // iframe을 넣은 element를 보이게 한다.
          element_layer.style.display = 'block';
  
          // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
          initLayerPosition();
      }
  
      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
          var width = 300; //우편번호서비스가 들어갈 element의 width
          var height = 400; //우편번호서비스가 들어갈 element의 height
          var borderWidth = 5; //샘플에서 사용하는 border의 두께
  
          // 위에서 선언한 값들을 실제 element에 넣는다.
          element_layer.style.width = width + 'px';
          element_layer.style.height = height + 'px';
          element_layer.style.border = borderWidth + 'px solid';
          // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
          element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
          element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
  </script>
  
<script>

          // 필드의 공백체크 함수
      
      // target_id : 입력 양식 필드 태그를 참조하는 변수
      // msg : 입력 양식에 맞게 출력할 메시지
      function check_validate(target_id, msg) {
          if(target_id.value == ""){
              alert(msg);
              target_id.focus();
              return false;
          }
          return true;
      }

            // 정규식 검사 함수
      // 정규식문법.test(입력된 데이터) true, false 를 반환
      
      //reg_ex : 입력 양식의 값을 검증하는 정규식 변수
      //target_id : 입력 양식의 필드 태그를 참조하는 변수
      //msg : 입력 양식에 맞게 출력할 메시지
      function reg_validate(reg_ex, target_id, msg) {
          if(reg_ex.test(target_id.value) == false) {
              alert(msg);
              target_id.focus();
              return false;
          }
          return true;
      }

$(document).ready(function() {

  let idCheck = false;

  // 아이디 중복 체크
  $("#btn_idCheck").click(function(){
    if($("#user_id").val() == ""){
      alert("아이디를 입력하세요");
      $("#user_id").focus();
      return;
    }

    $.ajax({
      url: '/member/idCheck',
      type: 'get',
      dataType: 'text',
      data: {user_id : $("#user_id").val()},
      success: function(result){
        if(result == "yes"){
          alert("사용가능한 아이디 입니다");
          idCheck = true;
        }else{
          alert("중복된 아이디 입니다");
          $("#user_id").val("");
          $("#user_id").focus();
        }
      }
    });
  });
  
  
  
  // 닉네임 중복 체크
  $("#btn_nicknameCheck").click(function(){
    if($("#user_nickname").val() == ""){
      alert("닉네임을 입력하세요");
      $("#user_nickname").focus();
      return;
    }

    $.ajax({
      url: '/member/nicknameCheck',
      type: 'get',
      dataType: 'text',
      data: {user_nickname : $("#user_nickname").val()},
      success: function(result){
        if(result == "yes"){
          alert("사용가능한 닉네임 입니다");
          nicknameCheck = true;
        }else{
          alert("중복된 닉네임 입니다");
          $("#user_nickname").val("");
          $("#user_nickname").focus();
        }
      }
    });
  });
  
  
  
  // 회원 가입
  $("#btn_join").click(function(){
    let addUserForm = $("#addUserForm");

    // 유효성 검사 코드
      let reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
      let reg_id = /^[a-zA-Z0-9]{6,12}$/;
      let reg_password = /^[A-Za-z0-9]{6,12}$/;
      let reg_phone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
   	  let reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   	  let reg_nickname = /^[a-zA-Zㄱ-힣0-9]{2,12}$/;

      // 태그를 참조하는 구문
      let user_name = document.getElementById("user_name");
      let user_id = document.getElementById("user_id");
      let user_password = document.getElementById("user_password");
      let user_password2 = document.getElementById("user_password2");
      let user_phone = document.getElementById("user_phone");
      let user_zipcode = document.getElementById("user_zipcode");
      let u_addr1 = document.getElementById("sample2_address");
      let u_addr2 = document.getElementById("sample2_detailAddress");
      
      // sendit() 함수가 중단이 되게 하기 위해 필드 값이 공백일 경우 false를 리턴
      if(check_validate(user_id, "아이디를 입력하세요") == false) return false;
      if(reg_validate(reg_id, user_id, "아이디는 알파벳 대소문자, 숫자 6-12자리로 입력해주세요") == false) return false;
      
      if(check_validate(user_password, "비밀번호를 입력하세요") == false) return false;
      if(reg_validate(reg_password, user_password, "비밀번호는 6~12 길이로 입력해주세요") == false) return false;
      
      if(check_validate(user_password_confirm, "비밀번호 확인을 입력하세요") == false) return false;
      if(user_password_confirm.value !== user_password.value){
          alert("비밀번호가 다릅니다.");
          user_password_confirm.focus();
          return false;
      }

      if(check_validate(user_name, "이름을 입력하세요") == false) return false;
      if(reg_validate(reg_name, user_name, "이름의 형식이 잘못되었습니다.") == false) return false;

      if(check_validate(user_email, "이메일을 입력하세요") == false) return false;
      if(reg_validate(reg_email, user_email, "이메일의 형식이 잘못되었습니다.") == false) return false;
      
      if(check_validate(user_nickname, "닉네임을 입력하세요") == false) return false;
      if(reg_validate(reg_nickname, user_nickname, "닉네임은 한글, 영문을 포함한 2 ~ 12글자로 입력하세요") == false) return false;
      
      if(check_validate(user_phone, "연락처를 입력하세요") == false) return false;
      if(reg_validate(reg_phone, user_phone, "연락처의 형식이 잘못되었습니다.") == false) return false;
      
      if(check_validate(sample2_postcode, "우편번호를 입력하세요") == false) return false;
      if(check_validate(sample2_address, "기본주소를 입력하세요") == false) return false;
      if(check_validate(sample2_detailAddress, "나머지주소를 입력하세요") == false) return false;
      

      // 실행 코드 넣기 전에 잘 동작하는지 테스트
      // alert("입력 유효성 검사 끝");
      // return false;
          
      // return true;

      addUserForm.submit();
  });

  }); // jQuery ready event end



</script>  


</body>
</html>