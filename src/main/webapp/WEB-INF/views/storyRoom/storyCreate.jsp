<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.css" integrity="sha512-+VDbDxc9zesADd49pfvz7CgsOl2xREI/7gnzcdyA9XjuTxLXrdpuz21VVIqc5HPfZji2CypSbxx1lgD7BgBK5g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/common.css">
<style>
img {
display:block;
width:100%;

}
</style>
</head>
<body>
<header class="has-subNav">
<jsp:include page="../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">작품등록</a>
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
				<div class="row ms-2 me-auto">
					<div class="row justify-content-center">
							<div class="row mb-3">
    							<label for="bookCover" class="col-sm-2 col-form-label">표지</label>
    							<div class="col-sm-10">
      								<div id="bookCoverBox" class="rounded" style="width:150px;height:210px; overflow:hidden;" data-bs-toggle="modal" data-bs-target="#coverUploader">
										<img id="bookCover" class="img-fluid" src="https://via.placeholder.com/150X210">
									</div>
    							</div>
  							</div>
  							<div class="row mb-3">
    							<label for="bookTitle" class="col-sm-2 col-form-label">제목</label>
    							<div class="col-sm-10">
      							<input type="text" class="form-control" id="bookTitle" name="book_title" placeholder="작품 제목은 30자 이하로 입력해주세요.">
    							</div>	
  							</div>
  							<div class="row mb-3">
    							<label for="bookIntro" class="col-sm-2 col-form-label">소개</label>
    							<div class="col-sm-10">
      							<textarea class="form-control" id="bookIntro" name="book_intro"></textarea>
    							</div>
  							</div>
  							<fieldset class="row mb-3">
    						<legend class="col-form-label col-sm-2 pt-0">연재종류</legend>
    						<div class="col-sm-10">
      							<div class="form-check">
        							<input class="form-check-input" type="radio" name="book_writeType" id="bookWriteType1" value="free" checked>
        							<label class="form-check-label" for="gridRadios1">
          							자유연재
        							</label>
      							</div>
      							<div class="form-check">
        							<input class="form-check-input" type="radio" name="book_writeType" id="bookWriteType2" value="premium">
        							<label class="form-check-label" for="gridRadios2">
          							작가연재
        							</label>
      							</div>
    						</div>
  							</fieldset>
  							<div class="row mb-3">
    							<label for="book_genre" class="col-sm-2 col-form-label">장르</label>
    							<div class="col-sm-10">
      							<select class="form-select" id="bookGenre" name="book_genre">
      								<option value="" selected>장르선택</option>
      								<option value="판타지">판타지</option>
      								<option value="현대판타지">현대판타지</option>
      								<option value="무협">무협</option>
      								<option value="로맨스">로맨스</option>
      								<option value="로맨스판타지">로맨스판타지</option>
      								<option value="BL">BL</option>
      								<option value="GL">GL</option>
      							</select>
    							</div>
  							</div>
  							<div class="row mb-3">
    							<label for="bookTag	" class="col-sm-2 col-form-label">태그</label>
    							<div class="col-sm-10">
    							<input id="tags" class="form-control" type="text" placeholder="">
    							</div>
  							</div>
  							<fieldset class="row mb-3">
    						<legend class="col-form-label col-sm-2 pt-0">연재상태</legend>
    						<div class="col-sm-10">
      							<div class="form-check">
        							<input class="form-check-input" type="radio" name="book_state" id="bookState1" value="연재중" checked>
        							<label class="form-check-label" for="bookState1">
          							연재중
        							</label>
      							</div>
      							<div class="form-check">
        							<input class="form-check-input" type="radio" name="book_state" id="bookState2" value="완결됨">
        							<label class="form-check-label" for="bookState2">
          							완결됨
        							</label>
      							</div>
    						</div>
  							</fieldset>
  							<div class="row mb-3">
  								<label for="isHidden" class="col-form-label col-sm-2 pt-0">공개여부</label>
    							<div class="col-sm-10">
      								<div class="form-check">
        								<input class="form-check-input" type="checkbox" id="isHidden" name="book_isHidden" value="N">
        								<label class="form-check-label" for="gridCheck1">
          								비공개
        								</label>
      								</div>
    							</div>
  							</div>
  							<div class="d-flex justify-content-end">
  								<button id="create" type="submit" class="btn btn-primary">등록</button>
  							</div>
					</div>
				</div>
			</div>
	</div>	
