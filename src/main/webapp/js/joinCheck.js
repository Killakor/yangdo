$(function(){
	//alert("test");
	var idCheck = false;
	var nicknameCheck = false;
	
	// submit 버튼 클릭 시 입력 검사
	$("#joinForm").submit(function(){
		// 아이디 입력검사
		if(!$("input[name='id']").val()) {
			$("#id_msg_label").html("아이디를 입력해주세요.");
			$("input[name='id']").focus();
			
			return false;
		}
		// 아이디 중복검사
		if(!idCheck) {
			$("#id_msg_label").html("아이디 중복검사를 해주세요.");
			$("input[name='id']").focus();
			
			return false;
		}
		// 비밀번호 입력검사
		if(!$("input[name='pwd']").val()) {
			$("#pwd_msg_label").html("비밀번호를 입력해주세요.");
			$("input[name='pwd']").focus();
			
			return false;
		}
		// 비밀번호 확인 입력검사
		if(!$("input[name='pwd_chk']").val()) {
			$("#pwd_re_msg_label").html("비밀번호를 한번 더 입력해주세요.");
			$("input[name='pwd_chk']").focus();
			
			return false;
		}
		// 비밀번호 일치여부 검사
		if($("input[name='pwd']").val() != $("input[name='pwd_chk']").val()){
			$("#pwd_re_msg_label").html("비밀번호가 일치하지 않습니다.");
			
			return false;
		}
		
		// 이름 입력검사
		if(!$("input[name='name']").val()) {
			$("#name_msg_label").html("이름을 입력해주세요.");
			$("input[name='name']").focus();
			
			return false;
		}
		// 닉네임 입력검사
		if(!$("input[name='nickname']").val()) {
			$("#nickname_msg_label").html("닉네임을 입력해주세요.");
			$("input[name='nickname']").focus();
			
			return false;
		}
		// 닉네임 중복검사
		if(!nicknameCheck) {
			$("#nickname_msg_label").html("닉네임 중복검사를 해주세요.");
			$("input[name='nickname']").focus();
			
			return false;
		}
		// 휴대폰 번호 입력검사
		if(!$("input[name='tel']").val()) {
			$("#tel_msg_label").html("휴대폰 번호를 입력해주세요.");
			$("input[name='tel']").focus();
			
			return false;
		}
		// 이메일 주소1 입력검사
		if(!$("input[name='email1']").val()) {
			$("#email_msg_label").html("이메일 주소를 입력해주세요.");
			$("input[name='email1']").focus();
			
			return false;
		}
		// 이메일 주소2 입력검사
		if(!$("input[name='email2']").val()) {
			$("#email_msg_label").html("이메일 주소를 입력해주세요.");
			$("input[name='email2']").focus();
			
			return false;
		}
	});
	
	// 아이디 중복 체크
	$("#check_id").click(function(){
		var input_val = $("input[name='id']").val();
		
		if(!input_val) {
			$("#id_msg_label").html("아이디를 입력해주세요.");
			$("input[name='id']").focus();
		} else {
			$.ajax({
				url: "idCheck.do",
				type: "get",
				data: {"user_id": input_val},
				success: function(data){
					if (data == "exist") {
						$("#id_msg_label").html(input_val + "는 사용할 수 없는 아이디입니다.");
						$("input[name='id']").val("");
						idCheck = false;
					} else {
						alert("해당 아이디는 사용 가능합니다.");
						$("#id_msg_label").html("");
						idCheck = true;
					}
				},
				error: function(xhr, textStatus, errorThrown){
					$("#result").html("[ERROR] "+xhr.status);
				}
			});
		};
	});
	
	// 닉네임 중복 체크
	$("#check_nickname").click(function(){
		var input_val = $("input[name='nickname']").val();
		
		if(!input_val) {
			$("#nickname_msg_label").html("닉네임을 입력해주세요.");
			$("input[name='nickname']").focus();
		} else {
			$.ajax({
				url: "nicknameCheck.do",
				type: "get",
				data: {"user_nickname": input_val},
				success: function(data){
					if (data == "exist") {
						$("#nickname_msg_label").html(input_val + "는 사용할 수 없는 닉네임입니다.");
						$("input[name='nickname']").val("");
						nicknameCheck = false;
					} else {
						alert("해당 닉네임은 사용 가능합니다.");
						$("#nickname_msg_label").html("");
						nicknameCheck = true;
					}
				},
				error: function(xhr, textStatus, errorThrown){
					$("#result").html("[ERROR] "+xhr.status);
				}
			});
		};
	});
	
	// input 태그를 벗어날 때 입력검사
	$("input[name='id']").blur(function(){
		if(!$("input[name='id']").val()) {
			$("#id_msg_label").html("아이디를 입력해주세요.");
		}
		else {
			$("#id_msg_label").html("");
		}
	});
	
	$("input[name='pwd']").blur(function(){
		if(!$("input[name='pwd']").val()) {
			$("#pwd_msg_label").html("비밀번호를 입력해주세요.");
		}
		else {
			$("#pwd_msg_label").html("");
		}
	});
	
	$("input[name='pwd_chk']").blur(function(){
		if(!$("input[name='pwd_chk']").val()) {
			$("#pwd_re_msg_label").html("비밀번호를 한번 더 입력해주세요.");
		}
		else if($("input[name='pwd']").val() != $("input[name='pwd_chk']").val()){
			$("#pwd_re_msg_label").html("비밀번호가 일치하지 않습니다.");
		}
		else {
			$("#pwd_re_msg_label").html("");
		}
	});
	
	$("input[name='name']").blur(function(){
		if(!$("input[name='name']").val()) {
			$("#name_msg_label").html("이름을 입력해주세요.");
		}
		else {
			$("#name_msg_label").html("");
		}
	});
	
	$("input[name='nickname']").blur(function(){
		if(!$("input[name='nickname']").val()) {
			$("#nickname_msg_label").html("닉네임을 입력해주세요.");
		}
		else {
			$("#nickname_msg_label").html("");
		}
	});
	
	$("input[name='tel']").blur(function(){
		if(!$("input[name='tel']").val()) {
			$("#tel_msg_label").html("휴대폰 번호를 입력해주세요.");
		}
		else {
			$("#tel_msg_label").html("");
		}
	});
	
	$("input[name='email1']").blur(function(){
		if(!$("input[name='email1']").val()) {
			$("#email_msg_label").html("이메일 주소를 입력해주세요.");
		}
		else {
			$("#email_msg_label").html("");
		}
	});
	
	$("input[name='email2']").blur(function(){
		if(!$("input[name='email2']").val()) {
			$("#email_msg_label").html("이메일 주소를 입력해주세요.");
		}
		else {
			$("#email_msg_label").html("");
		}
	});
})
	