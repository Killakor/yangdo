<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/modifyCheck.js"></script>
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
<style type="text/css">
*{margin: 0; padding: 0;}
#wrap{
	height: 100%;
}
form {width: 350px;}
.sub_title2 {margin-bottom: 10px;}
#modifyForm div {margin: 10px;}
#modifyForm strong {
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
#bottom {
	border-top: 1px solid rgba(0, 0, 0, 0.08);
	margin-top: 50px;
	padding-top: 20px;
}
#bottom span {
	color: rgba(0, 0, 0, 0.56);
}
#bottom a {
	margin-left: 30px;
	text-decoration: underline;
}
#modifyForm input::placeholder {
	color: #c0c0c0; font-weight: lighter;
	font-size: 16px;
}
.msg_label {
	font-size: 13px;
	font-family: 'Nanum Gothic';	
}
.memButton1, .memButton2, .memButton5, .memButton6 {
	font-size: 16px;
	font-family: 'Nanum Gothic';	
}
.memButton5 {
	width: 43%;
}
.memButton6 {
	width: 50%;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>내정보</h3>
			</div>
		</div>
		<div class="container">
			<div id="nav">
				<ul>
					<li><a class="active" href="../member/memberModifyForm.do">내 정보 관리</a></li>
					<li><a href="../yangdo/yangdoList.do?my=1">이용내역</a></li>
					<li><a href="../qna/qnaListAndView.do?my=1">문의사항</a></li>
				</ul>
			</div>
			<div class="sub_title2">
				<h3>내 정보 수정</h3>
			</div>
			<div id="content">
				<form action="modify.do" id="modifyForm" name="modifyForm" method="post">
					<input type="hidden" name="id" value="${dto.id }">
					
					<div>
						<strong>아이디</strong>
						<p>${dto.id}</p>
					</div>
					<div>
						<strong>이름</strong>
						<p>${dto.name}</p>
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
						<strong>닉네임</strong>
						<input type="text" name="nickname" class="memButton2" value="${dto.nickname}" placeholder="닉네임을 입력해주세요.">
						<input type="button" value="중복확인" id="check_nickname" class="memButton4">
						<label id="nickname_msg_label" class="msg_label" style="color: red;"></label>
					</div>
					<div>
						<strong>휴대폰 번호</strong>
						<input type="tel" name="tel" class="memButton1" value="${dto.tel}" placeholder="휴대폰 번호를 입력해주세요. ('-' 제외)">
						<label id="tel_msg_label" class="msg_label" style="color: red;"></label>
					</div>
					<div>
						<strong>이메일 주소</strong>
						<input type="text" name="email1" class="memButton5" value="${dto.email1}" placeholder="이메일 아이디">@
						<input type="text" name="email2" class="memButton6" value="${dto.email2}" placeholder="도메인">
						<label id="email_msg_label" class="msg_label" style="color: red;"></label>
					</div>
					<div>
						<strong>주소</strong>
						<input type="text" name="post" class="memButton2" value="${dto.post}" placeholder="우편번호" readonly>
						<input type="button" value="주소 검색" id="addrBtn" class="memButton4"><br>
						<input type="text" name="addr1" class="memButton1" value="${dto.addr1}" placeholder="도로명 주소" readonly>
						<input type="text" name="addr2" class="memButton1" value="${dto.addr2}" placeholder="상세주소">
					</div>
					<div>
						<input type="submit" value="수정" class="memButton3">
					</div>
				</form>
				<div id="bottom">
					<span>양도어때를 이용하고 싶지 않으신가요?</span>
					<a href="../member/logout.do">로그아웃</a>
					<a href="../member/memberDeleteInfo.do">회원탈퇴</a>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>