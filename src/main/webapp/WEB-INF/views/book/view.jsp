<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뷰어::${book.book_title}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/common.css">
<style>
#offcanvasComment {
width:700px;
}

.autosize {
resize:none;
}

.comment-list {
border-top:1px solid;
border-color: #ddd;
}

.comment-list-item {
padding:16px 0;
border-bottom: 1px solid;
border-color: #ddd;
}

.nested-comment {
padding-left: 64px;
}

.like-btn:hover {
outline:1px solid #red;
}
</style>
</head>
<body>
<header class="has-subNav bg-white fixed-top">
<nav id="viewerTop" class="navbar navbar-expand navbar-light" style="padding:0.2rem">
  <div class="container container-subNav">
        <div class="nav-item">
          <a class="view-link" href="/book/list?book_idx=${chapter.book_idx}">
          	<i class="bi bi-chevron-left fs-4"></i>
          </a>
        </div>
        <div class="nav-item">
          <div class="d-flex">
             <a id="prevBtn" class="view-link" href="/book/view?book_idx=${chapter.book_idx}&chapter_idx=<c:out value='${chapter.prev}'/>" style="padding:0.7rem 1rem">
               <i class="bi bi-caret-left-fill"></i>
             </a>
             <div class="text-center">
               <div>
                 <span class="fw-bold" style="font-size:18px">${chapter.book_title}</span>
               </div>
               <div>
                 <span style="font-size:0.9rem">${chapter.chapter_title}</span>
               </div>
             </div>
             <a id="nextBtn" class="view-link" href="/book/view?book_idx=${chapter.book_idx}&chapter_idx=<c:out value='${chapter.next}'/>" style="padding:0.7rem 1rem">
             	<i class="bi bi-caret-right-fill"></i>
             </a>
          </div>

        </div>
        <div class="nav-item">
          <a class="view-link" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
          	<i class="fa-solid fa-bars fa-lg"></i>
          </a>
        </div>
    </div>
</nav>
</header>
<main>
<div class="container mt-4" style="padding-top:50px; padding-bottom:50px; max-width:1000px">
	<div class="list-group list-group-flush">
			<div class="viewerMenu"></div>
			<div class="list-group-item" style="margin:1rem 2rem">
				<div class="mb-4">
				<b>${chapter.chapter_title}</b>
				</div>
				<div>${chapter.chapter_content}</div>
			</div> 									  
	</div>	
</div>
</main>
<footer class="has-Nav bg-white fixed-bottom">
	<nav id="viewerBtm" class="navbar navbar-light">
		<div class="container justify-content-start">
			<button id="rating" class="btn" data-bs-toggle="modal" data-bs-target="#bookRating">
				<i class="far fa-star fa-lg"></i> 별점
			</button>
			<button id="comment" class="btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasComment">
				<i class="far fa-comment fa-lg"></i> 댓글
			</button>
		</div>
	</nav>
</footer>
<!-- 별점 등록 -->
<div class="modal fade" id="bookRating" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="bookCommentLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookCommentLabel">별점 주기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    	<div class="text-center">
    	평점 ${chapter.chapter_rating}/10점 (154명 참여)
    	</div>
    	<div class="d-flex justify-content-center align-items-center">
    	<span class="star">
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    	<span class="star-fill" style="width:${rating.chapter_rate*10}%">	
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    	</span>
     	<c:if test="${rating == null}">
    	<input id="rate" type="range" value="1" step="1" min="0" max="10" name="chapter_rate">
    	</c:if>
    	<c:if test="${rating != null}">
    	<input id="rate" type="range" value="${rating.chapter_rate}" step="1" min="0" max="10" name="chapter_rate">
    	</c:if>  		
    	</span>   	
    	</div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button id="rateBtn" type="button" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 댓글 목록 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasComment" aria-labelledby="offcanvasCommentLabel">
  <div class="offcanvas-header">
    <h5 id="offcanvasRightLabel">댓글 목록</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div class="container" style="max-width:700px">
    	<div class="comment-form" style="padding:16px 0;">
    		<textarea class="form-control mention autosize mb-2" placeholder="내용을 입력하세요" style="overflow: hidden; overflow-wrap: break-word; height: 80px;"></textarea>
    		<div class="d-flex justify-content-end">
    			<button class="btn btn-outline-secondary comment-btn">댓글 등록</button>
    		</div>
    	</div>
    	<div class="comments">
    		<div class="comment-list-header d-flex justify-content-between">
    			<div class="">
    				<div class="pt-1 pb-1">총 0개의 댓글</div>
    			</div>
    			<div class="sort">
    				<button class="btn text-secondary me-2" type="button">공감순</button>
    				<button class="btn text-secondary" type="button">최신순</button>
    			</div>
    		</div>
    		<div class="comment-list">
    		</div>	
    	</div>
  	</div>
  </div>
