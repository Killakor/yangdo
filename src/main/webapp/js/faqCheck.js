	$(function(){
		// 제출시 유효성 검사 : Write Form
		$("#faqWriteForm").submit(function(){
			// 카테고리
			if($("select[name='faq_category']").val() == "none") {
				$("#category_msg_label").html("카테고리를 선택해주세요.");
				$("select[name='faq_category']").focus();
						
				return false;
			}
			// 제목
			if(!$("input[name='faq_subject']").val()) {
				$("#subject_msg_label").html("제목을 입력해주세요.");
				$("input[name='faq_subject']").focus();
						
				return false;
			}
			// 내용 검사
			if(!$("textarea[name='faq_content']").val()) {
				$("#cont_msg_label").html("내용을 입력해주세요.");
				$("textarea[name='faq_content']").focus();
				
				return false;
			}
		})
		
		// 제출시 유효성 검사 : Modify Form
		$("#faqModifyForm").submit(function(){
			// 제목
			if(!$("input[name='faq_subject']").val()) {
				$("#subject_msg_label").html("제목을 입력해주세요.");
				$("input[name='faq_subject']").focus();
						
				return false;
			}
			// 내용 검사
			if(!$("textarea[name='faq_content']").val()) {
				$("#cont_msg_label").html("내용을 입력해주세요.");
				$("textarea[name='faq_content']").focus();
				
				return false;
			}
		})
		
		// 태그를 벗어났을때 유효성 검사
		// 카테고리
		$("select[name='faq_category']").blur(function(){
			if($("select[name='faq_category']").val() == "none") {
				$("#category_msg_label").html("카테고리를 선택해주세요.");
			} else {
				$("#category_msg_label").html("");
			}
		});
		
		// 제목
		$("input[name='faq_subject']").blur(function(){
			if(!$("input[name='faq_subject']").val()) {
				$("#subject_msg_label").html("제목을 입력해주세요.");
			} else {
				$("#subject_msg_label").html("");
			}
		});
		
		// 내용
		$("textarea[name='faq_content']").blur(function(){
			if(!$("textarea[name='faq_content']").val()) {
				$("#cont_msg_label").html("내용을 입력해주세요.");
			} else {
				$("#cont_msg_label").html("");
			}
		});
	});