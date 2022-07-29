<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page="../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container container-subNav">
    <a class="navbar-brand fw-bold me-2" href="#">이벤트</a>
      <ul class="navbar-nav me-auto">
        <li class="nav-item me-2">
          <a class="nav-link text-dark" href="#">진행중인 이벤트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">종료된 이벤트</a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div>
				<div class="card d-flex flex-row justify-content-between position-relative mb-2">
					<div class="card-body d-flex">
						<img class="me-2 d-none d-md-flex" src="https://via.placeholder.com/300X60">
						<div class="d-flex flex-column">
						<a class="stretched-link text-dark" href="#">
							<div class="fs-5">이벤트 제목</div>
							<span>00. 00. 00. ~ 00. 00. 00.</span>
						</a>
						</div>
					</div>
					<div class="pe-3 pt-3">
						<span class="badge bg-danger fs-6">진행중</span>
					</div>
				</div>
				<div class="card d-flex flex-row justify-content-between position-relative">
					<div class="card-body d-flex">
						<img class="me-2 d-none d-md-flex" src="https://via.placeholder.com/300X60">
						<div class="d-flex flex-column">
						<a class="stretched-link text-dark" href="#">
							<div class="fs-5">이벤트 제목</div>
							<span>00. 00. 00. ~ 00. 00. 00.</span>
						</a>
						</div>
					</div>
					<div class="pe-3 pt-3">
						<span class="badge bg-secondary fs-6">종료됨</span>
					</div>
				</div>	
				<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center pt-4">
						<c:if test="${pageMaker.prev}">
							<li class="page-item previous">
								<a class="page-link" href="${pageMaker.startPage-1}" tabindex="-1" aria-disabled="true">
									<i class="fa-solid fa-chevron-left"></i>
								</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end = "${pageMaker.endPage}">
								<li class="page-item ${pageMaker.bcri.pageNum == num ? "active":"" }">
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
						<form id="actionForm" action="/book/list?" method="get">
<%-- 							<input type="hidden" name="book_idx" value="${book_idx}">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> --%>
						</form>
				</nav>	
				<div class="d-flex justify-content-between">
					<button class="btn btn-secondary">목록</button>
				</div>
	</div>	
</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../resources/js/common.js"></script>
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
</body>
</html>