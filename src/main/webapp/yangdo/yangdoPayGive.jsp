<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${su_take > 0}) {
			alert("결제 완료 되었습니다.");
			location.href="yangdoPayGive.do?seq=${seq}";
		} else {
			alert("결제가 실패하였습니다.");
			history.back();
		}		
	}
</script>
</head>
<body>
	<input type="hidden" name="seq" value="${dto.seq}">
</body>
</html>