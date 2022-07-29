<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유연재:: 연재 작품</title>
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
    <a class="navbar-brand fw-bold" href="#">자유연재</a>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link text-dark" href="/freeSeries/recentBook">연재 작품</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/freeSeries/finishedBook">완결된 작품</a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">

</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {

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
actionForm.prop("action","/freeSeries/recentBook");
})


});
</script>
</body>
</html>