</div>
<!-- 회차 목록 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <div id="offcanvasRightLabel">
    	<h5>${chapter.book_title}</h5>
    	<span>총 ${book.book_chapters}화</span>
    </div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div class="list-group list-group-flush">
    <c:set value="${list}" var="len" />
    <c:forEach items="${list}" var="list" varStatus="status">
    	<div class="list-group-item list-group-item-action position-relative ${list.chapter_idx == chapter.chapter_idx ? "now-read":"" }">
    		<a class="stretched link text-dark" href="/book/view?book_idx=${chapter.book_idx}&chapter_idx=<c:out value='${list.chapter_idx}'/>">
    		<c:out value="${fn:length(len) - status.index}화"/>
    		${list.chapter_title}
    		</a>
		</div>
	</c:forEach>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/common.js"></script>
<script>
let book_idx = '<c:out value="${chapter.book_idx}"/>';
let chapter_idx = '<c:out value="${chapter.chapter_idx}"/>';
let member_idx = "";
let mem_nickName = "";
<sec:authorize access="isAuthenticated()">	
member_idx = '<sec:authentication property="principal.member.member_idx"/>';
mem_nickName = '<sec:authentication property="principal.member.mem_nickName"/>';
</sec:authorize>

//뷰어 네비게이션 바 숨기기 나타내기
$(document).ready(function () {
	
	$(".viewerMenu").on("click", function(){
		let stateTop = $("#viewerTop").css("display");
		let stateBtm = $("#viewerBottom").css("display");
		
		if(stateTop != "none" && stateBtm != "none"){
			$("#viewerTop").css("display","none");
			$("#viewerBtm").css("display", "none");
		} else {				
			$("#viewerTop").css("display", "flex");
			$("#viewerBtm").css("display", "flex");
		}

	})
})	

//별점 드래그
$(document).ready(function () {
	$("#rate").change(function (e){
		const drawStar = 
		    $('.star-fill').css("width", $("#rate").val() * 10+"%");	
		})
	}) 

//별점 등록
$("#rateBtn").on("click", function(){
	let rate = $("#rate").val();
	let book_idx = '<c:out value="${chapter.book_idx}"/>';
	let chapter_idx = '<c:out value="${chapter.chapter_idx}"/>';
	
	if(user != ""){
		let formData = new FormData();
		
		formData.set("book_idx", book_idx);
		formData.set("chapter_idx", chapter_idx);
		formData.set("chapter_rate", rate);
		
		$.ajax('/book/view/rating', {
			method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function () {
            	alert('별점을 성공적으로 등록하였습니다.');
            },
            error: function () {
            	alert('별점등록에 실패하였습니다.');
            },
		});
	} else {
		alert("별점은 로그인 후 줄 수 있습니다.");
	}

})

//이전글 다음글 마지막글일 때 링크 제거	
$(document).ready(function () {
		let prev = '<c:out value="${chapter.prev}" />'
		let next = '<c:out value="${chapter.next}" />'
		
		if(prev == 0){
			$("#prevBtn").removeAttr("href");
		}
		
		if(next == 0){
			$("#nextBtn").removeAttr("href");
		}
	})
