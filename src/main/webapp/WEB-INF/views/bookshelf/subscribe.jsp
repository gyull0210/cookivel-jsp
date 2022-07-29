<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 서재::선호작</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page="../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container">
    <a class="navbar-brand fw-bold" href="/bookshelf/subscribe">내 서재</a>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link text-dark" href="#">선호작</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/bookshelf/recent">최근 본 작품</a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item"></div>
				<c:forEach items="${list}" var="list">			    									    				
  				<div class="list-group-item d-flex justify-content-between align-items-start pt-2">
						<div class="d-flex ms-2 me-auto">
								<div class="cover d-flex me-4" style="width:120px; height:150px;">															
									<c:set var="bookCoverPath" value="/book_cover?book_imgName=${fn:replace(list.book_imgUrl, '\\\\', '/')}/${list.book_imgName}" />
									<c:if test="${list.book_imgUrl == null}">
										<img class="mx-auto d-block img-fluid rounded position-relative" src="https://via.placeholder.com/120X150">																					
									</c:if>
									<c:if test="${list.book_imgUrl != null}">																
										<img class="mx-auto d-block img-fluid rounded position-relative" src="${bookCoverPath}">
									</c:if>					
								</div>
								<div class="detail flex-column">
									<div class="book-header">
									<a class="text-dark" href="/book/list?book_idx=${list.book_idx}">
										<span class="fs-5 fw-bold">${list.book_title}</span>
									</a>
										<span>${list.book_writer}</span>									
									</div>
									<div class="mb-2" style="font-size:0.9rem">${list.book_genre} | ${list.book_writeType == 'free' ? '자유연재' : (list.book_writeType == 'premium' ? '작가연재':'') } | 총 ${list.book_chapters}화</div>
									<div class="text-truncate">${list.book_intro}</div>									
									<small>최근 업데이트: 
									  	<fmt:parseDate value="${list.book_recentDate}" var="parsedDateTime" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
										<fmt:formatDate value="${parsedDateTime}" pattern="yy. MM. dd."/>
									</small>																										
								</div>
						</div>
						<div class="d-flex bookmark" data-bookmark="${list.book_idx}">
							<i class="d-none fa-solid fa-bookmark bookmark-none fa-2x"></i>
							<i class="fa-solid fa-bookmark bookmark-active fa-2x"></i>
   						</div>  					
  				</div>
  				</c:forEach>
  				<c:if test="${empty list}">
  				<div class="list-group-item d-flex justify-content-between align-items-start pt-2">
						구독 중인 작품이 없습니다.  					
  				</div>
  				</c:if>
  				<div class="list-group-item pt-4">
  						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item previous">
									<a class="page-link" href="${pageMaker.startPage-1}" tabindex="-1" aria-disabled="true">
										<i class="fa-solid fa-chevron-left"></i>
									</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}" end = "${pageMaker.endPage}">
								<li class="page-item ${pageMaker.scri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="page-item next">
									<a class="page-link" href="${pageMaker.endPage +1 }">
										<i class="fa-solid fa-chevron-right"></i>
									</a>
								</li>
							</c:if>
							</ul>
							<form id="actionForm" action="/bookshelf/subscribe" method="get">
								<input type="hidden" name="pageNum" value="${pageMaker.scri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.scri.amount}">
							</form>
						</nav>	
  				</div>
	</div>	
</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../js/common.js"></script>
<script>
$(function () {

	var actionForm = $("#actionForm");
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});	
});

$(".bookmark").on("click", function(e){

	let none = $(this).find(".bookmark-none");
	let done = $(this).find(".bookmark-active");
	let user = "";
	<sec:authorize access="isAuthenticated()">	
	user = '<sec:authentication property="principal.member.member_idx"/>';
	</sec:authorize>
	let book_idx = $(this).data("bookmark");
	
	if(user != null){
		let formData = new FormData();
		
		if(!none.hasClass("d-none")){
			none.addClass("d-none");
			done.removeClass("d-none");
			
			formData.set("book_idx", book_idx);
			
			$.ajax('/bookshelf/subscribe', {
				method: 'POST',
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function () {
	            	alert('구독하였습니다.');
	    			none.addClass("d-none");
	    			done.removeClass("d-none");
	            },
	            error: function () {
	            	alert('구독에 실패하였습니다.');
	            },
			});
		} else if(none.hasClass("d-none")){
			
			formData.set("book_idx", book_idx);
			
			$.ajax('/bookshelf/subscribe', {
				method: 'POST',
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function () {
	            	alert('구독을 취소하였습니다.');
	    			none.removeClass("d-none");
	    			done.addClass("d-none");
	    			location.href="/bookshelf/subscribe";
	            },
	            error: function () {
	            	alert('구독취소가 실패하였습니다.');
	            },
			});	
		} 		
	} else {
		alert("로그인 후 구독할 수 있습니다.");
		location.href="/login";
	}

})

/* let commonAjax = function(url, data, msg){
	
	let request = $.ajax({
		url:url;
		data:data;
		dataType:json,
		msg:msg;
	})
} */
</script>
</body>
</html>