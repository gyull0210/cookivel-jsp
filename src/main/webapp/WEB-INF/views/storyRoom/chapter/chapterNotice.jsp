<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회차관리-공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page="../../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container">
    <a class="navbar-brand" href="/storyRoom/storyList">
    	<i class="bi bi-chevron-left fs-4"></i>
    </a>	
    <div class="navbar-brand fw-bold">회차관리</div>
      <ul class="navbar-nav me-auto">
        <li class="nav-item me-2">
          <a class="nav-link" href="/storyRoom/chapter/list?book_idx=${book.book_idx}">회차목록</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link text-dark" href="/storyRoom/chapter/chapterNotice?book_idx=${book.book_idx}">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">통계</a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item">
				<div class="d-flex ms-2 me-auto">
								<div class="cover d-flex me-4">
									<a style="width:100%; height:auto;">																
										<c:set var="bookCoverPath" value="/book_cover?book_imgName=${fn:replace(book.book_imgUrl, '\\\\', '/')}/${book.book_imgName}" />
										<c:if test="${book.book_imgUrl == null}">
										<div class="rounded">
											<img class="mx-auto d-block position-relative" src="http://www.placehold.it/120X180">
										</div>																					
										</c:if>
										<c:if test="${book.book_imgUrl != null}">
										<div class="rounded" style="width:120px;height:180px">																
											<img class="mx-auto d-block img-fluid position-relative" src="${bookCoverPath}">
										</div>
										</c:if>
									</a>					
								</div>
								<div class="detail flex-column">
									<div class="book-header">
										<span class="fs-2 fw-bold">${book.book_title}</span>
										<span>${book.book_writer}</span>
									</div>
									<div class="mb-2">${book.book_genre} | ${book.book_writeType} | 총 ${book.book_chapters}화</div>
									<div class="text-truncate book-intro">${book.book_intro}</div>
									<small>최근 업데이트: <fmt:parseDate value="${book.book_recentDate}" var="parsedDateTime" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
									<fmt:formatDate value="${parsedDateTime}" pattern="yy. MM. dd."/></small>																								
								</div>
						</div>		
			</div>
			<c:forEach items="${list}" var="chapter" varStatus="status">
            <div class="list-group-item list-group-item-action d-flex justify-content-between">
                    	<div>
                    		<div>
                    			<c:if test="${chapter.chapter_category == '공지'}">
                    			<span class="badge bg-secondary">공지</span>
                    			</c:if>
                    			${chapter.chapter_title}
                    		</div>
                    		<div>
                    			<span>2022. 02. 22</span>
                    		</div>
                    	</div>
                    	<div class="dropdown">
                            <a class="btn dropdown-toggle chapter-button" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-chevron-right fa-lg"></i>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li>
                                	<button id="modify" class="dropdown-item" href="/storyRoom/chapter/chapterModify?book_idx=${book.book_idx}&chapter_idx=${chapter.chapter_idx}">공지 수정</button>
                                </li>
                                <li>
                                	<button id="remove" class="dropdown-item" href="/storyRoom/chapter/chapterRemove?book_idx=${book.book_idx}&chapter_idx=${chapter.chapter_idx}">공지 삭제</button>
                                </li>
                            </ul>                   		
                    	</div>
            </div>
            </c:forEach>
                    <c:if test="${empty list}">
					<div class="list-group-item">
						<div class="text-center" style="color:gray">
  						<i class="fas fa-exclamation-circle fa-lg"></i><span> 아직 공지사항이 존재하지 않습니다.</span>
  						</div>
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
								<li class="page-item ${pageMaker.sccri.pageNum == num ? "active":"" }">
									<a class="page-link" href="${num}">${num}</a>
								</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="page-item next">
								<a class="page-link" href="${pageMaker.endPage +1 }">
									<i class="fa-solid fa-chevron-right"></i>
								</a>
							</li>
						</c:if>
						</ul>
						<form id="actionForm" action="/storyRoom/chapter/chapterNotice" method="get">
							<input type="hidden" name="book_idx" value="${book.book_idx}">
							<input type="hidden" name="pageNum" value="${pageMaker.sccri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.sccri.amount}">
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
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});	
});
</script>
<script>
$(function () {
	
	let bookIdx = '<c:out value="${book.book_idx}"/>';
	let chapterIdx = '<c:out value="${chapter.chapter_idx}"/>';
		
$("#modify").on("click", function(e){
	e.preventDefault();
	
	let formData = new FormData();
	let chapterIdx = '<c:out value="${chapter.chapter_idx}"/>';
	formData.append("book_idx", bookIdx);
	formData.append("chapter_idx", chapterIdx);
	
	$.ajax('/storyRoom/chapter/chapterModify', {
   		method: 'GET',
        data: formData,
        processData: false,
        contentType: false,
        success: function () {
        	location.href="/storyRoom/chapter/chapterModify?book_idx=<c:out value='${book.book_idx}'/>&chapter_idx=<c:out value='${chapter.chapter_idx}'/>";
        },
        error: function () {
        	alert('수정페이지 이동 실패');
        }
	});
	
})

$("#remove").on("click", function(e){
	e.preventDefault();
	
	let formData = new FormData();
	let chapterIdx = '<c:out value="${chapter.chapter_idx}"/>';
	formData.append("book_idx", bookIdx);
	formData.append("chapter_idx", chapterIdx);
	
	$.ajax('/storyRoom/chapter/chapterRemove', {
   		method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function () {
        	location.href="/storyRoom/chapter/chapterRemove?book_idx=<c:out value='${book.book_idx}'/>&chapter_idx=<c:out value='${chapter.chapter_idx}'/>";
        },
        error: function () {
        	alert('삭제 실패');
        }
	});
	
})

});
</script>
</body>
</html>