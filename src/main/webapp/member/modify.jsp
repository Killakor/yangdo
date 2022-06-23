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
         alert("회원정보가 수정되었습니다.");
         location.href="../main/index.do"
      } else {
         alert("회원정보를 수정하지 못했습니다.");
         history.back();
      }
   }
</script>
</head>
<body>
	
</body>
</html>