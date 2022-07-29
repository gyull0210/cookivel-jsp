<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page ="nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light nav-setting">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">설정</a>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">계정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">프로필</a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container">
<h2>계정 설정</h2>
</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>