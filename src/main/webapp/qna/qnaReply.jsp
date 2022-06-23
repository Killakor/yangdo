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
         alert("답글을 작성했습니다.")
      } else {
         alert("답글을 작성하지 못했습니다.")
      }
      location.href="qnaListAndView.do?pg=${pg}";
   }
</script>
</head>
<body>

</body>
</html>