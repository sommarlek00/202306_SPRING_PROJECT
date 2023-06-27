<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

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
    </style>
    
  </head>
  <body>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- GlobalControllerAdvice에서 작업한 카테고리 출력 위치 -->
<%@ include file="/WEB-INF/views/include/categoryMenu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h3>장바구니</h3>
</div>
<!-- 장바구니 목록 출력 -->
<div class="container">
<div class="row">
		<div class="col-md-12">

              <table class="table table-bordered">
                <tbody><tr>
                  <th style="width: 50%">상품명</th>
                  <th style="width: 10%">수량</th>
                  <th style="width: 10%">포인트</th>
                  <th style="width: 10%">배송비</th>
                  <th style="width: 10%">가격</th>
                  <th style="width: 10%">취소</th>
                </tr>
                <c:forEach items="${cartList }" var="cartList">
                <tr>
                  <td>
                  	<a class="move" href="${cartList.prod_no }"><img src="/cart/displayImage?folderName=${cartList.prod_upload_folder}&fileName=s_${cartList.prod_img}" /></a>
                    <a class="move" href="${cartList.prod_no }"><c:out value="${cartList.prod_name }"></c:out></a><!-- 제목 부분이 글번호 값을 가지고 있음 -->
                    <input type="hidden" name="cart_no" value="${cartList.cart_no }">
                  </td>
                  <td>
                    <input type="text" name="cart_qty" style="width:100px" value="${cartList.cart_qty }">
                    <button type="button" name="btn_changeCartQty" class="btn btn-link">수량변경</button>
                  </td>
                  <td>포인트 : 0</td>
                  <td>
                  [기본배송조건]
                  </td>
                  <td><input type="text" name="unitprice" style="width:100px" value="${cartList.unitprice }"></td>
                  <td><button type="button" name="btn_deleteProd" class="btn btn-link">삭제</button></td><!-- 버튼에 상품코드 데이터를 숨겨두고 매핑주소의 메서드 파라미터로 전달한다 -->
                </tr>
                </c:forEach>
              </tbody>
            <c:if test="${!empty cartList }">
            	<tfoot>
            		<tr>
            			<td colspan="6" class="text-right">총 구매금액 : <fmt:formatNumber type="currency" pattern="#,###" value="${cartTotalAmount }" />원</td>
            		</tr>
            	</tfoot>
            </c:if>
            <c:if test="${empty cartList}">
            	<tfoot>
            		<tr>
            			<td colspan="6" class="text-center">장바구니에 상품이 없습니다.</td>
            		</tr>	
            	</tfoot>
            </c:if> 
			</table>
		</div>
	</div>
<div class="row">
	<div class="col-md-12 text-center">
		<button type="button" id="btn_emptyCart" class="btn btn-light">장바구니 비우기</button>
		<a href="/"><button type="button" class="btn btn-light">계속 쇼핑하기</button></a>
		<button type="button" id="btn_order" class="btn btn-dark">주문하기</button>
	</div>
</div>	

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>
$(document).ready(function(){
	
	// 상품명 또는 이미지 클릭 - 상품 상세 페이지로 이동
    $("a.move").on("click", function(e) {
      e.preventDefault();

      let prod_no = $(this).attr("href");
      console.log("상품코드: " + prod_no);
	  let url = "/product/prodDetail?prod_no=" + prod_no;
	  location.href = url;      
    });
	
  // 장바구니 상품 수량 변경
  $("button[name='btn_changeCartQty']").on("click", function(){

    let cur_changeCartQty = $(this);
    let cart_no = cur_changeCartQty.parent().parent().find("input[name='cart_no']").val();
    let cart_qty = cur_changeCartQty.parent().find("input[name='cart_qty']").val();

    $.ajax({
      url: '/cart/changeCartQty',
      type:'get',
      data: {cart_no : cart_no, cart_qty : cart_qty},
      dataType: 'text',
      beforeSend: function(xhr){
        xhr.setRequestHeader("AJAX",true)
      },
      success: function(result){
        if(result == "success"){
          alert("해당 상품의 수량이 변경 되었습니다.");
          location.href = "/cart/cartList";
        }
      },
      error: function(xhr, status, error){
        alert("로그인 페이지로 이동합니다.");
        location.href = "/member/login";
      }
    });
  });


  $("button[name='btn_deleteProd']").on("click", function(){

    if(!confirm("해당 상품을 삭제 하시겠습니까?")) return;

    let cart_no = $(this).parent().parent().find("input[name='cart_no']").val();

    $.ajax({
      url: '/cart/deleteCartProd',
      type: 'post',
      data: {cart_no : cart_no},
      dataType: 'text',
      success: function(result){
        if(result == "success"){
          alert("상품이 삭제 되었습니다.");
          location.href = "/cart/cartList";
        }
      }
    });
  });


  $("#btn_emptyCart").on("click", function(){
	 if(!confirm("장바구니의 상품을 모두 삭제하시겠습니까?")) return;
	 location.href = "/cart/emptyCart";
  });
  
  $("#btn_order").on("click", function(){
	  location.href = "/order/orderInfo";
  });

  
  
}); // jQuery ready envent end


</script>
    
  </body>
</html>
    