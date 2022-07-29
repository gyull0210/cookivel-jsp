<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회차관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page="../../nav.inc.jsp"/>
<nav class="navbar navbar-expand navbar-light">
  <div class="container">
      <a class="navbar-brand fw-bold" href="#">회차수정</a>
      <div class="navbar-nav">
        <div class="nav-item">
          <button class="btn nav-link" type="button" onclick="history.go(-1)">취소</button>
        </div>
        <div class="nav-item" style="margin-left:28px;">
          <button id="publish" class="btn nav-link" type="submit">발행</button>
        </div>
      </div>
    </div>
</nav>
</header>
<main>
	<div class="container">
		<div>
			<input type="hidden" name="book_title" value="${book_title}">
			<input type="hidden" name="chapter_title" value="${chapter.chapter_title}">
			<input type="hidden" name="chapter_content" value="${chapter.chapter_content}">
			<div class="card-body" style="margin-bottom:10px;">
				<div class="row mb-3">
  					<label for="title" class="col-form-label col-sm-2 pt-0">작품 이름</label>
    					<div class="col-sm-10">
      						<h5 id="title">${book_title}</h5>
    					</div>
  				</div>
				<div class="row mb-3">
  					<label for="category" class="col-form-label col-sm-2 pt-0">카테고리</label>
    					<div class="col-sm-10">
      						<select id="category" class="form-select" name="chapter_category">
								<option value="공지" <c:if test="${chapter.chapter_category eq '공지'}">selected</c:if>>공지사항</option>
								<option value="연재" <c:if test="${chapter.chapter_category eq '연재'}">selected</c:if>>연재</option>
							</select>
    					</div>
  				</div>
  				<div class="row mb-3">
  					<label for="isHidden" class="col-form-label col-sm-2 pt-0">공개여부</label>
    					<div class="col-sm-10">
      						<div class="form-check">
        						<input class="form-check-input" type="checkbox" id="isHidden" name="chapter_isHidden" value="N" <c:if test="${chapter.chapter_isHidden eq 'Y'}">checked</c:if>>
        						<label class="form-check-label" for="isHidden">
          							비밀글
        						</label>
      					</div>
    				</div>
  				</div>
			</div>
			<div class="card-body">
				<h3 id="chapterTitle" contenteditable="true" maxlength="30" placeholder="제목을 입력하세요">${chapter.chapter_title}</h3>
				<div id="editor">
				<c:out value='${chapter.chapter_content}' escapeXml="false"/>
				</div>
				<p style="color: #aaa;" id="counter">공백포함 0 / 최대 25000자</p>
				<p style="color: #aaa;" id="counter-blank">공백미포함 0 / 최대 25000자</p>
			</div>
		</div>
	</div>
</main>
<footer>
</footer>
<!-- Modal -->
<div class="modal fade" id="alertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="text-center fs-5"></div>
      </div>
      <div class="modal-footer">
        <button type="button" data-bs-dismiss="modal" class="btn fs-5">확인</button>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/balloon/ckeditor.js"></script>
<script>
//ck에디터 balloon style로 추가
let editor;
BalloonEditor
.create( document.querySelector( '#editor' ),{
	language:'ko',
	removePlugins: [ 'outdent', 'indent'],
	toolbar: [ 'bold', 'italic','BlockQuote', 'undo', 'redo' ],
	placeholder: '내용을 입력하세요'
})
.then( editor => {
	const content = editor;
	$('.ck-content').keyup(
		function(e) {
			$("input[name='chapter_content']" ).val(content.getData());
	})
})
.catch( error => {
    console.error( error );
});

//제목 복붙 시 글자수 초과 막기
$("#chapterTitle[contenteditable='true'][maxlength]").on('keyup paste',function(event) {
	let cntMaxLength = parseInt($(this).attr('maxlength'));

	if ($(this).text().length >= cntMaxLength
		&& event.keyCode != 8 && event.keyCode != 37
		&& event.keyCode != 38 && event.keyCode != 39
		&& event.keyCode != 40) {

		event.preventDefault();

		$(this).html(function(i, currentHtml) {
			return currentHtml.substring(0, cntMaxLength - 1);
		});
	}
});

