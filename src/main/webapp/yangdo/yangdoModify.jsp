<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   window.onload = function() {
      if(${su > 0}) {
         alert("글을 수정하였습니다.")
      } else {
         alert("글을 수정하지 못하였습니다.")
      }
      location.href="yangdoView.do?seq=${seq}&pg=${pg}";
   }
</script>
</head>
<body>

</body>
</html>