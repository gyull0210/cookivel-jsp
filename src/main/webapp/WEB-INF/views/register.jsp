<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link href="../css/common.css" rel="stylesheet">
<style>
.row {
	margin-top:50px;
}

.register-title {
	margin-top:1.5rem;
}

.modal-dialog {
	max-width:1024px;
}
.is_ok1{color:#6A82FB; display: none;}
.is_already1{color:red; display: none;}

.is_ok2{color:#6A82FB; display: none;}
.is_not2{color:red; display: none;}

.is_ok3{color:#6A82FB; display: none;}
.is_already3{color:red; display: none;}

.is_ok4{color:#6A82FB; display: none;}
.is_already4{color:red; display: none;}
.is_false4{color:red; display: none;}
</style>
</head>
<body>
<nav class="navbar navbar-light d-lg-flex">
  <div class="container navbar-expand">   
    <a class="navbar-brand me-2" href="/">
    <img class="logo mb-1" src="${pageContext.request.contextPath}/img/cookivel.png">
    </a>
    <div class="justify-content-end gap-2">
    	<button class="btn btn-primary" type="button" onclick="location.href='/login'">로그인</button>
    </div>
  </div>
</nav>
<div class="container">
	<div class="container dialog p-5 card shadow" style="max-width:500px;">
		<div class="text-center">
		<h4 class="mb-4">회원가입</h4>
		</div>
		<form method="post" onsubmit="return registerChk()">
		<input type="hidden" id="emailState" value="N">
		<input type="hidden" id="nickState" value="N">
		<input type="hidden" id="phoneState" value="N">
		<input type="hidden" id="agreeServiceState" value="N">
		<input type="hidden" id="agreePolicyState" value="N">
			<div class="mb-4">
			<label for="mem_email">이메일</label>
			<input id="mem_email" name="mem_email" class="form-control" type="text" placeholder="이메일을 입력하세요" oninput = "checkEmail()">
			<p class="is_already1">사용 중인 이메일입니다.</p>
			<p class="is_ok1">사용 가능한 이메일입니다.</p>
			</div>
			<div class="mb-4">
			<label for="mem_pw">비밀번호</label>
			<input id="mem_pw" name="mem_pw" maxlength="50" class="form-control" type="password" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="mb-4">
			<label for="re_pw">비밀번호 확인</label>
			<input id="re_pw" name="re_pw" maxlength="50" class="form-control" type="password" placeholder="다시 한번 비밀번호를 입력하세요" oninput = "checkPw()">
			<p class="is_not2">비밀번호가 일치하지 않습니다.</p>
			<p class="is_ok2">비밀번호가 일치합니다.</p>
			</div>
			<div class="mb-4">
			<label for="mem_nickName">닉네임</label>
			<input id="mem_nickName" name="mem_nickName" maxlength="10" class="form-control" type="text" placeholder="사용할 닉네임을 입력하세요"  oninput = "checkNick()">
			<p class="is_already3">사용 중인 닉네임입니다.</p>
			<p class="is_ok3">사용 가능한 닉네임입니다.</p>
			</div>
			<div class="mb-4">
			<label for="mem_phoneNum">핸드폰 번호</label>
			<input id="mem_phoneNum" name="mem_phoneNum" maxlength="11" class="form-control" type="text" placeholder="하이픈(-)기호를 생략하고 입력하세요"  oninput = "checkPhone()">
			<p class="is_already4">사용 중인 핸드폰 번호입니다.</p>
			<p class="is_ok4">사용 가능한 핸드폰 번호입니다.</p>
			<p class="is_false4">핸드폰 번호를 형식에 맞게 입력해주세요.</p>
			</div>
			<div class="input-group">
			<label id="agreeServiceLabel" class="form-check-label" for="agreeTermsofService">
			<input id="agreeServiceCheck" type="checkbox" class="form-check-input" onclick="serviceChk()"></label>
			<p> 서비스 약관에 동의합니다.</p>
			<a href="#" data-bs-toggle="modal" data-bs-target="#TermsofService">내용 보기</a>
			</div>
			<div class="input-group">
			<label class="form-check-label" for="agreePrivacyPolicyTerms">
			<input id="agreePolicyCheck" type="checkbox" class="form-check-input" onclick="PolicyChk()"></label>
			<p> 개인정보 수집 및 이용에 동의합니다.</p>
			<a href="#" data-bs-toggle="modal" data-bs-target="#PrivacyPolicyTerms">내용 보기</a>
			</div>
			<div class="d-grid gap-2">
			<button type="submit" class="btn btn-primary">회원가입</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="termsofService.jsp" />
<jsp:include page="privacyPolicyTerms.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//1. ajax도 형식에 맞는지부터 체크하고 메세지를 보여주자
function checkEmail(){
    var mem_email = $('#mem_email').val();
$.ajax({
    url:'/emailCheck',
    type:'post',
    data:{mem_email:mem_email},
    success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
        if(cnt != 1 && mem_email != ""){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
            $('.is_ok1').css("display","inline-block"); 
            $('.is_already1').css("display", "none");
            $("#emailState").val("Y");
        } else if( cnt == 1){ // cnt가 1일 경우 -> 이미 존재하는 아이디
            $('.is_already1').css("display","inline-block");
            $('.is_ok1').css("display", "none");
            $("#emailState").val("N");
        } else {
        	$('.is_already1').css("display", "none");
        	$('.is_ok1').css("display", "none");
        	$("#emailState").val("N");
        }
    },
    error:function(){
        console.log("에러입니다");
    }
});
}; 

function checkPw(){
	var mem_pw = $('#mem_pw').val();
	var re_pw = $('#re_pw').val();

	if(mem_pw === re_pw && mem_pw !=="" && re_pw !=="") {
		$('.is_ok2').css("display","inline-block"); 
        $('.is_not2').css("display", "none");
        
		} else if(mem_pw !== re_pw && mem_pw !=="" && re_pw !==""){
			$('.is_not2').css("display","inline-block");
            $('.is_ok2').css("display", "none");
		} else {
			$('.is_not2').css("display", "none");
			$('.is_ok2').css("display", "none");
		}
	}

function checkNick(){
    var mem_nickName = $('#mem_nickName').val();
$.ajax({
    url:'/nickCheck',
    type:'post',
    data:{mem_nickName:mem_nickName},
    success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
        if(cnt != 1 && mem_nickName != ""){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
            $('.is_ok3').css("display","inline-block"); 
            $('.is_already3').css("display", "none");
            $("#nickState").val("Y");
        } else if(cnt == 1 && mem_nickName != ""){ // cnt가 1일 경우 -> 이미 존재하는 아이디
            $('.is_already3').css("display","inline-block");
            $('.is_ok3').css("display", "none");
            $("#nickState").val("N");
        } else {
        	$('.is_already3').css("display", "none");
        	$('.is_ok3').css("display", "none");
        	$("#nickState").val("N");
        }
    },
    error:function(){
    	console.log("에러입니다");
    }
});
}; 

 function checkPhone(){
    var mem_phoneNum = $('#mem_phoneNum').val();
    var phone_validation = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
$.ajax({
    url:'/phoneCheck',
    type:'post',
    data:{mem_phoneNum:mem_phoneNum},
    success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
    	if(cnt != 1){
    		console.log(phone_validation.test(mem_phoneNum));
    		if(phone_validation.test(mem_phoneNum)){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
    			$('.is_ok4').css("display","inline-block"); 
                $('.is_already4').css("display", "none");
                $('.is_false4').css("display", "none");
                $("#phoneState").val("Y");  
                
    		} else if(mem_phoneNum == "") {
            	$('.is_ok4').css("display", "none");
            	$('.is_already4').css("display", "none");
                $('.is_false4').css("display", "none");
                $("#phoneState").val("N");
                
            } else if(!(phone_validation.test(mem_phoneNum))){
    			$('.is_false4').css("display","inline-block");
    			$('.is_already4').css("display", "none");
    			$('.is_ok4').css("display", "none");
    			$("#phoneState").val("X");
    		}
            	
        } else if(cnt == 1){ // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.is_already4').css("display","inline-block");
                $('.is_ok4').css("display", "none");
                $('.is_false4').css("display", "none");
                $("#phoneState").val("N");                
        }   		
    },
    	error:function(){
    		console.log("에러입니다");
    }
});
};
</script>
<script>
 function serviceChk(){
 	if($("#agreeServiceCheck").is(":checked") != true){
	  $("#agreeServiceState").val("N");
 	} else if($("#agreeServiceCheck").prop("checked", true)){
 		alert("약관을 확인하고 동의를 눌러주세요");
 		$("#agreeServiceCheck").prop("checked", false);
 	}
 }
 
 function PolicyChk(){
	 	if($("#agreePolicyCheck").is(":checked") != true){
		  $("#agreePolicyState").val("N"); 
	 	} else if($("#agreePolicyCheck").prop("checked", true)){
	 		alert("약관을 확인하고 동의를 눌러주세요");
	 		$("#agreePolicyCheck").prop("checked", false);
	 	}
 }
  
 function agreeChk(){	 
	 
	 $("#agreeServiceCheck").prop("checked",true);
	 $("#agreeServiceState").val("Y");
		 console.log("동의하였습니다.");
	 };

 
 function agreeChk2(){	 
		 
	$("#agreePolicyCheck").prop("checked",true);
	$("#agreePolicyState").val("Y");
		console.log("동의하였습니다.");
	};
</script>
<script>
function registerChk(){
	let mem_email = $("#mem_email").val();
	let mem_pw = $("#mem_pw").val();
	let re_pw = $("#re_pw").val();
	let mem_nickName = $("#mem_nickName").val();
	let mem_phoneNum = $("#mem_phoneNum").val();
	let email_validation = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let phone_validation = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

	if(mem_email == ""){
		alert("이메일을 입력해주세요");
		return false;
		
	} else if(!(email_validation.test(mem_email))){
		alert("이메일을 형식에 맞게 입력해주세요");
		return false;
		
	} else if($("#emailState").val() == "N"){
		alert("사용 중인 이메일입니다.");
		return false;
		
	} else if(mem_pw == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	
	} else if(re_pw == ""){
		alert("비밀번호를 한번 더 입력해주세요");
		return false;
		
	} else if(!(mem_pw.length >= 10 && mem_pw.length <= 50)){
		alert("비밀번호는 최소 10글자 이상 50글자 이하로 입력해주세요.");
		return false;
		
	} else if(!(re_pw.length >= 10 && re_pw.length <= 50)){
		alert("비밀번호는 최소 10글자 이상 50글자 이하로 입력해주세요.");
		return false;
		
	} else if(mem_nickName == "") {
		alert("닉네임을 입력해주세요.");
		return false;
	
	} else if(!(mem_nickName.length >= 2 && mem_nickName.length <= 10)){
		alert("닉네임은 최소 2글자 이상 10글자 이하로 입력해주세요.");
		return false;
		
	} else if($("#nickState").val() == "N"){
		alert("사용 중인 닉네임입니다.");
		return false;
		
	} else if(mem_phoneNum == ""){
		alert("핸드폰 번호를 입력해주세요");
		return false;
	
	} else if(!(phone_validation.test(mem_phoneNum))){
		alert("핸드폰 번호를 형식에 맞게 입력해주세요.");
		return false;
			
    } else if($("#phoneState").val() == "N"){
		alert("사용 중인 핸드폰 번호입니다.");
		return false;

	} else if(($('#agreeServiceState').val() == "N") || ($('agreePolicyState').val() == "N")){
		alert("약관에 동의해야 서비스를 이용할 수 있습니다.");
		return false;
	}
	
} 
</script>
</body>
</html>