//
</script>
<script>
//댓글
let commentService = (function(){
	
	//댓글 추가
	function add(comment, callback, error){

		$.ajax({
			type: 'POST',
			url: '/book/view/comment/create',
	        data: JSON.stringify(comment),
	        processData: false,
	        contentType: "application/json; charset = utf-8",
	        success: function (result, status, xhr) {
	            	
	            if(callback){
	            	callback(result);
	            }
	        },
	        error: function (result, status, xhr) {
	            	
	            if(error){
	            	error(er);
	            }
	            	
	        }
		})
	}
	
	//대댓글 추가
	function addNested(comment, callback, error) {
		
		$.ajax({
			type: 'POST',
			url: '/book/view/comment/create',
	        data: JSON.stringify(comment),
	        processData: false,
	        contentType: "application/json; charset = utf-8",
	        success: function (result, status, xhr) {
	            	
	            if(callback){
	            	callback(result);
	            }
	        },
	        error: function (result, status, xhr) {
	            	
	            if(error){
	            	error(er);
	            }
	            	
	        }
		})
	}
	
	//댓글 리스트
	function getList(param, callback, error){
		let book_idx = param.book_idx;
		let chapter_idx = param.chapter_idx;
		let page = param.page || 1;
		console.log("댓글목록");
		$.getJSON("/book/view/comment/pages/"+book_idx+"/"+chapter_idx+"/"+page,
				function(data){
					if(callback){
						callback(data);
					}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}

	//댓글 추천
	function like(comment, callback, error) {
		$.ajax({
			type: 'POST',
			url: '/book/view/comment/'+bc_idx,
	        data: JSON.stringify(comment),
	        processData: false,
	        contentType: "application/json; charset = utf-8",
	        success: function (result, status, xhr) {
	            	
	            if(callback){
	            	callback(result);
	            }
	        },
	        error: function (result, status, xhr) {
	            	
	            if(error){
	            	error(er);
	            }
	            	
	        }
	    })
	}
	
	
	//모댓글 삭제
	function remove(bc_idx, callback, error) {
		$.ajax({
			type:'delete',
			url:'/book/view/comment/'+bc_idx,
			success: function(deleteResult, status, xhr) {
				if(callback){
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//대댓글 삭제
	function removeNested(bc_idx, callback, error) {
		
	}
	
	function displayTime(timeValue){
		let today = new Date();
		let gap = today.getTime() - timeValue;
		let dateObj = new Date(timeValue); console.log(today.getTime());
		let str = "";
		
		
		if(gap < (1000 * 60 * 60 * 24)){
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
		
		} else {
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth()+1;
			let dd = dateObj.getDate();
			
			return [yy, '.', (mm > 9 ? '' : '0') + mm, '.', (dd > 9 ? '' : '0') + dd ].join('');
			
		}
	}
	
	return {add : add, addNested: addNested, getList : getList, like:like, remove: remove, removeNested, removeNested, displayTime : displayTime};
})();
$(document).ready(function(){
//댓글 등록
let commentList = $(".comment-list");

let bc_idx = $("bc-id").data();

//댓글 목록 불러오기
function showList(page){
	commentService.getList({book_idx:book_idx, chapter_idx:chapter_idx, page:page||1}, function(list){
		let str="";
		
		if(list == null || list.length == 0){
			commentList.html("");
			
			return;
		}
		
		for(let i = 0, len = list.length||0; i<len; i++){
					
			if(list[i].bc_parent == "0"){
			
			str += '<div class="comment-list-item d-flex" data-id="'+list[i].bc_idx+'">';

			str += '  <div class="comment-avatar me-2" style="width:64px;height:64px;">';
			
			//프사 유무에 따라서
			if(list[i].mem_imgThumbUrl != "" && list[i].mem_imgThumbUrl != undefined && list[i].mem_imgThumbUrl != null){
				str += '  <img class="img-fluid rounded-circle" src="../../img/izuku_deku_midoriya_deku_midoriya_midoriya_deku_midoriya_izuku_izuku_midoriya_bnha_chibi_neko_icon_182848.png">yespic';
			} else {
				str += '  <img class="img-fluid rounded-circle" src="../../img/avatar_people_boy_man_asian_icon_159133.png">nopic';
			}
			str += '  </div>';
			str += '<div class="comment-article" style="flex:1;">';
			str += '  <div class="comment-header d-flex justify-content-between mb-2">';
			str += '	  <div>'+list[i].mem_nickName+'</div>';
			str += '	  <div>'+commentService.displayTime(list[i].bc_regDate)+'</div>';
			str += '  </div>';
			str += '  <div class="comment-content mb-1">';
			str += '	<p>'+list[i].bc_comment+'</p>';
			str += '  </div>';
			
			str += '  <div class="comment-response d-flex justify-content-end">';
			str += '	<button class="btn btn-sm text-secondary me-2 nested-reply-btn" type="button">';
			str += '		<i class="fa-regular fa-comment fa-lg me-2"></i>';
			str += list[i].bc_nestedCount;
			str += '	</button>';
			str += '	<button class="btn btn-sm text-secondary like-btn" type="button">';
			str += '		<i class="fa-regular fa-heart fa-lg me-1"></i>';
			str += '		<i class="fa-solid fa-heart fa-lg d-none me-1"></i>';
			str += list[i].bc_likes;
			str += '	</button>';
			
			if(list[i].member_idx == member_idx){
				str += '	<div class="dropdown">';
				str += '       <button class="btn btn-sm dropdown-toggle text-secondary" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">';
				str += '        	<i class="fa-solid fa-ellipsis-vertical"></i>';
				str += '       </button>';
				str += '        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">';
				str += '            <li><a class="dropdown-item" href="#">댓글 수정</a></li>';
				str += '            <li><a class="dropdown-item" href="#">댓글 삭제</a></li>';
				str += '        </ul>';
				str += '    </div>';
			}

			str += '</div>';

			//대댓글 시작
			} else {
				for( let j = 0, len = list.length||0; j<len; j++) {
					if(list[i].bc_idx == list[j].bc_parent) {
				str += '<div class="comment-list-item d-flex d-none nested-comment">';
				str += '	<div class="comment-avatar me-2">';
				str += '		<img class="rounded-circle" src="https://via.placeholder.com/48">';
				str += ' 	</div>';
				str += '	<div class="comment-article" style="flex:1;">';
				str += '		<div class="comment-header d-flex justify-content-between mb-2">';
				str += '			<div>'+list[i].mem_nickName+'</div>';
				str += '			<div>'+commentService.displayTime(list[i].bc_regDate)+'</div>';
				str += '		</div>';
				str += '		<div class="comment-content mb-1">';
				str += '			<p>'+list[i].bc_comment+'</p>';
				str += '		</div>';
				str += '		<div class="comment-response d-flex justify-content-end">';
				str += '			<button class="btn btn-sm text-secondary me-1 nested-reply-btn" type="button">';
				str += '				<i class="fa-regular fa-comment fa-lg me-2"></i>';
				str += '			</button>';
				str += '			<button class="btn btn-sm text-secondary like-btn" type="button">';
				str += '				<i class="fa-regular fa-heart fa-lg me-1"></i>';
				str += '				<i class="fa-solid fa-heart fa-lg me-1 d-none"></i>';
				str += 			list[i].bc_likes;
				str += '			</button>';
				
				
 				if(list[i].member_idx == member_idx){
					str += '		<div class="dropdown">';
					str += '       		<button class="btn btn-sm dropdown-toggle text-secondary" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">';
					str += '        		<i class="fa-solid fa-ellipsis-vertical"></i>';
					str += '       		</button>';
					str += '        	<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">';
					str += '            	<li><a class="dropdown-item" href="#">댓글 수정</a></li>';
					str += '            	<li><a class="dropdown-item" href="#">댓글 삭제</a></li>';
					str += '        	</ul>';
					str += '    	</div>';
					} 

				str += '		</div>';

				str += '	</div>';

				str += '	</div>';
				}
				}
			}
			str += ' </div>';

			str += '</div>';
		}

		commentList.html(str);
		
		//좋아요 버튼
		$(".like-btn").on("click", function(){
			let none = $(this).find(".fa-solid fa-heart fa-lg");
			let done = $(this).find(".fa-regular fa-heart fa-lg");
			//로그인되었는지 확인조건

			if(!none.hasClass("d-none")){
				none.addClass("d-none");
				done.removeClass("d-none");
				
				commentService.like({
					bc_idx:bc_idx, member_idx:member_idx, book_idx:book_idx, chapter_idx:chapter_idx
				},
				function(result){
					console.log(result);
				});
				alert("like!");

			} else {
				done.addClass("d-none");
				none.removeClass("d-none");
				alert("unlike!");
			}
		})

		//대댓글 보기
		$(".nested-reply-btn").on("click", function(){
			let nested = $(".nested-comment");
			
			if(nested.hasClass("d-none")){
				nested.removeClass("d-none");
			} else {
				nested.addClass("d-none");
			}
		})
	});
}

//댓글 달기
showList(1);
$(".comment-btn").on("click", function(){
	
	if(member_idx != ""){
		let bc_comment = $(".mention").val();
		commentService.add(
			{bc_comment:bc_comment, member_idx: member_idx, mem_nickName:mem_nickName, book_idx:book_idx, chapter_idx:chapter_idx}
			,
			function(result){
				console.log(result);
			});

	} else {
		
		alert("로그인 후 이용해주세요.");
		return false;
	}
	showList(1);
})

})
</script>
</body>
</html>