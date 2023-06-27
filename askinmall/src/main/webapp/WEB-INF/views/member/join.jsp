<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    
	<%@ include file="/WEB-INF/views/include/config.jsp" %>
   
<meta name="theme-color" content="#563d7c">


    <style>
    
        html { font-size: 13px; }
    
      a {
        color: black;
      	}
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
         body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#FCFCFC), to(#C6EAFC));
      background: -webkit-linear-gradient(bottom left, #FCFCFC 0%, #C6EAFC 100%);
      background: -moz-linear-gradient(bottom left, #FCFCFC 0%, #C6EAFC 100%);
      background: -o-linear-gradient(bottom left, #FCFCFC 0%, #C6EAFC 100%);
      background: linear-gradient(to top right, #FCFCFC 0%, #C6EAFC 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    </style>


    
    
  </head>
  <body>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<div class="container"> <!-- 최상위 선택자 container -->
<!-- jsp 클래스 구조 작업 container - row - col -->
	    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" id="joinForm" method="post" action="/member/join">
          <div class="row">
            <div class="col-md-4 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
              <label for="user_id">아이디</label>
              <input type="text" class="form-control" name="user_id" id="user_id" placeholder="6~12자 이내 입력">
            </div>
            <div class="col-md-2 mb-3">
            <label for="name">중복체크</label>
              	<button type="button" id="btn_idCheck" class="btn btn-outline-secondary">확인</button>
            </div>
              <div class="col-md-6 mb-3">
              <label for="user_name">이름</label>
              <input type="text" class="form-control" name="user_name" id="user_name" placeholder="이름을 입력">
            </div>
          </div>
            
            <div class="row">
            <div class="col-md-6 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
              <label for="user_password">비밀번호</label>
              <input type="password" class="form-control" name="user_password" id="user_password" placeholder="6~12자 이내 입력">
            </div>
            <div class="col-md-6 mb-3">
              <label for="user_password_confirm">비밀번호 확인</label>
              <input type="password" class="form-control" id="user_password_confirm" placeholder="">
            </div>
          </div>
          
             <div class="row">
          	 <div class="col-md-6 mb-3">
             	<label for="user_phone">연락처</label>
             	<input type="text" class="form-control" name="user_phone" id="user_phone" placeholder="예시) 01012345678">
            </div>
            <div class="col-md-4 mb-3">
              <label for="user_nickname">닉네임</label>
              <input type="text" class="form-control" name="user_nickname" id="user_nickname" placeholder="">
            </div>
            <div class="col-md-2 mb-3">
            <label for="name">중복체크</label>
              	<button type="button" id="btn_nicknameCheck" class="btn btn-outline-secondary">확인</button>
            </div>
          </div>
          
          <div class="row">
          <div class="col-md-4 mb-3">
            <label for="user_email">이메일</label>
            <input type="email" class="form-control" name="user_email" id="user_email" placeholder="you@example.com">
          </div>
          <div class="col-md-2 mb-3">
            <label for="email">인증코드</label>
            <button type="button" id="btn_authCode" class="btn btn-outline-secondary">요청</button>
          </div>
          <div class="col-md-4 mb-3">
           <label for="email">이메일 인증코드 입력</label>
            <input type="email" class="form-control" id="email_auth_code">
          </div>
          <div class="col-md-2 mb-3">
            <label for="email">인증코드 </label>
            <button type="button" id="btn_confirmAuthCode" class="btn btn-outline-secondary">확인</button>
          </div>       
          </div>

          
          <div class="row">
          <div class="col-md-4 mb-3">
            <label for="sample2_postcode">우편번호</label><!-- id와 label for 부분 같게하기 -->
            <input type="text" class="form-control" name="user_zipcode" id="sample2_postcode" ><!-- 다음 api에서 가져온 id -->
          </div>
          
          <div class="col-md-2 mb-3">
            <label for="email">우편번호</label>
            <button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-outline-secondary" >찾기</button>
          </div>

          <div class="col-md-6 mb-3"><!-- row, col로 감싸주는걸 권장 -->
            <label for="sample2_address">주소</label>
            <input type="text" class="form-control" name="user_addr" id="sample2_address" placeholder="서울특별시 강남구">
          </div>
		</div>


		<div class="row">
          <div class="col-md-12 mb-3">
            <label for="sample2_detailAddress">상세주소<span class="text-muted">&nbsp;</span></label>
            <input type="text" class="form-control" name="user_addr_detail" id="sample2_detailAddress" placeholder="상세주소를 입력해주세요.">
            <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
          </div>
          </div>

          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" name="user_email_state" id="user_email_state"><!-- 특정 값을 받고 싶으면 input에 value="" 를 설정한다 -->
            <label class="custom-control-label" for="user_email_state">개인정보 수집 및 이용에 동의합니다. (필수)</label><!-- 타입이 "checkbox" 이면 체크할 경우 파라미터로 on 값, 체크 안하면 null 값이 전달된다-->
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-outline-secondary btn-lg btn-block" id="btn_join" type="button">가입 완료</button><!-- button 눌러도 효과 없음. id로 클릭 이벤트를 따로 설정한다-->
        </form>
      </div>
    </div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</div>


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
  let nicknameCheck = false;
  let isAuthCode = false;

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
  
  

  // 메일 인증 코드 요청
  $("#btn_authCode").click(function(){
    if($("#user_email").val() == ""){
      alert("메일주소를 입력하세요");
      $("#user_email").focus();
      return;
    }

    $.ajax({
      url: '/email/send',
      type: 'get',
      dataType: 'text',
      data: {receiverMail : $("#user_email").val()},
      success: function(result){
        if(result == "success"){
          alert("인증 메일이 발송되었습니다. 메일을 확인해주세요.");
        }
      }
    });
  });


  // 메일 인증 코드 확인
  $("#btn_confirmAuthCode").click(function(){
    if($("#email_auth_code").val() == ""){
      alert("인증코드를 입력하세요");
      $("#email_auth_code").focus();
      return;
    }

    $.ajax({
      url: '/email/confirmAuthCode',
      type: 'get',
      dataType: 'text',
      data: {authCode : $("#email_auth_code").val()},
      success: function(result){
        if(result == "success"){
          alert("인증코드가 확인되었습니다.");
          isAuthCode = true;
        }else if(result == "fail"){
          alert("인증코드가 일치하지 않습니다. 인증코드를 확인해 주세요");
        }
      }
    });
  });

 
  // 회원 가입
  $("#btn_join").click(function(){
    let joinForm = $("#joinForm");

    // 유효성 검사 코드
      let reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
      let reg_id = /^[a-zA-Z0-9]{6,12}$/;
      let reg_password = /^[A-Za-z0-9]{6,12}$/;
      let reg_phone = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
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

      if(check_validate(user_name, "이름을 입력하세요") == false) return false;
      if(reg_validate(reg_name, user_name, "이름의 형식이 잘못되었습니다.") == false) return false;

      if(check_validate(user_password, "비밀번호를 입력하세요") == false) return false;
      if(reg_validate(reg_password, user_password, "비밀번호는 6~12 길이로 입력해주세요") == false) return false;

      if(check_validate(user_password_confirm, "비밀번호 확인을 입력하세요") == false) return false;
      if(user_password_confirm.value !== user_password.value){
          alert("비밀번호가 다릅니다.");
          user_password_confirm.focus();
          return false;
      }
      

      if(check_validate(user_phone, "연락처를 입력하세요") == false) return false;
      if(reg_validate(reg_phone, user_phone, "연락처의 형식이 잘못되었습니다.") == false) return false;
      if(check_validate(user_nickname, "닉네임을 입력하세요") == false) return false;
      if(reg_validate(reg_nickname, user_nickname, "닉네임은 한글, 영문을 포함한 2 ~ 12글자로 입력하세요") == false) return false;
      if(check_validate(user_email, "이메일을 입력하고 인증코드를 요청하세요") == false) return false;
      if(check_validate(email_auth_code, "입력하신 이메일로 전송된 인증코드를 입력하세요 ") == false) return false;
      if(check_validate(sample2_postcode, "우편번호를 입력하세요") == false) return false;
      if(check_validate(sample2_address, "기본주소를 입력하세요") == false) return false;
      if(check_validate(sample2_detailAddress, "나머지주소를 입력하세요") == false) return false;
      

      // 실행 코드 넣기 전에 잘 동작하는지 테스트
      // alert("입력 유효성 검사 끝");
      // return false;
          
      // return true;

      if(!$("#user_email_state").is(":checked")){
      alert("개인정보 수집 및 이용 동의 여부는 가입 필수 요건입니다.");
      return;
    }

    joinForm.submit();
  });

  }); // jQuery ready event end



</script>
    
  </body>
</html>
    