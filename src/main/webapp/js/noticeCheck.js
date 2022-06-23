$(function(){
	// submit 버튼 클릭 시 입력 검사
	// 공지 작성
	$("#noticeWriteForm").submit(function(){
		// 제목 검사
		if(!$("input[name='notice_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
			$("input[name='notice_subject']").focus();
				
			return false;
		}
		// 내용 검사
		if(!$("textarea[name='notice_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
			$("textarea[name='notice_content']").focus();
			
			return false;
		}
	})
		
	// 공지 수정
	$("#noticeModifyForm").submit(function(){
		// 제목 검사
		if(!$("input[name='notice_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
			$("input[name='notice_subject']").focus();
				
			return false;
		}
		// 내용 검사
		if(!$("textarea[name='notice_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
			$("textarea[name='notice_content']").focus();
			
			return false;
		}
	})
	
	// 태그를 벗어났을때 유효성 검사
// 제목
	$("input[name='notice_subject']").blur(function(){
		if(!$("input[name='notice_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
		} else {
			$("#subject_msg_label").html("");
		}
	});
	
	// 내용
	$("textarea[name='notice_content']").blur(function(){
		if(!$("textarea[name='notice_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
		} else {
			$("#cont_msg_label").html("");
		}
	});

});