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
	       alert("비밀번호가 변경되었습니다.\n창을 닫습니다.");
	       window.close();
	    } else {
	       alert("비밀번호 변경에 실패했습니다.");
	       history.back();
	    }
	 }
</script>
</head>
<body>

</body>
</html>