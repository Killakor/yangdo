<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${su_give > 0}) {
			alert("양도 완료 되었습니다.");
			location.href="../main/index.jsp";
		} else {
			alert("양도가 실패하였습니다.");
			history.back();
		}		
	}
</script>
</head>
<body>

</body>
</html>