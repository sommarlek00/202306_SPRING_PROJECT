<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
    
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-light">
  <h5 class="my-0 mr-md-auto font-weight-normal"><a href="/" style="text-decoration-line: none";>ASKIN</a></h5>
  <c:if test="${sessionScope.loginStatus != null }">
  <span>${sessionScope.loginStatus.user_nickname } 님</span> 
  <span>/ 최근 접속:
  <fmt:formatDate value="${sessionScope.loginStatus.login_date }" pattern="yyyy-MM-dd HH:mm"/>
  </span>
  </c:if>
  <nav class="my-2 my-md-0 mr-md-3">
  
  <!-- 로그인 이전 표시 -->
 	<c:if test="${sessionScope.loginStatus == null }"><!-- 세션 작업한 객체 가져다 씀. MemberVO 성격을 가지고 있음 -->
    <a class="p-2 text-dark" style="text-decoration-line: none"; href="/member/login">로그인</a>
    <a class="p-2 text-dark" style="text-decoration-line: none"; href="/member/join">회원가입</a>
    </c:if>
    
    <!-- 로그인 이후 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
    <a class="p-2 text-dark" style="text-decoration-line: none"; href="/member/logout">로그아웃</a>
    <a class="p-2 text-dark" style="text-decoration-line: none"; href="/member/modify">회원정보</a>
    </c:if>
    
    <a class="p-2 text-dark" style="text-decoration-line: none"; href="/member/mypage">마이페이지</a>
    <a class="p-2 text-dark" style="text-decoration-line: none"; href="/cart/cartList">장바구니</a>
  </nav>
</div>