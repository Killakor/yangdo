$(function(){
	// 제출시 유효성 검사 : Write Form
	$("#qnaWriteForm").submit(function(){
		// 문의 유형
		if($("select[name='qna_type']").val() == "none") {
			$("#type_msg_label").html("문의 유형을 선택해주세요.");
			$("select[name='qna_type']").focus();
					
			return false;
		}
		// 카테고리
		if($("select[name='qna_category']").val() == "none") {
			$("#category_msg_label").html("카테고리를 선택해주세요.");
			$("select[name='qna_category']").focus();
					
			return false;
		}
		// 제목
		if(!$("input[name='qna_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
			$("input[name='qna_subject']").focus();
					
			return false;
		}
		// 내용 검사
		if(!$("textarea[name='qna_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
			$("textarea[name='qna_content']").focus();
			
			return false;
		}
	})
	// 제출시 유효성 검사 : Modify Form
	$("#qnaModifyForm").submit(function(){
		// 문의 유형
		if($("select[name='qna_type']").val() == "none") {
			$("#type_msg_label").html("문의 유형을 선택해주세요.");
			$("select[name='qna_type']").focus();
					
			return false;
		}
		// 카테고리
		if($("select[name='qna_category']").val() == "none") {
			$("#category_msg_label").html("카테고리를 선택해주세요.");
			$("select[name='qna_category']").focus();
					
			return false;
		}
		// 제목
		if(!$("input[name='qna_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
			$("input[name='qna_subject']").focus();
					
			return false;
		}
		// 내용 검사
		if(!$("textarea[name='qna_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
			$("textarea[name='qna_content']").focus();
			
			return false;
		}
	})
	// 제출시 유효성 검사 : Reply Form
	$("#qnaReplyForm").submit(function(){
		// 내용 검사
		if(!$("textarea[name='qna_reply']").val()) {
			$("#reply_msg_label").html("내용을 입력해주세요.");
			$("textarea[name='qna_reply']").focus();
			
			return false;
		}
	})
	// 태그를 벗어났을때 유효성 검사
	// 문의 유형
	$("select[name='qna_type']").blur(function(){
		if($("select[name='qna_type']").val() == "none") {
			$("#type_msg_label").html("문의 유형을 선택해주세요.");
		} else {
			$("#type_msg_label").html("");
		}
	});
	
	// 카테고리
	$("select[name='qna_category']").blur(function(){
		if($("select[name='qna_category']").val() == "none") {
			$("#category_msg_label").html("카테고리를 선택해주세요.");
		} else {
			$("#category_msg_label").html("");
		}
	});
	
	// 제목
	$("input[name='qna_subject']").blur(function(){
		if(!$("input[name='qna_subject']").val()) {
			$("#subject_msg_label").html("제목을 입력해주세요.");
		} else {
			$("#subject_msg_label").html("");
		}
	});
	
	// 내용
	$("textarea[name='qna_content']").blur(function(){
		if(!$("textarea[name='qna_content']").val()) {
			$("#cont_msg_label").html("내용을 입력해주세요.");
		} else {
			$("#cont_msg_label").html("");
		}
	});
	
	// 답글 내용
	$("textarea[name='qna_reply']").blur(function(){
		if(!$("textarea[name='qna_reply']").val()) {
			$("#reply_msg_label").html("내용을 입력해주세요.");
		} else {
			$("#reply_msg_label").html("");
		}
	});
		
});