<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">  
<%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
<link rel="stylesheet" href="/css/adLogin.css">

<!-- <link rel="stylesheet" href="resources/css/adLogin.css"> 이렇게 설정하거나
	  servlet-context.xml 파일에서 css 경로에 대한 매핑주소를 설정한다 -->



</head>
<body>
<div class="main">
	<div class="container">
		<div style="text-align: center;">
			<div class="middle">
			
			<div id="login">
				<form action="/admin/adminLogin" method="post">
					<fieldset class="clearfix">
					<p>
						<span class="fa fa-user"></span>
						<input type="text"  name="admin_id" id="admin_id" value="admin"  Placeholder="Username" required>
					</p> <!-- JS because of IE support; better: placeholder="Username" -->
					<p>
						<span class="fa fa-lock"></span>
						<input type="password" name="admin_password" id="admin_password" value="1234"  Placeholder="Password" required>
					</p> <!-- JS because of IE support; better: placeholder="Password" -->
					<div>
						<span style="width:100%; text-align:right;  display: inline-block;">
							<input type="submit" value="로그인">
						</span>
					</div>
					
					</fieldset>
					<div class="clearfix"></div>
				</form>
				<div class="clearfix"></div>
			</div> <!-- end login -->
			
			<div class="logo">ASKIN
				<div class="clearfix"></div>
			</div>
			</div>
		</div>
	</div>

</div>

<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>
 <script>
 
 	$(document).ready(function(){
 		
 	      let msg = '${msg}';
 	     if(msg == 'failID'){
 	    	 // alert는 블락 성격을 가지고 있어서 확인버튼을 누르기까지는 아래의 html 코드가 읽어지지 않는다
 	    	 // ready 이벤트 안에 사용하면 html을 모두 읽어들이고 실행되어서 관리자 페이지가 유지되는 상태로 alert 창이 뜬다
 	    	 alert("아이디를 확인하세요"); 
 	    //	 $("#admin_id").focus();
 	     }else if(msg == 'failPW'){
 	    	 alert("비밀번호를 확인하세요");
 	    //	 $("#admin_pw").focus();
 	     }
 		 		
 	});
 


 </script>


</body>
</html>