</div>
</main>
<footer>
</footer>
<!-- 이미지 업로더 -->
<div class="modal fade" id="coverUploader" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="coverUploaderLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="coverUploaderLabel">표지 업로드</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="preview" style="width:150px; margin-bottom:45px">
      	<img class="image" src="" style="display:block; width:100%">
      </div>
      	<input id="imgBtn" name="original" class="form-control" type="file" accept="image/jpeg, image/jpg, image/png">       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button id="imgNextBtn" type="button" class="btn btn-primary disabled" data-bs-target="#coverCropper" data-bs-toggle="modal">다음</button>
      </div>
    </div>
  </div>
</div>
<!-- 이미지 크롭퍼 -->
<div class="modal fade" id="coverCropper" aria-hidden="true" aria-labelledby="coverCropperLabel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="coverCropperLabel">이미지 편집</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="padding:0">
        <div class="d-flex justify-content-center coverPreview" style="margin-bottom:45px">
        	<img class="cover" src="" style="display: block;max-width: 100%;">
        </div>
		<div class="d-flex justify-content-center">
			<div class="d-flex" style="max-width:300px">
				<i class="bi bi-zoom-out fs-4" data-method="zoom" data-option="0.1"></i>
				<input type="range" class="form-range" id="zoomRange">
				<i class="bi bi-zoom-in fs-4" data-method="zoom" data-option="-0.1"></i>
			</div>
		</div>
      </div>
      <div class="modal-footer justify-content-between"> 
      	<button type="button" class="btn btn-outline-secondary" data-bs-target="#coverUploader" data-bs-toggle="modal">이전</button>       
       	<button id="uploadBtn" type="submit" class="btn btn-primary" data-bs-dismiss="modal" >표지 등록</button>
      </div>
    </div>
  </div>
