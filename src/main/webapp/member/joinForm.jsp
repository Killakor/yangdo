<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css">
<style type="text/css">
#joinContent {
	margin: 0 auto;
	width: 350px;
}
.title {
	text-align: center;
	margin: 50px 0 30px 0;
}
.sub_title2 {
	text-align: center;
	margin-bottom: 10px;
	font-size: 22px;
}
#joinForm div {
	margin: 10px;
}
#joinForm strong{
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
.memButton1, .memButton2, .memButton5, .memButton6 {
	border: 1px solid rgba(0, 0, 0, 0.08);
	font-size: 16px;
}
#joinForm input::placeholder {
	color: #c0c0c0; font-weight: lighter;
	font-size: 16px;
}
.msg_label {
	font-size: 13px;
	font-family: 'Nanum Gothic';	
}
.memButton5 {
	width: 43%;
}
.memButton6 {
	width: 50%;
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/joinCheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		$("#addrBtn").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	$("input[name='post']").val(data.zonecode);
		        	$("input[name='addr1']").val(data.address);
		        }
		    }).open();	
		});
	});
</script>
</head>
<body>
	<div id="joinContent">
		<div class="title">
			<h1>
				<a href="../main/index.do">
					<img src="../resources/img/logo_red.svg" width="120px">
				</a>
			</h1>
		</div>
		<div class="sub_title2">
			<h3>회원가입</h3>
		</div>
		<form action="join.do" id="joinForm" name="joinForm" method="post">
			<div>
				<strong>아이디</strong>
				<input type="text" name="id" class="memButton2" placeholder="아이디를 입력해주세요.">
				<input type="button" value="중복확인" id="check_id" class="memButton4">
				<label id="id_msg_label" class="msg_label" style="color: red;"></label>
			</div>
			<div>
				<strong>비밀번호</strong>
				<input type="password" name="pwd" class="memButton1" placeholder="비밀번호를 입력해주세요.">
				<label id="pwd_msg_label" class="msg_label" style="color: red;"></label>
			</div>
			<div>
				<strong>비밀번호 확인</strong>
				<input type="password" name="pwd_chk" class="memButton1" placeholder="비밀번호를 입력해주세요.">
				<label id="pwd_re_msg_label" class="msg_label" style="color: red;"></label>
			</div>
			<div>
				<strong>이름</strong>
				<input type="text" name="name" class="memButton1" placeholder="이름을 입력해주세요.">
				<label id="name_msg_label" class="msg_label" style="color: red;"></label>
			</div>
			<div>
				<strong>닉네임</strong>
				<input type="text" name="nickname" class="memButton2" placeholder="닉네임을 입력해주세요.">
				<input type="button" value="중복확인" id="check_nickname" class="memButton4">
				<label id="nickname_msg_label" class="msg_label" style="color: red;"></label>
			</div>
			<div>
				<strong>휴대폰 번호</strong>
				<input type="tel" name="tel" class="memButton1" placeholder="휴대폰 번호를 입력해주세요. ('-' 제외)">
				<label id="tel_msg_label" class="msg_label" style="color: red;"></label>
			</div>
			<div>
				<strong>이메일 주소</strong>
				<input type="text" name="email1" class="memButton5" placeholder="이메일 아이디">@
				<input type="text" name="email2" class="memButton6" placeholder="도메인">
				<br><label id="email_msg_label" class="msg_label" style="color: red;"></label>
			</div>
			<div>
				<strong>주소</strong>
				<input type="text" name="post" class="memButton2" placeholder="우편번호" readonly>
				<input type="button" value="주소 검색" id="addrBtn" class="memButton4"><br>
				<input type="text" name="addr1" class="memButton1" placeholder="도로명 주소" readonly>
				<input type="text" name="addr2" class="memButton1" placeholder="상세주소">
			</div>
			<div>
				<input type="submit" value="가입하기" class="memButton3">
			</div>
		</form>
	</div>
</body>
</html>