//에디터 입력한 글자수 세기 공백포함 공백미포함
$('.ck-content').keyup(
	function(e) {
		let content = $(this).text();
		let redex = /\s/ig;
		let extrablank = $(this).text().replace(redex, "");

		$('#counter').html(
			"공백포함 " + content.length + " / 최대 25000자");
		$('#counter-blank').html(
			"공백미포함 " + extrablank.length + " / 최대 25000자");

		if (content.length > 25000) {
			$(this).text(content.substring(0, 25000));
			$('#counter').html("공백포함 25000 / 25000 자");

			if (extrablank.length > 25000) {
				$(this).text(extrablank.substring(0, 25000));
				$('#counter-blank').html("공백미포함 25000 / 25000 자");
					alert("최대 25000자까지 입력 가능합니다.");
			}
		}
});	

//제목 input에 담기
$('#chapterTitle').keyup(
	function(e) {
		let title = $(this).text();
			$("input[name=chapter_title]").val(title);
});

//복붙 시 태그 없이 텍스트만 붙여넣기
document.querySelector('#chapterTitle').addEventListener('paste', function(event) {
	event.preventDefault();

	let pastedData = event.clipboardData ||  window.clipboardData;
	let textData = pastedData.getData('Text');
	window.document.execCommand('insertHTML', false,  textData);
})

document.querySelector('#editor').addEventListener('paste', function(event) {
	event.preventDefault();

	let pastedData = event.clipboardData ||  window.clipboardData;
	let textData = pastedData.getData('Text');
	window.document.execCommand('insertHTML', false,  textData);
})

//비공개여부 체크 값 변경
$('#isHidden').on("click", function(){
	if($('#isHidden').is(':checked') == true){
    	$('#isHidden').val("Y");
    } else if($('#isHidden').is(':checked') != true){
    	$('#isHidden').val("N");
    }
	
})

//회차 등록 ajax
$("#publish").on("click", function(){   	
	let formData = new FormData();		
	
	let bookIdx = '<c:out value="${book_idx}"/>';
	let bookTitle = '<c:out value="${book_title}"/>';
	let chapterIdx = '<c:out value="${chapter.chapter_idx}"/>';
	let chapterTitle = $("input[name='chapter_title']").val();
	let chapterCategory = $("#category option:selected").val();
	let chapterIsHidden = $("input[name='chapter_isHidden']").val();
	let chapterContent = $("input[name='chapter_content']").val();
	
	if(chapterTitle == ""){
		$("#alertModal .modal-body div").text("제목을 입력해주세요");
		$("#alertModal").modal("show");
		return false;
	} else if(chapterTitle.length > 30){
		$("#alertModal .modal-body div").text("제목은 30자 이하로 입력해주세요.");
		$("#alertModal").modal("show");
		return false;
	} else if(chapterCategory == ""){
		$("#alertModal .modal-body div").text("카테고리를 선택해주세요.");
		$("#alertModal").modal("show");
		return false;
	} else if(chapterCategory != "공지" && chapterCategory != "연재"){
		$("#alertModal .modal-body div").text("공지사항과 연재 중에 카테고리를 선택해주세요.");
		$("#alertModal").modal("show");
		return false;
	} else if(chapterContent == ""){
		$("#alertModal .modal-body div").text("내용을 입력해주세요.");
		$("#alertModal").modal("show");
		return false;
	} else if(chapterContent.length > 25000){
		$("#alertModal .modal-body div").text("내용은 25000자를 초과하여 작성할 수 없습니다.");
		$("#alertModal").modal("show");
		return false;
	} else { 
		
	formData.append("book_idx", bookIdx);
	formData.append("book_title", bookTitle);
	formData.append("chapter_idx", chapterIdx);
	formData.append("chapter_title", chapterTitle);
	formData.append("chapter_category", chapterCategory);
	formData.append("chapter_isHidden", chapterIsHidden);
	formData.append("chapter_content", chapterContent);

		$.ajax('/storyRoom/chapter/chapterModify', {
			
   		method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function () {
        	alert('회차가 수정되었습니다.');
        	location.href="/storyRoom/chapter/list?book_idx=<c:out value='${book_idx}'/>";
        },
        error: function () {
        	alert('회차 등록에 실패하였습니다.');
        },
	});
	}

});
</script>
</body>
</html>