$(function(){
	$("#eventWriteForm").submit(function(){
		// 제목
		if(!$("input[name='event_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
			$("input[name='event_subject']").focus();
						
			return false;
		}
		// 시작 날짜
		if(!$("input[name='event_start']").val()) {
			$("#period_msg_label").html("시작 날짜를 선택해주세요.");
			$("input[name='event_start']").focus();
						
			return false;
		}
		// 종료 날짜
		if(!$("input[name='event_end']").val()) {
			$("#period_msg_label").html("종료 날짜를 선택해주세요.");
			$("input[name='event_end']").focus();
						
			return false;
		}
		// 내용 검사
		if(!$("textarea[name='event_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
			$("textarea[name='event_content']").focus();
				
			return false;
		}
		// 이미지
		if(!$("input[name='event_image']").val()) {
			$("#img_msg_label").html("이미지를 첨부해주세요.");
			$("input[name='event_image']").focus();
						
			return false;
		}
	})
	
	$("#eventModifyForm").submit(function(){
		// 제목
		if(!$("input[name='event_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
			$("input[name='event_subject']").focus();
						
			return false;
		}
		// 시작 날짜
		if(!$("input[name='event_start']").val()) {
			$("#period_msg_label").html("시작 날짜를 선택해주세요.");
			$("input[name='event_start']").focus();
						
			return false;
		}
		// 종료 날짜
		if(!$("input[name='event_end']").val()) {
			$("#period_msg_label").html("종료 날짜를 선택해주세요.");
			$("input[name='event_end']").focus();
						
			return false;
		}
		// 내용 검사
		if(!$("textarea[name='event_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
			$("textarea[name='event_content']").focus();
				
			return false;
		}
		// 이미지
		if(!$("input[name='event_image']").val()) {
			$("#img_msg_label").html("이미지를 첨부해주세요.");
			$("input[name='event_image']").focus();
						
			return false;
		}
	})
		
	// 태그를 벗어났을때 유효성 검사
	// 제목
	$("input[name='event_subject']").blur(function(){
		if(!$("input[name='event_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
		} else {
			$("#subject_msg_label").html("");
		}
			});
	// 내용
	$("textarea[name='event_content']").blur(function(){
		if(!$("textarea[name='event_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
		} else {
			$("#cont_msg_label").html("");
		}
	});
});