<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/common.css">
</head>
<body>
<nav class="navbar navbar-light d-lg-flex">
  <div class="container navbar-expand">   
    <a class="navbar-brand me-2" href="/">
    <img class="logo mb-1" src="${pageContext.request.contextPath}/img/cookivel.png">
    </a>
    <div class="justify-content-end gap-2">
    	<button class="btn btn-primary" type="button" onclick="location.href='/register'">회원가입</button>
    </div>
  </div>
</nav>
<div class="container">
  <div class="dialog pt-5" style="max-width:300px; margin-top:30px;">
      <form method="post" action="/login">
      <h2 class="mb-4">로그인</h2>
      	<div class="mb-2">
      		<label class="sr-only">이메일</label>
      		<input id="mem_email" class="form-control" name="mem_email" type="text" placeholder="이메일" autofocus>
      	</div>
        <div class="mb-2">
        	<label class="sr-only">비밀번호</label>
        	<input id="mem_pw" class="form-control" name="mem_pw" type="password" placeholder="비밀번호">
      	</div>
      	<div class="form-check mb-2">
      		<label class="form-check-label" for="remember"></label>
      		<input id="remember" class="form-check-input" type="checkbox" name="remember-me"> 로그인 유지하기
      	</div>
      	<div class="d-flex mb-2">
      		<a class="me-2" href="/member/searchAccount">계정 찾기</a>
      		<a href="/register">회원가입</a>
      	</div>
      	<div class="d-grid mx-auto mb-4">
  			<button id="loginBtn" class="btn btn-primary" type="submit">로그인</button>
		</div>        
      </form>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>
</html>