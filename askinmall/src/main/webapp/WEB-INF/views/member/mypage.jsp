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
        <h4 class="mb-3">마이페이지</h4>
        
          <div class="row">
            <div class="col-md-4 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
              <label for="user_id">아이디</label><!-- 속성과 값이 같은 경우 생략 가능 ex) readonly="readonly" -->
              <input type="text" class="form-control" name="user_id" id="user_id" value="${memberVO.user_id }" readonly >
            </div>
            
            <div class="col-md-3 mb-3">
              <label for="user_name">이름</label>
              <input type="text" class="form-control" name="user_name" id="user_name" value="${memberVO.user_name }">
            </div>
            <div class="col-md-5 mb-3">
            <label for="user_email">이메일</label>
            <input type="email" class="form-control" name="user_email" id="user_email" value="${memberVO.user_email }">
          </div>
          </div>
                    
          <div class="row">
          <div class="col-md-2 mb-3">
            <label for="sample2_postcode">우편번호</label><!-- id와 label for 부분 같게하기 -->
            <input type="text" class="form-control" name="user_zipcode" id="sample2_postcode" value="${memberVO.user_zipcode }"><!-- 다음 api에서 가져온 id -->
          </div>

          <div class="col-md-5 mb-3"><!-- row, col로 감싸주는걸 권장 -->
            <label for="sample2_address">주소</label>
            <input type="text" class="form-control" name="user_addr" id="sample2_address" value="${memberVO.user_addr }">
          </div>
          
          <div class="col-md-5 mb-3">
            <label for="sample2_detailAddress">상세주소<span class="text-muted">&nbsp;</span></label>
            <input type="text" class="form-control" name="user_addr_detail" id="sample2_detailAddress" value="${memberVO.user_addr_detail }">
            <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
          </div>
		</div>
          
          <div class="row">
          	   <div class="col-md-6 mb-3">
              <label for="user_phone">연락처</label>
              <input type="text" class="form-control" name="user_phone" id="user_phone" value="${memberVO.user_phone }">
            </div>
            <div class="col-md-6 mb-3">
              <label for="user_nickname">닉네임</label>
              <input type="text" class="form-control" name="user_nickname" id="user_nickname" value="${memberVO.user_nickname }">
            </div>
          </div>
            
            <hr class="mb-4">
         <div class="row">
    	<div class="col-md-12 mb-3"><!-- mb : margin bottom 속성 -->
    		<button type="button" class="btn btn-link" id="btn_modify">회원정보 수정</button><!-- modify -->
        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#pwChangeModal">비밀번호 변경</button>
    		<button type="button" class="btn btn-link" data-toggle="modal" data-target="#deleteModal">회원탈퇴</button>
    		</div>
    	</div>
            
      </div>
    </div>
    



<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</div>

<!-- 모달 관련 참고 : https://getbootstrap.com/docs/4.6/components/modal/ -->

<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> 
data-toggle="modal" data-target="#" 이부분을 실제 사용할 버튼에 가져다 씀
-->

<!-- Modal -->
<div class="modal fade" id="pwChangeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-md-4 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
            <label for="old_user_password">기존 비밀번호</label><!-- 속성과 값이 같은 경우 생략 가능 ex) readonly="readonly" -->
            <input type="password" class="form-control" id="old_user_password"  >
          </div>
          
          <div class="col-md-4 mb-3">
            <label for="new_user_password">신규 비밀번호</label>
            <input type="password" class="form-control" id="new_user_password" >
          </div>

          <div class="col-md-4 mb-3">
            <label for="re_user_password">비밀번호 확인</label>
            <input type="password" class="form-control" id="re_user_password" >
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="btn_pwChange">변경하기</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">탈퇴신청</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-md-6 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
            <label for="user_password">비밀번호를 입력해주세요</label><!-- 속성과 값이 같은 경우 생략 가능 ex) readonly="readonly" -->
            <input type="password" class="form-control" id="user_password" >
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="btn_delete">탈퇴하기</button>
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function(){

  // 버튼 클릭 이벤트
  // 회원정보 수정
  $("#btn_modify").click(function(){
    location.href = "/member/modify";
  });

  // 비밀번호 변경
  $("#btn_pwChange").click(function(){

    if($("#new_user_password").val() != $("#re_user_password").val()){
      alert("신규 비밀번호가 일치하지 않습니다.");
      return;
    }

    $.ajax({
      url: '/member/pwChange',
      type: 'post',
      data: {old_user_password: $("#old_user_password").val(), new_user_password: $("#new_user_password").val()},
      dataType: 'text',
      success: function(result){
        if(result == "success"){
          alert("비밀번호가 변경 되었습니다.");
          $("#old_user_password").val('');
          $("#new_user_password").val('');
          $("#re_user_password").val('');
          $("#pwChangeModal").modal('hide');
        }else if(result == "failPW"){
          alert("기존 비밀번호가 일치하지 않습니다. \n재입력 해주세요.");
          $("#old_user_password").val('');
          $("#old_user_password").focus
        }
      }
    });
  });

  // 회원 탈퇴
  $("#btn_delete").click(function(){

    $.ajax({
      url: '/member/delete',
      type: 'post',
      data: {user_password: $("#user_password").val()},
      dataType: 'text',
      success: function(result){
        if(result == "success"){
          alert("회원 탈퇴가 되었습니다.");
          $("#deleteModal").modal('hide');
          location.href = "/";
        }else if(result == "failPW"){
          alert("기존 비밀번호가 일치하지 않습니다. \n재입력 해주세요.");
          $("#user_password").val('');
          $("#user_password").focus
        }
      }
    });
  });



}); // ready end


</script>


    
  </body>
</html>
    