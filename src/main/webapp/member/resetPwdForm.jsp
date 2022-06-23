<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 | 양도어때</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css">
<style type="text/css">
#resetPWContent{
	width: 350px; height: 400px;
	margin: 0 auto; 
}
.title {
	text-align: center;
	margin: 100px 0 10px 0;
}
#resetPWTable {
	border-collapse : collapse;
	border-spacing : 0;
	width: 350px;
}
.msg_label {
	font-size: 13px;
	font-family: 'Nanum Gothic';	
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script>	
	$(function(){
		$("input[name='id']").blur(function(){
			if(!$("input[name='id']").val()) {
				$("#id_msg_label").html("아이디를 입력해주세요.");
			}
			else {
				$("#id_msg_label").html("");
			}
		});
		$("input[name='pwd_old']").blur(function(){
			if(!$("input[name='pwd_old']").val()) {
				$("#pwd_msg_label").html("비밀번호를 입력해주세요.");
			}
			else {
				$("#pwd_msg_label").html("");
			}
		});
		
		$("input[name='pwd_new']").blur(function(){
			if(!$("input[name='pwd_new']").val()) {
				$("#new_pwd_msg_label").html("새 비밀번호를 입력해주세요.");
			}
			else {
				$("#new_pwd_msg_label").html("");
			}
		});
		
		$("input[name='pwd_new_chk']").blur(function(){
			if(!$("input[name='pwd_new_chk']").val()) {
				$("#new_pwd_re_msg_label").html("새 비밀번호를 한번 더 입력해주세요.");
			}
			else if($("input[name='pwd_new']").val() != $("input[name='pwd_new_chk']").val()){
				$("#new_pwd_re_msg_label").html("비밀번호가 일치하지 않습니다.");
			}
			else {
				$("#new_pwd_re_msg_label").html("");
			}
		});
		
		$("#resetPWForm").submit(function(){
			// 아이디 입력검사
			if(!$("input[name='id']").val()) {
				$("#id_msg_label").html("아이디를 입력해주세요.");
				$("input[name='id']").focus();
				
				return false;
			}
			// 현재 비밀번호 입력검사
			if(!$("input[name='pwd_old']").val()) {
				$("#pwd_msg_label").html("현재 비밀번호를 입력해주세요.");
				$("input[name='pwd_old']").focus();
				
				return false;
			}
			// 새 비밀번호 입력검사
			if(!$("input[name='pwd_new']").val()) {
				$("#new_pwd_msg_label").html("새 비밀번호를 입력해주세요.");
				$("input[name='pwd_new']").focus();
				
				return false;
			}
			// 새 비밀번호 확인 입력검사
			if(!$("input[name='pwd_new_chk']").val()) {
				$("#new_pwd_re_msg_label").html("새 비밀번호를 한번 더 입력해주세요.");
				$("input[name='pwd_new_chk']").focus();
				
				return false;
			}
			// 비밀번호 일치여부 검사
			if($("input[name='pwd_new']").val() != $("input[name='pwd_new_chk']").val()){
				$("#new_pwd_re_msg_label").html("비밀번호가 일치하지 않습니다.");
				
				return false;
			}
			
			var id = $("input[name='id']").val();
			var pwd = $("input[name='pwd_old']").val();
			
			$.ajax({
				url: "pwCheck.do",
				type: "post",
				data: {"id": id, "pwd": pwd},
				success: function(data){
					if (data == "fail") {
						$("#pwd_msg_label").html("비밀번호가 맞지 않습니다.");
						$("input[name='pwd_old']").focus();
						return false;
					}
				},
				error: function(xhr, textStatus, errorThrown){
					$("#result").html("[ERROR] "+xhr.status);
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="resetPWContent">
		<div class="title">
			<h1>
				<a href="../main/index.do">
					<img src="../resources/img/logo_red.png" width="120px">
				</a>
			</h1>
		</div>
		<form action="resetPwd.do" id="resetPWForm" id="resetPWForm" name="resetPWForm" method="post">
			<table id="resetPWTable">
				<tr>
					<td>
						<input type="text" name="id" class="memButton1" placeholder="아이디">
						<label id="id_msg_label" class="msg_label" style="color: red;"></label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="pwd_old" class="memButton1" placeholder="현재 비밀번호">
						<label id="pwd_msg_label" class="msg_label" style="color: red;"></label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="pwd_new" class="memButton1" placeholder="새 비밀번호">
						<label id="new_pwd_msg_label" class="msg_label" style="color: red;"></label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="pwd_new_chk" class="memButton1" placeholder="새 비밀번호 확인">
						<label id="new_pwd_re_msg_label" class="msg_label" style="color: red;"></label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="비밀번호 변경" class="memButton3">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>