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
<%@ include file="/WEB-INF/views/include/categoryMenu.jsp" %>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1>주문/결제</h1>
</div>

<div class="container"><!-- 레이아웃 시작 -->
 <div class="row">
  <div class="col-md-12">
      <div>
        <h4 class="mb-3">주문자정보</h4>
        <div class="row border-top pt-3">
            <div class="col-md-2">
              <label for="user_name">이름</label>
            </div>
            <div class="col-md-10">
              ${member.user_name }
            </div>
        </div>
          
          <div class="row pt-3">
            <div class="col-md-2">
              <label for="user_email">메일주소</label>
            </div>
            <div class="col-md-10">
              <input type="hidden" id="orderProdName" value="${orderProdName }">
              <input type="text" class="form-control" name="db_user_email" id="db_user_email" value="${member.user_email }">
            </div>
          </div>
          <div class="row pt-3">
            <div class="col-md-2">
              <label for="mbsp_phone">연락처</label>
            </div>
            <div class="col-md-10">
              <input type="text" class="form-control" name="db_mbsp_phone" id="db_mbsp_phone" value="${member.user_phone }">
            </div>
          </div>
          <h4 class="mb-3 mt-3">배송정보</h4>
          <div class="row border-top pt-3">
            <div class="col-md-2">
              <label for="ord_name">이름</label><!-- 배송정보는 OrderVO 필드와 맞춰주기 -->
            </div>
            <div class="col-md-10">
              <input type="text" class="form-control" name="ord_name" id="ord_name">
            </div>
        </div>
          
          <div class="row pt-3">
            <div class="col-md-2">
              <label for="ord_phone">연락처</label>
            </div>
            <div class="col-md-10">
              <input type="text" class="form-control" name="ord_phone" id="ord_phone">
            </div>
          </div>

          <div class="row pt-3">
            <div class="col-md-2">
              <label for="ord_zipcode">주소</label>
            </div>
            <div class="col-md-10">
              <input type="text" class="form-control" name="ord_zipcode" id="sample2_postcode">
              <button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-primary">우편번호 찾기</button>
              <input type="text" class="form-control" name="ord_addr" id="sample2_address" placeholder="서울특별시 강남구">
              <input type="text" class="form-control" name="ord_addr_detail" id="sample2_detailAddress" placeholder="상세주소를 입력해주세요.">
            <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">	
            </div>
          </div>
                   
          <div class="row pt-3">
          	<div class="col-md-2">
          		<label>결제방법</label>
          	</div>
          	<div class="col-md-10">
          		<select name="pay_method" id="pay_method" class="custom-select w-40"><!-- w-25 너비 25% -->
          			<option value="">결제방법을 선택하세요</option>
          			<option value="무통장입금" >무통장입금</option>
          			<option value="카카오페이" >카카오페이</option>
          		</select>
          		<select name="pay_bank" id="pay_bank" style="display: none;" class="custom-select w-40">
          			<option value="">입금은행을 선택하세요</option>
          			<option value="국민 111-11111-111">국민은행</option>
          			<option value="하나 222-22222-222">하나은행</option>
          		</select>
          		<p id="pay_user_vw" style="display: none;">입금자명 : <input type="text" class="form-control" name="pay_user" id="pay_user"></p>
          	</div>
          </div>
		 		           
          <hr class="mb-4">
          <div>
            <label>결제하기</label>
          </div>
          <div class="mb-4 text-center">
 		  <input type="hidden" name="ord_total_amount" id="ord_total_amount" value="${cartTotalAmount }"><!-- 가격 정보도 Order 테이블에 저장시켜야 하기 때문에 hideen 처리 -->       
          <button name="btn_buy" data-paytype="bank" class="btn btn-primary" id="btn_bankPayment" type="button">무통장 결제</button><!-- ajax로 요청되기 때문에 form태그가 필요 없다 -->
          <img src="/image/payment_icon_yellow_small.png" data-paytype="kakaopay" name="btn_buy" id="kakaoPayment"><!-- data 를 이용해서 btn_buy의 구분값을 저장해놓는다 -->
          </div>     
      </div>
      </div>
    </div>
 <div class="row">
  	<div class="col-md-12">

              <table class="table table-bordered">
                <tbody><tr>
                  <th style="width: 45%">상품</th>
                  <th style="width: 10%">수량</th>
                  <th style="width: 30%">배송비</th>
                  <th style="width: 15%">주문금액</th>
                </tr>
                <c:forEach items="${cartList }" var="cartList">
                <tr>
                  <td>
                  	<img src="/cart/displayImage?folderName=${cartList.prod_upload_folder }&fileName=s_${cartList.prod_img}" />
                    <c:out value="${cartList.prod_name }" ></c:out>
                  </td>
                  <td>
                    ${cartList.cart_qty }
                   
                  </td>
                  <td>
                  	[기본배송조건]
                 </td>
                  <td>${cartList.unitprice }</td>               
                </tr>
                </c:forEach>
                
              </tbody>
              <tfoot>
              	<tr>
              		<td colspan="6" class="text-right">총 구매금액 : <fmt:formatNumber type="currency" pattern="₩#,###" value="${cartTotalAmount }"/></td>
              	</tr>
              </tfoot>
              </table>

  	</div>
 </div>
  
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
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
    $(document).ready(function() {

      $("#btn_bankPayment").attr("disabled", true);
      $("#kakaoPayment").attr("disabled", true);

      $("[name='btn_buy']").on("click", function(){
        let payType = $(this).data("paytype");
        alert(payType);
        let orderInfo = {
          payType : payType,

          orderProdName : $("#orderProdName").val(),

          ord_name : $("#ord_name").val(),
          ord_zipcode : $("input[name='ord_zipcode']").val(),
	      ord_addr : $("input[name='ord_addr']").val(),
	      ord_addr_detail : $("input[name='ord_addr_detail']").val(),
	      ord_phone : $("#ord_phone").val(),
          ord_total_amount : $("#ord_total_amount").val(),

          pay_method : $("#pay_method").val(),
          pay_price : $("#ord_total_amount").val(),
          pay_user : $("#pay_user").val(),
          pay_bank : $("#pay_bank").val(),
          pay_memo : '생략'
        };

        $.ajax({
          url: '/order/orderPayment',
          data: orderInfo,
          dataType: 'json',
          type: 'get',
          success: function(result){
        	  alert(payType);
        	  
            if(payType == "kakaopay"){
              location.href = result.next_redirect_pc_url;
            }else if(payType == "bank"){
              location.href = "/order/orderComplete";
            }
          }
        });
      });

      $("#pay_method").on("change", function(){

        let pay_method = $(this).val();

          if(pay_method == "무통장입금"){
            $("#btn_bankPayment").attr("disabled", false);
            $("#kakaoPayment").attr("disabled", true);
            $("#pay_user_vw").css("display", "block");
            $("#pay_bank").css("display", "block");
          }else if(pay_method == "카카오페이"){
            $("#btn_bankPayment").attr("disabled", true);
            $("#kakaoPayment").attr("disabled", false);
            $("#pay_user_vw").css("display", "none");
            $("#pay_bank").css("display", "none");
          }
      });


     

    }); // jquery ready event end


   </script>
  </body>
</html>