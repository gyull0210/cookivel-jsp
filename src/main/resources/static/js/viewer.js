/**
 * 
 */
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