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
    <title>ASKIN MALL</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    
	<%@ include file="/WEB-INF/views/include/config.jsp" %>
   
    <style>
    
    html { font-size: 13px; }
    
      a {
        color: black;
        text-decoration-line: none;
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
          font-size: small;
        }
      }
    </style>

    <script>
    
    // rttr.addFlashAttribute("msg", msg);
    let msg = '${msg}'; // "msg"에 변수의 값이 들어있음
    if(msg == 'modify'){
    	alert("회원정보가 수정되었습니다.");
    }
    
    </script>
    
    
    
  </head>
  <body>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<%@ include file="/WEB-INF/views/include/categoryMenu.jsp" %>

<main role="main">
<section class="jumbotron text-center bg-white">
    <div class="container">
      <div style="text-align : center;"><img src="/image/main2.png"></div>
      <p class="lead text-muted"></p>
    </div>
  </section>
  </main>
  
  	<%@ include file="/WEB-INF/views/include/footer.jsp" %>


  

    
  </body>
</html>
    