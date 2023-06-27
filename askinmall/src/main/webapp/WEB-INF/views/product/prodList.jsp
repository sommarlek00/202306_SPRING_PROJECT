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
        text-decoration-line: none;
      	}
      	
    .btn_prod{
	text-align: center;
	}
	.btn_prod1{
	display :inline-block;
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
  <h1 class="display-4"></h1>
  <p class="lead"></p>
</div>

<div class="container">
<div class="row">
  <div class="card-deck mb-3 text-center">  
  	<c:forEach items="${prodList}" var="product">
  	  <div class="col-md-3">
   	 <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h7 class="my-0 font-weight-normal"><a class="move" href="${product.prod_no}">${product.prod_name}</a></h7>
      </div>
      <div class="card-body">
      	<h5><fmt:formatNumber type="currency" pattern="₩#,###" value="${product.prod_price }" /></h5>
        <a class="move" href="${product.prod_no }"><img src="/product/displayImage?folderName=${product.prod_upload_folder}&fileName=s_${product.prod_img}"></a>
        <div class="btn_prod">
        <button type="button" name="btn_cart" data-prod_no="${product.prod_no }" class="btn btn-light btn-sm">장바구니</button>
        <button type="button" name="btn_orderDirect" data-prod_no="${product.prod_no }" class="btn btn-light btn-sm">바로구매</button>
        </div>
      </div>   
    </div>
      </div> 
   </c:forEach> 
  </div>
</div>

<div class="row">
	<div class="col-md-12">
		        <ul class="pagination pagination-sm no-margin pull-right">
                <c:if test="${pageMaker.prev }">
                <li><a href="${pageMaker.startPage - 1}">[prev]</a></li>
                </c:if>
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                <li ${pageDTO.cri.pageNum == pageNum ? "class='active'": ""}><a href="${pageNum}">${pageNum }</a></li>
               </c:forEach>
                <c:if test="${pageMaker.next }">
                <li><a href="${pageMaker.endPage + 1}">[next]</a></li>
                </c:if>
              </ul>

              <form id="actionForm" action="/product/prodList" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
              </form>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>
  $(document).ready(function() {

    let actionForm = $("#actionForm");


// 상품명 또는 이미지 클릭
    $("a.move").on("click", function(e) {
      e.preventDefault();

      let prod_no = $(this).attr("href");
      console.log("상품코드: " + prod_no);

  actionForm.find("input[name='prod_no']").remove();
      actionForm.append("<input type='hidden' name='prod_no' value='" + prod_no + "'>");
      actionForm.attr("action","/product/prodDetail");
      actionForm.submit();
    });


    $("ul.pagination a").on("click", function(e){
      e.preventDefault();

      // 주소를 다이렉트로 연결 설정 서버측에 cat_code, cat_name을 먼저 전달하고 pro_list 매핑 주소를 요청
      actionForm.attr("action","/product/prodList/${category_cd}/${category_name}");
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
      actionForm.submit();

    });

    // 장바구니 버튼 클릭
    $("button[name='btn_cart']").on("click", function(){

      $.ajax({
        url: '/cart/addCartProd',
        type: 'post',
        data: {prod_no : $(this).data("prod_no"), cart_qty : 1},
        success: function(result){
          if(result == "success"){
            alert("장바구니에 추가되었습니다");
            if(confirm("장바구니로 이동하시겠습니까?")){
              location.href="/cart/cartList";
            }
          }
        }
      });
    });

    
    // 바로구매 버튼 클릭
    $("button[name='btn_orderDirect']").on("click", function(){
    	let url = "/cart/addCartProdDir?prod_no=" + $(this).data("prod_no") + "&cart_qty=1";
    	location.href = url;
    });


  }); // jquery ready event end



</script>
    
  </body>
</html>
    