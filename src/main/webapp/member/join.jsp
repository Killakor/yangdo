<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
	    if(${su>0}) {
	       alert("회원가입이 완료되었습니다.");
	       location.href="../main/index.do"
	    } else {
	       alert("회원가입에 실패했습니다.");
	       history.back();
	    }
	 }
</script>
</head>
<body>

</body>
</html>