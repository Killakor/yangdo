<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 양도어때</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css">
<style type="text/css">
#loginContent{
	width: 350px; height: 550px;
	margin: 0 auto; 
}
.title {
	text-align: center;
	margin: 100px 0 10px 0;
}
#naver_id_login {
	width: 300px;
}
#loginTable {
	border-collapse : collapse;
	border-spacing : 0;
}
.last_td:after {
	display: inline-block;
    content: '';
    position: absolute;
    top: 348px;
    left: 50%;
    width: 1px;
    height: 16px;
    background: rgba(0,0,0,0.08);
}
</style>
<script type="text/javascript">
function checkLogin() {
	if(!loginForm.id.value) {
		alert("아이디를 입력하세요");
		loginForm.id.focus();
	} else if(!loginForm.pwd.value) {
		alert("비밀번호를 입력하세요");
		loginForm.pwd.focus();
	} else {
		loginForm.submit();
	}
}
function openPwReset() {
	var popupX = (document.body.offsetWidth / 2) - (600 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height / 2) - (600 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open("resetPwdForm.do", '_blank', 'width=600, height=600, left='+ popupX + ', top='+ popupY);
	return false;
}
</script>
</head>
<body>
	<div id="loginContent">
		<div class="title">
			<h1>
				<a href="../main/index.do">
					<img src="../resources/img/logo_red.svg" width="120px">
				</a>
			</h1>
		</div>
		<form action="login.do" id="loginForm" name="loginForm" method="post">
			<table id="loginTable">
				<tr>
					<td colspan="2">
						<input type="text" name="id" class="memButton1" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="password" name="pwd" class="memButton1" placeholder="비밀번호">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="로그인" class="memButton3" onclick="checkLogin()">
					</td>
				</tr>
				<tr>
					<td align="center" width="175" class="last_td">
						<a href="#" onclick="openPwReset()">비밀번호 재설정</a>
					</td>
					<td align="center" width="175"><a href="joinForm.do">회원가입</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>