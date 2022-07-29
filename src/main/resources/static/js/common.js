/** */


$.ajaxSetup({
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader("AJAX", true);
	     },
	     error: function(xhr, status, err) {
	        if (xhr.status == 401) {
				$("#alertModal .modal-body div").text("인증에 실패했습니다. 로그인페이지로 이동합니다.");
	            $("#alertModal").modal("show");
	            location.href = "/login";
	         } else if (xhr.status == 403) {
	            $("#alertModal .modal-body div").text("다시 로그인해주세요. 로그인페이지로 이동합니다.");
	            $("#alertModal").modal("show");
	            location.href = "/login";
	         }
	     }
	});
