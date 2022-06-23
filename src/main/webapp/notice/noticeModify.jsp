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
         alert("공지를 수정했습니다.")
      } else {
         alert("공지를 수정하지 못했습니다.")
      }
      location.href="noticeListAndView.do?notice_num=${notice_num}&pg=${pg}";
   }
</script>
</head>
<body>

</body>
</html>