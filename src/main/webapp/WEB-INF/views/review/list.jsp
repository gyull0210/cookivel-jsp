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
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page="../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container container-subNav">
    <a class="navbar-brand fw-bold" href="#">리뷰게시판</a>
      <ul class="navbar-nav subNav-center me-auto">
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item" style="margin-left:28px;">
          <a class="nav-link" href="#"></a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item">
			<div class="table-responsive">
				<table id="review" class="table table-hover" style="white-space:nowrap;">
					<thead class="bg-light text-center">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>추천수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr>
							<td><i class="fa-solid fa-microphone-lines"></i></td>
							<td>공지사항</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
						<tr>
							<td>21</td>
							<td>제목입니다 내용은 없음</td>
							<td>익명의작성자</td>
							<td>444</td>
							<td>32</td>
							<td>2022. 02. 21</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="pt-4">
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
				</div>
				<div class="d-flex justify-content-between">
					<button class="btn btn-secondary">목록</button>
					<button class="btn btn-primary">글쓰기</button>
				</div>
			</div>	
	</div>
</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
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
<script>
$(document).ready(function() {
    $('#review').DataTable();
});
</script>
</body>
</html>