<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="categoryMenu">
  <ul class="nav justify-content-center" id="mainCategory">
  <c:forEach items="${categoryList }" var="category">
    <li class="nav-item">
      <a class="nav-link" href="${category.category_cd }"><c:out value="${category.category_name }" /></a>
    </li>
  </c:forEach>
  </ul>
  </div>
  
  <script>
    $("ul.nav li.nav-item a").on("click", function(e){
      e.preventDefault();
      let url = "/product/prodList/" + $(this).attr("href") + "/" + $(this).html();
        location.href = url;
    });
  
    
    // 1차 카테고리 출력
    // $("ul.nav li.nav-item a") : 1차 카테고리 선택자
    $("ul.nav li.nav-item a").on("mouseover", function(e){ // mouseover 마우스를 갖다대면 동작
  
      // console.log("1차 카테고리 선택");
  
      // 클라이언트가 선택한 1차 카테고리 위치를 미리 변수에 저장해놓아야 한다
      let selectedCategory = $(this);
      let category_cd = $(this).attr("href"); // 1차 카테고리 코드 값을 저장하는 변수
      let url = "/product/subCategory/" + category_cd;
  
      $.getJSON(url, function(subCategory) {
        
        let subCategoryStr = '<ul class="nav justify-content-center" id="subCategory">';
        for(let i=0; i<subCategory.length; i++){
          subCategoryStr += '<li class="nav-item">';
          subCategoryStr += '<a class="nav-link" href="' + subCategory[i].category_cd + '">' + subCategory[i].category_name + '</a>';
          subCategoryStr += '</li>';
        }
        subCategoryStr += '</ul>'
  
        // console.log(subCategoryStr);
  
        // 누적되는 태그 초기화 작업
        selectedCategory.parent().parent().next().remove();
  
        // a태그 -> li 태그 -> ul 태그 -> 그 아래
        selectedCategory.parent().parent().after(subCategoryStr);
  
  
      });
  
      // 2차 카테고리 선택
      // 동적으로 생성된 태그는 선택자 작업이 불가능하기 때문에 아래 방식으로 사용
      // on("click", "2차 카테고리 선택자", function()
      $("div#categoryMenu").on("click", "ul#subCategory li.nav-item a", function(e){
        e.preventDefault();
  
        // console.log("2차 카테고리 선택");
        let url = "/product/prodList/" + $(this).attr("href") + "/" + $(this).html(); // a태그에 2차카테고리 코드가 들어있다
        location.href = url;
  
      });
  
    }); 

</script>