</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.js" integrity="sha512-ZK6m9vADamSl5fxBPtXw6ho6A4TuX89HUbcfvxa2v2NYNT/7l8yFGJ3JlXyMN4hlNbz0il4k6DvqbIW5CCwqkw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../../js/common.js"></script>
<script>
$(function(){
	let cropper;
	let formData = new FormData();
	
    //비공개여부 체크 값 변경
    $('#isHidden').on("click", function(){
    	if($('#isHidden').is(':checked') == true){
        	$('#isHidden').val("Y");

        } else if($('#isHidden').is(':checked') != true){
        	$('#isHidden').val("N");

        }
    	
    })
    
    // 사진 업로드 버튼
    $('#imgBtn').on('change', function(){
        $('.preview').empty().append('<img class="image" src="">');
        $('.coverPreview').empty().append('<img class="cover" src="">');
        let image = $('.image');
        let cover = $('.cover');
        let fileForm = /(.*?)\.(jpg|jpeg|png|jfif)$/;
        let canvas;
        let imgFile = $('#imgBtn').val();
        let fileValue = imgFile.split("\\");
        let fileName = imgFile.split("\\")[imgFile.split("\\").length-1];

        // 이미지가 확장자 확인 후 노출
        if(imgFile.match(fileForm)) {
            let reader = new FileReader(); 
            reader.onload = function(event) { 
                image.attr("src", event.target.result);
                cover.attr("src", event.target.result);
                cropper = new Cropper(cover[0], {
                    dragMode: 'move',
                    viewMode:1,
                    aspectRatio: 2/3,
                    autoCropArea:1,
                    restore: false,
                    guides: false,
                    center: false,
                    highlight: false,
                    background: false,
                    cropBoxMovable: false,
                    cropBoxResizable: false,
                    toggleDragModeOnDblclick: false,
                    minContainerWidth:500,
                    minContainerHeight:400,
                });
            };
            
            $('#imgNextBtn').removeClass("disabled");
            
            // 업로드 버튼
            $('#uploadBtn').on('click', function(){
            	$('.bookCoverPreview').append('<img id="bookCover" src="">');
            	let image = $('.image')
            	let cover = $('.cover');
            	let result = $('#bookCover');
            	imgFile = $('#imgBtn').val();
            	
            	if($('input[type="file"]').val() != ""){
            	canvas = cropper.getCroppedCanvas({
            		width:200,
            		height:300,
            		imageSmoothingQuality: 'high',
            	});

            	result.attr('src',canvas.toDataURL("image/png"));
            	
        		canvas.toBlob(function (blob) {
            		formData.set('file', blob, $('#imgBtn').val().split('\\')[$('#imgBtn').val().split('\\').length-1].split('.')[0]+".png");   		

        			});

              }else{
                  alert('사진을 업로드 해주세요');
                  return;
              }
            });
            
        	reader.readAsDataURL(event.target.files[0]);
        } else{
        	alert("이미지 파일(jpg, jpeg, png형식의 파일)만 올려주세요");
        	return; 
        }
	});
    
    //작품 등록
    $("#create").on("click", function(){   	

		let bookTitle = $("#bookTitle");
    	let bookIntro = $("#bookIntro");
    	let bookGenre = $("#bookGenre");
    	let bookWriteType = $(':radio[name="book_writeType"]:checked');
    	let bookState = $(':radio[name="book_state"]:checked');
    	let bookIsHidden = $('#isHidden');

		if(bookTitle ==""){
			$("#alertModal .modal-body div").text("제목을 입력해주세요");
			$("#alertModal").modal("show");
    		return false;
    	} else if(bookTitle.val().length < 2 || bookTitle.val().length > 30){
			$("#alertModal .modal-body div").text("제목은 2글자 이상, 30글자 미만으로 입력해주세요.");
			$("#alertModal").modal("show");
    		return false;
    	} else if(bookIntro.val() ==""){
    		$("#alertModal .modal-body div").text("작품 소개를 입력해주세요.");
    		$("#alertModal").modal("show");
    		return false;
    	} else if(bookIntro.val().length > 21844){
        	$("#alertModal .modal-body div").text("작품 소개의 최대 글자수 21844자를 초과하였습니다.");
        	$("#alertModal").modal("show");
        	$(this).text(extrablank.substring(0, 21844));
        	return false;
    	} else if(bookGenre.val() == ""){
    		$("#alertModal .modal-body div").text("장르를 선택해주세요");
    		$("#alertModal").modal("show");
    		return false;
    	} else if(bookWriteType.length < 1){
    		$("#alertModal .modal-body div").text("연재 종류를 선택해주세요");
    		$("#alertModal").modal("show");
    		return false;
    	} else if(bookState.length < 1){
    		$("#alertModal .modal-body div").text("연재 상태를 선택해주세요");
    		$("#alertModal").modal("show");
    		return false;
    	} else {

    		formData.set('book_title', bookTitle.val());
    		formData.set('book_intro', bookIntro.val());
    		formData.set('book_genre', bookGenre.val());
			formData.set('book_writeType', bookWriteType.val());
            formData.set('book_state', bookState.val());
            formData.set('book_isHidden', bookIsHidden.val());

     		$.ajax('/storyRoom/storyCreate', {
           		method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function () {
                	location.href="/storyRoom/storyList";
                },
                error: function () {
                	$("#alertModal .modal-body div").text("작품 등록에 실패했습니다.");
            		$("#alertModal").modal("show");
                	//alert('작품 등록에 실패했습니다.');
                	$('.bookCoverPreview').append('<img id="bookCover" src="">');
                },
    		});
    	}
    })
});
</script>
<script>
var tags = document.querySelector("#tags");
var tagify = new Tagify(tags);

</script>
</body>
</html>