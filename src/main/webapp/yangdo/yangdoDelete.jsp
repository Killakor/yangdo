<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<script type="text/javascript">
	window.onload = function() {
		if(${su > 0}) {
			if(confirm("정말로 게시글을 삭제하시겠습니까?")==true){
				alert("게시글이 삭제되었습니다.");
				location.href="../main/index.jsp";				
			} else return false;
		} else {
			alert("게시글을 삭제하지 못하였습니다.");
			history.back();
		}
	}
</script>
</head>
<body>

</body>
</html>