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
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   

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
      
      p#star_rv_rating a.rv_rating {
      	font-size: 22px;
      	text-decoration: none;
      	color: lightgray;
      }
      
      p#star_rv_rating a.rv_rating.on {
      	color: black;
      }

      td#star_rv_rating a.rv_rating {
      	font-size: 22px;
      	text-decoration: none;
      	color: lightgray;
      }
      
      td#star_rv_rating a.rv_rating.on {
      	color: black;
      }
      
    </style>
        
  </head>
  <body>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- GlobalControllerAdvice에서 작업한 카테고리 출력 위치 -->
<%@ include file="/WEB-INF/views/include/categoryMenu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h3>${category_name }</h3>
</div>

<div class="container">
<div class="row">
  	  <div class="col-md-6">   	 
        <img style="width: 400px; height: 400px" src="/product/displayImage?folderName=${product.prod_upload_folder}&fileName=${product.prod_img}">
      	</div>   
      <div class="col-md-6">
      	<p>상품명: ${product.prod_name }</p>
      	<p>가격: <fmt:formatNumber type="currency" pattern="#,###" value="${product.prod_price }" /> 원</p>
      	<p>제조사: ${product.prod_company }</p>
      	<p>수량: <input type="text" id="prod_qty" value="1" style="width: 50px;"></p>
      	<button type="button" name="btn_cart" data-prod_no="${product.prod_no }" class="btn btn-outline-secondary">장바구니</button>
        <button type="button" name="btn_orderDirect" data-prod_no="${product.prod_no }" class="btn btn-outline-secondary">바로구매</button>
      </div>
	</div>

	<div class="row">
  	  <div class="col-md-12">   
	<div id="tabs">
  <ul>
    <li><a href="#tabsProdDetail">상세정보</a></li>
    <li><a href="#tabsProdReview">상품후기</a></li>
  </ul>
  <div id="tabsProdDetail">
    <p>${product.prod_detail}</p>
  </div>
  <div id="tabsProdReview">
  
    <!-- 상품후기 목록 및 페이징 작업 -->
    <!-- 상품후기 쓰기 폼 -->
	<div class="row">
	  <div class="col-md-12">
	    <!-- form role="form"> ajax에서는 폼태그가 필요 없음 -->
	      <div class="box-body">
	        <div class="form-group row">
	          <div class="col-md-8">
	          <input type="text" class="form-control" id="review_content" placeholder="상품후기를 작성하세요"><!-- ajax 에서는 name 속성도 입력할 필요가 없다 -->
	          <p id="star_rv_rating">
	          	<a class="rv_rating" href="#">☆</a>
	          	<a class="rv_rating" href="#">☆</a>
	          	<a class="rv_rating" href="#">☆</a>
	          	<a class="rv_rating" href="#">☆</a>
	          	<a class="rv_rating" href="#">☆</a>
	          </p>
	          </div>
	          <div class="col-md-4">
	            <button type="button" id="btn_insertReview" class="btn btn-primary">등록</button>
	          </div>
	          
	        </div>
	      </div>
	    <!-- </form> -->
	</div>
	</div>
	    <div id="replyList"></div><!-- 댓글 목록 출력 위치 -->
	    <div id="replyPaging"></div><!-- 댓글 페이징 출력 위치 -->
  </div>

</div>
</div>
</div>


  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<!-- Handlebars 사용 -->
