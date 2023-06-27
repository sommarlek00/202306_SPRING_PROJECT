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


<div class="container">
	    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h5 class="mb-3">로그인</h5>
        
        <div class="box box-info">
            <div class="box-header with-border">
              <h4 class="box-title"></h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" method="post" action="/member/login">
              <div class="box-body">
                <div class="form-group">
                  <label for="user_id" class="col-sm-2 control-label">ID</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디 입력">
                  </div>
                </div>
                <div class="form-group">
                  <label for="user_password" class="col-sm-2 control-label">Password</label>

                  <div class="col-sm-10">
                    <input type="password" class="form-control" name="user_password" id="user_password" placeholder="비밀번호 입력">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-3 col-sm-10">
                    <div>
                      <button type="submit" class="btn btn-outline-secondary pull-right">로그인</button>
                      <button type="button" class="btn btn-link" style="float: right;" data-toggle="modal" data-target="#findIdModal">아이디 찾기</button>
                      <button type="button" class="btn btn-link" style="float: right;" data-toggle="modal" data-target="#pwChangeModal">비밀번호 찾기</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
         
      </div>
    </div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</div>

<!-- Modal -->
<!-- 아이디 찾기 모달 폼 -->
<div class="modal fade" id="findIdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-md-4 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
            <label for="user_name">이름</label><!-- 속성과 값이 같은 경우 생략 가능 ex) readonly="readonly" -->
            <input type="text" class="form-control" id="user_name" >
          </div>
      </div>
      <div class="row">
        <div class="col-md-4 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
          <label for="user_email">메일주소</label><!-- 속성과 값이 같은 경우 생략 가능 ex) readonly="readonly" -->
          <input type="text" class="form-control" id="user_email" >
        </div>
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="btn_id_confirm">아이디 찾기</button>
      </div>
    </div>
  </div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="pwChangeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-md-4 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
            <label for="user_name">아이디</label><!-- 속성과 값이 같은 경우 생략 가능 ex) readonly="readonly" -->
            <input type="text" class="form-control" id="findPW_user_id" >
          </div>
      </div>
      <div class="row">
        <div class="col-md-4 mb-3"> <!-- 한 행에 여러 필드를 넣고 싶을 때 row, col-md 설정 -->
          <label for="user_email">메일주소</label><!-- 속성과 값이 같은 경우 생략 가능 ex) readonly="readonly" -->
          <input type="text" class="form-control" id="findPW_user_email" >
        </div>
    </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="btn_find_pw">임시비밀번호 요청</button>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function(){
    let msg = '${msg}'
    let db_user_id = '${db_user_id}'
    

    if(msg == 'failID'){
      alert("아이디를 확인하세요");
      $("#user_id").focus();
    }else if(msg == 'failPW'){
      alert("비밀번호를 확인하세요");
      $("#user_password").focus();
    }

  
  $("#btn_id_confirm").click(function(){

  $.ajax({
  url: '/member/findID',
  type: 'get',
  data: {user_name: $("#user_name").val(), user_email: $("#user_email").val()},
  dataType: 'text',
  success: function(result){
    if(result !== ''){
      alert("회원님의 아이디는 " + result + " 입니다.");
      $("#user_name").val('');
      $("#user_email").val('');
      $("#findIdModal").modal('hide');
    }else if(result == ''){
      alert("해당하는 아이디가 존재하지 않습니다.");
      $("#user_name").val('');
      $("#user_email").val('');
    }
  }
});
});

$("#btn_find_pw").click(function(){

  $.ajax({
    url: '/email/sendTmpPW',
    type: 'get',
    data: {user_id: $("#findPW_user_id").val(), user_email: $("#findPW_user_email").val(), receiverMail: $("#findPW_user_email").val()},
    dataType: 'text',
    success: function(result){
      if(result == 'success'){
      alert("메일로 임시 비밀번호가 전송되었습니다");
      $("#findPW_user_id").val('');
      $("#findPW_user_email").val('');
      $("#pwChangeModal").modal('hide');

    }else if(result == 'fail'){
      alert("해당하는 회원정보가 존재하지 않습니다.");
      $("#findPW_user_id").val('');
      $("#findPW_user_email").val('');
    }

    }


  });

});



  }); // ready event end
 
</script> 

    
  </body>
</html>
    