<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품관리</title>
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
    <div class="navbar-brand fw-bold">작품관리</div>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item">
					<div class="d-flex justify-content-end mb-4">
			 			<button class="btn btn-outline-primary" onclick="location.href='/storyRoom/storyCreate'">신규작품 등록</button>
				</div>			
			</div>
			<c:forEach items="${list}" var="story">			    									  
  				<div class="list-group-item d-flex row justify-content-between align-items-start pt-2">
						<div class="d-flex col-md-8 ms-2 me-auto">
								<div class="d-flex me-4" style="width:120px; height:180px">
									<a style="width:100%; height:auto;">																
										<c:set var="bookCoverPath" value="/book_cover?book_imgName=${fn:replace(story.book_imgUrl, '\\\\', '/')}/${story.book_imgName}" />
										<c:if test="${story.book_imgUrl == null}">
										<div>
											<img class="mx-auto d-block position-relative img-fluid rounded" src="../img/cookivel-cover-thumbnail200X300.png">
										</div>																					
										</c:if>
										<c:if test="${story.book_imgUrl != null}">
										<div>																
											<img class="mx-auto d-block position-relative img-fluid rounded" src="${bookCoverPath}">
										</div>
										</c:if>
									</a>					
								</div>
								<div class="detail flex-column position-relative">
									<div class="book-header">
										<a class="move stretched-link fs-5 fw-bold" href="${story.book_idx}">
											${story.book_title}
										</a>
										<span>${story.book_writer}</span>
									</div>
									<div class="fs-sm14 mb-2">${story.book_genre} | ${story.book_writeType == 'free' ? '자유연재' : (story.book_writeType == 'premium' ? '작가연재':'')} | 총 ${story.book_chapters}화</div>
									<div class="text-truncate book-intro">${story.book_intro}</div>
									<small>최근 업데이트: <fmt:parseDate value="${story.book_recentDate}" var="parsedDateTime" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
									<fmt:formatDate value="${parsedDateTime}" pattern="yy. MM. dd."/></small>																								
								</div>
						</div>
						<div class="d-md-flex col-md-2 btn-group-vertical btn-group-padding">
   						    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/storyRoom/storyModify?book_idx=${story.book_idx}'"><i class="fas fa-cog fa-lg"></i>작품수정</button>
						    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/storyRoom/chapter/chapterWrite?book_idx=${story.book_idx}'"><i class="fas fa-pencil-alt fa-lg"></i>회차쓰기</button>
							<button type="button" class="btn btn-outline-secondary" onclick="location.href='/storyRoom/chapter/list?book_idx=${story.book_idx}'"><i class="fas fa-list-ul fa-lg"></i>회차관리</button>
  							<button type="button" class="btn btn-outline-secondary" data-id="${story.book_idx}" data-bs-toggle="modal" data-bs-target="#Modal"><i class="far fa-trash-alt fa-lg"></i>작품삭제</button>
   						</div> 					
  				</div>
			</c:forEach>
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
							<form id="actionForm" action="/storyRoom/storyList" method="get">
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
<!-- Modal -->
<div class="modal fade" id="Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLabel">작품 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        삭제하시겠습니까?
      </div>
      <div class="modal-footer">
      <form action="/storyRoom/storyRemove" method="post">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
        <input type="hidden" id="book_idx" name="book_idx" value="">
        <button id="storyRemove" type="submit" class="btn btn-primary">예</button>
      </form>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/common.js"></script>
<script>
$(function () {

	$('#Modal').on('show.bs.modal', function (event) {
		  let id = $(event.relatedTarget).data('id'); 
		  console.log(id);
		  $(this).find('.modal-footer input').val(id);

	})

	var actionForm = $("#actionForm");
	$(".page-item a").on("click",function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".move").on("click",function(e) {
		e.preventDefault();

		$("#book_idx").remove();
		
		actionForm.append("<input type='hidden' id='book_idx' name='book_idx' value='"+ $(this).attr("href")+ "'>");	
		actionForm.attr("action","/book/list");
		$("input[name='pageNum']").val($(this).attr("href")).remove();
		$("input[name='amount']").val($(this).attr("href")).remove();
		actionForm.submit();
		$("#book_idx").remove();
		actionForm.prop("action","/storyRoom/storyList");
	})
})
</script>
</body>
</html>