<!-- 상품후기를 수정할 때 사용하기 위해 input 을 hidden 처리해서 값을 저장해 놓음 -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script id="replyViewTemplate" type="text/x-handlebars-template">
<table class="table">
  {{#each .}}
    <tr>
      <td>{{review_no}}</td>
	  <td>{{displayStar review_rating}} <input type="hidden" name="review_rating" value="{{review_rating}}"></td>
      <td>{{review_content}}</td>
      <td>{{user_id}}</td>
      <td>{{convertDate upload_date}}</td>
      <td>
        {{authority user_id review_no}}
      </td>
    </tr>
  {{/each}}
</table>
</script>
<!-- Handlebars의 사용자 정의 Helper (함수와 비슷한 개념). millisecond를 자바스크립트의 Date객체 작업  -->
<script>
  // 스프링에서 날짜 데이터가 json으로 변환되면 밀리세컨드 단위로 들어온다 -> 아래 변환작업 필요 
  // 날짜 데이터가 json으로 변환되어, 밀리세컨드 단위로 된 것을 다시 날짜로 변환 작업
  // 자바스크립트의 Date 객체 사용
  Handlebars.registerHelper("convertDate", function(timeValue) {
    const date = new Date(timeValue);

    return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
  })
  
  	// 평점을(숫자) 별 기호로 표시하는 함수
    Handlebars.registerHelper("displayStar", function(rating) {
		
    	let starStr = "";
    	switch(rating){
    	case 1:
    		starStr = "★☆☆☆☆";
    		break;
    	case 2:
    		starStr = "★★☆☆☆";
    		break;
    	case 3:
    		starStr = "★★★☆☆";
    		break;
    	case 4:
    		starStr = "★★★★☆";
    		break;
    	case 5:
    		starStr = "★★★★★";
    		break;	
    	}
      return starStr;
  })


  Handlebars.registerHelper("authority", function(user_id, review_no){ 
    let str = "";
    let login_id = '${sessionScope.loginStatus.user_id}';
    if(user_id == login_id){ // 아이디가 일치하면 아래의 버튼 태그가 들어있는 str이 일치하지 않으면 공백값이 전달된다
      str += "<button type='button' class='btn btn-link' name='btn_re_edit' data-review_no='" + review_no + "'>수정</button>";
      str += "<button type='button' class='btn btn-link' name='btn_re_delete' data-review_no='" + review_no + "'>삭제</button>";
    }

    return new Handlebars.SafeString(str);
  })
</script>


<script>
      $(document).ready(function() {

        // 장바구니 버튼 클릭
        $("button[name='btn_cart']").on("click", function(){

          $.ajax({
            url: '/cart/addCartProd',
            type: 'post',
            data: {prod_no : $(this).data("prod_no") , cart_qty : $("#prod_qty").val()} ,
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
        
        
        $("button[name='btn_orderDirect']").on("click", function(){
        	let url = "/cart/addCartProdDir?prod_no=" + $(this).data("prod_no") + "&cart_qty=1";
        	location.href = url;
        });

      }); // jquery ready event end
      
    </script>
    
    
    <script>

      // jQuery 이벤트 설정 범위
      $(document).ready(function(){
      
        // 동적으로 추가된 태그를 click 이벤트 설정시 하는 작업
        // on("click","동적으로 생성된 태그 선택자", function(e){ });
        $("#replyPaging").on("click","li a", function(e){
          e.preventDefault(); // 링크 기능 취소
          // console.log("댓글 페이지 번호 클릭");
          // reviewPage 선택한 댓글 페이지 번호
          reviewPage = $(this).attr("href");
          url = "/review/list/" + prod_no + "/" + reviewPage + ".json";
          getPage(url); // 스프링에서 댓글 번호에 해당하는 댓글 데이터 가져오기
        });


        // 평점 별 클릭
        $("p#star_rv_rating a.rv_rating").on("click", function(e){
          e.preventDefault();
          $(this).parent().children().removeClass("on");
          $(this).addClass("on").prevAll("a").addClass("on");
        });


          // 댓글 쓰기
          $("#btn_insertReview").on("click", function(e) {
          let review_content = $("#review_content").val(); // 값 위치를 참조해서 값을 읽어온다. 댓글 내용
          let rv_rating = 0;

          console.log(review_content);

          $("p#star_rv_rating a.rv_rating").each(function(index, item){
            if($(this).attr("class") == "rv_rating on"){
              rv_rating += 1;
            }
          });

          if(rv_rating == 0){
            alert("별 평점을 선택하세요");
            return;
          }

          if(review_content == ""){
            alert("상품 후기를 입력하세요");
            return;
          }

          let reviewData = JSON.stringify({prod_no: ${product.prod_no }, review_rating : rv_rating, review_content : review_content}); 

          console.log(reviewData);

          $.ajax({
            type: 'post', // rest구문에서는 데이터를 입력할때는 post방식을 사용한다
            url: '/review/insertReview/', // 매핑주소의 컨트롤러 클래스가 RestController 성격이기 때문에, 전송데이터를 json 형식으로 사용함
            headers: {
              "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
            },
            dataType: 'text', // 스프링 메서드의 리턴 타입이 String이기 때문에 데이터타입은 text
            data: reviewData, // 서버로 보내는 json데이터
            success: function(result) {
              if(result == "success") {
                alert("상품 후기가 등록되었습니다.");
                $("#review_content").val(""); // 입력된 값을 초기화
                $("p#star_rv_rating a.rv_rating").removeClass("on");

                reviewPage = 1;
                url = "/review/list/" + prod_no + "/" + reviewPage + ".json";
                getPage(url); // 댓글을 다시 읽어오기 위한 작업

              }

            }
          });
        });


        // name="btn_re_edit". 동적으로 생성된 태그 이벤트 설정 (중요)
        // 상품후기 수정 폼
        $("div#replyList").on("click", "button[name='btn_re_edit']", function(){

          // 선택한 edit 버튼의 현재 tr
          let cur_tr = $(this).parent().parent(); // 위치 참조 변수 생성

          let review_no = cur_tr.children().eq(0).text(); // 값을 읽어서 변수에 저장
          let review_rating = cur_tr.children().eq(1).find("input[name='review_rating']").val();

          let displayStar = "";
          for(let i=0; i<5; i++){

              if(i < review_rating){
                displayStar += "<a href='#' class='rv_rating on'>";
                displayStar += "★";
              }else{
                displayStar += "<a href='#' class='rv_rating'>";
                displayStar += "☆";
              }
              displayStar += "</a>";
          }

          let input_displayStar = "<input type='hidden' name='review_rating' value='" + review_rating + "'>";

          let review_content = cur_tr.children().eq(2).text();
          let user_id = cur_tr.children().eq(3).text();
          let upload_date = cur_tr.children().eq(4).text();

          cur_tr.empty();

          // 추가할 데이터들
          let review_no_str = "<td><input type='text' id='edit_review_no' value='" + review_no + "' readonly></td>";
          let review_rating_str = "<td id='star_rv_rating'>" + displayStar + input_displayStar + "</td>";
          let review_content_str = "<td><input type='text' id='edit_review_content' value='" + review_content + "'></td>";
          let user_id_str = "<td>" + user_id + "</td>";
          let upload_date_str = "<td>" + upload_date + "</td>";

          // 버튼을 한 쌍으로 append 하기 위해서 변수에 += 연산자로 코드를 추가함
          let btn_str = "<td><button type='button' id='btn_re_cancel' class='btn btn-link'>취소</button>";
          btn_str += "<button type='button' id='btn_re_register' class='btn btn-link'>수정</button></td>";

          cur_tr.append(review_no_str, review_rating_str, review_content_str, user_id_str, upload_date_str, btn_str);
        
        });


        // 평점 별 클릭
        $("div#replyList").on("click", "td#star_rv_rating a.rv_rating", function(e){
          e.preventDefault();
          $(this).parent().children().removeClass("on");
          $(this).addClass("on").prevAll("a").addClass("on");
        })

        // 상품후기 수정하기
        $("div#replyList").on("click", "#btn_re_register", function() {
          let edit_review_no = $("#edit_review_no").val();
          let edit_review_content = $("#edit_review_content").val();

          let rv_rating = 0;

          // 별평점 수정 읽어오기
          // 별펑점 체크
          $("td#star_rv_rating a.rv_rating").each(function(index, item){
            if($(this).attr("class") == "rv_rating on"){
              rv_rating += 1;
            }
          });

          let reviewData = JSON.stringify({review_no: edit_review_no, review_content : edit_review_content, review_rating : rv_rating}); 

          // console.log(replyData); // json으로 변환된 코드 확인
          // return;

          $.ajax({
              type: 'patch',
              url: '/review/modfiyReview/',
              headers: {
                "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PUT"
              },
              data: 'text',
              data: reviewData,
              success: function(result) {
                if(result == "success") {
                  alert("상품후기 수정 성공");

                url = "/review/list/" + prod_no + "/" + reviewPage + ".json";

                getPage(url);
                }                
              }
            })

        });

        // 댓글 수정 취소하기
        // 취소 버튼 누르면 원래 모습으로 복원하기
        // button 태그 id 로 참조. #btn_re_cancel"
        $("div#replyList").on("click", "#btn_re_cancel", function(){
          
          let cur_tr = $(this).parent().parent();

          let edit_review_no = cur_tr.children().eq(0).find("#edit_review_no").val();
          let edit_star = cur_tr.children().eq(1).html();
          let edit_review_content = cur_tr.children().eq(2).find("#edit_review_content").val();
          let edit_user_id = cur_tr.children().eq(3).text();
          let edit_upload_date = cur_tr.children().eq(4).text();

          // 취소하면 원래 모습으로 복원하기
          let edit_review_no_str = "<td>" + edit_review_no + "</td>";
          let edit_star_str = "<td>" + edit_star + "</td>";
          let edit_review_content_str = "<td>" + edit_review_content + "</td>";
          let edit_user_id_str = "<td>" + edit_user_id + "</td>";
          let edit_upload_date_str = "<td>" + edit_upload_date + "</td>";

          let btn_str = "<td><button type='button' data-review_no=" + edit_review_no + " name='btn_re_edit' class='btn btn-link'>수정</button>";
          btn_str += "<button type='button' data-review_no=" + edit_review_no + " name='btn_re_edit' class='btn btn-link'>삭제</button></td>";

          cur_tr.empty();

          cur_tr.append(edit_review_no_str, edit_star_str, edit_review_content_str, edit_user_id_str, edit_upload_date_str, btn_str);
          
          // 취소하면 댓글 페이지를 다시 불러오기
          // url = "/review/list/" + prod_no + "/" + reviewPage + ".json";
          // getPage(url);

        });

     

          // 상품후기 삭제
          // button 태그 name으로 참조. "button[name='btn_re_delete']"
          $("div#replyList").on("click", "button[name='btn_re_delete']", function(){

            if(!confirm("댓글 삭제를 하시겠습니까?")) return;

            // $(this).data("rno") < 댓글 번호 값을 읽어옴
            $.ajax({
              type: 'delete',
              url: '/review/deleteReview/' + $(this).data("review_no"),
              headers: {
                "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE"
              },
              data: 'text',
              success: function(result){
                if(result == "success"){
                  alert("댓글 삭제 성공");

                
                url = "/review/list/" + prod_no + "/" + reviewPage + ".json";
                getPage(url); // 작업이 끝나면 댓글 부분을 다시 불러오기 위해 초기화
                }                
              }
            })
          });

        });  // jQuery ready 이벤트 부분
      


      // 댓글 목록과 페이징 작업
      // ajax 메서드 설명 참고 https://www.w3schools.com/jquery/jquery_ref_ajax.asp

      // url <- 스프링 주소를 ajax 방식으로 요청. 콜백함수 사용 (작업이 끝나고 자기자신으로 다시 돌아와서 동작하는 함수)
      // 클라이언트가 url 주소로 요청한 데이터가 data 변수에 들어와서 화면에 출력된다
      let prod_no = ${product.prod_no }; // 상품 코드
      let reviewPage = 1;
      // @RequestMapping("/review/*"), @GetMapping("/list/{prod_no}/{page}") url 주소
      let url = "/review/list/" + prod_no + "/" + reviewPage + ".json";

      // pro_detail.jsp 파일이 실행되고 -> 아래의 함수가 호출되어 $.getJSON을 이용해 스프링이 동작된다
      // 상품상세 페이지(맨 처음 동작)와 상품 후기(다음 동작)를 가져오는 작업이 따로 실행된다는 것을 기억하기
      getPage(url); // 함수 호출

      // 클라이언트가 요청한 url에 응답하는 데이터가 data 변수에 들어옴
      // 주소가 요청되면 ReplyController의 getList 메서드가 실행되어 return값 entity가 data에 저장됨
      // $.getJSON( url [, data ] [, success < 여기서 function 사용 ] )
      function getPage(url){
        $.getJSON(url, function(data){

         // 메서드 호출. printReplyData(json형식의 댓글 데이터 ,데이터가 삽입될 위치, 템플릿)
          printReplyData(data.list, $("#replyList") ,$("#replyViewTemplate")); // 상품 후기
          printReplyPaging(data.pageMaker, $("#replyPaging")); // 상품 후기 페이징


        });
      }

          // 댓글 목록 출력 기능. replyArr : 댓글 목록 데이터(json), target : 댓글 삽입 위치, template : 핸들바 문법이 삽입된 댓글 디자인 
          function printReplyData(replyArr, target, template){
          //templateObj 변수가 댓글 ui(템플릿)를 참조
          let templateObj = Handlebars.compile(template.html()); // replyViewTemplate 안의 내용을 컴파일 한다. 테이블 태그를 읽어옴
          // 댓글 목록 데이터(json형식) + 테이블 형식 
          let replyHtml = templateObj(replyArr); // 테이블 태그와 데이터가 바인딩 되어 replyHtml에 저장된다
          target.empty(); // div 태그 안의 내용을 비운다 (데이터가 누적되지 않게 초기화)
          target.append(replyHtml);
          // console.log(replyHtml);


        }


        // 페이징 출력 기능
        function printReplyPaging(pageMaker, target){

          let pageInfoStr = '<nav aria-label="Page navigation example">';
               pageInfoStr += '<ul class="pagination">';

          if(pageMaker.prev) { // true이면 아래 코드가 추가되어 prev 가 나타남
            pageInfoStr += '<li class="page-item">';
            pageInfoStr += '<a class="page-link" href="' + (pageMaker.startPage - 1) + '" aria-label="Previous">';
            pageInfoStr += '<span aria-hidden="true">&laquo;</span>';
            pageInfoStr += '</a>';
            pageInfoStr += '</li>';
          }      

          for(let i=pageMaker.startPage; i<= pageMaker.endPage; i++) {
            let currPageClass = (pageMaker.cri.pageNum == i) ? 'active' : '';
            pageInfoStr += '<li class="page-item ' + currPageClass + '"><a class="page-link" href="' + i + '">' + i + '</a></li>';
          }

          if(pageMaker.next) {
            pageInfoStr += '<li class="page-item">';
            pageInfoStr += '<a class="page-link" href="' + (pageMaker.endPage + 1) + '" aria-label="Next">';
            pageInfoStr += '<span aria-hidden="true">&raquo;</span>';
            pageInfoStr += '</a>';
            pageInfoStr += '</li>';
          }

          target.html(pageInfoStr);


        }


     </script>
    
  </body>
</html>
    