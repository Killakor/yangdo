<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/totalCommon.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/noticeCheck.js"></script>
<style type="text/css">
.sub_title2 {
	border-bottom: solid 3px #E6E6E6;
} 
.sub_title2 a {
	width: 150px;
	font-size: 25px;
	margin-right: 12px;
	margin-bottom: 10px;
}
.sub_title2 #a_write{
	border-bottom: solid 3px #f7323f;
	color: #f7323f;
}
#noticeWriteForm {
	width: 790px;
}
#noticeWriteForm strong {
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
.btn_wrap {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>더보기</h3>
			</div>
		</div>

		<div class="container">
			<div id="nav">
				<ul class="nav_list">
					<li><a class="active" href="../notice/noticeListAndView.do">공지사항</a></li>
					<li><a href="../event/eventList.do">이벤트</a></li>
					<li><a href="../faq/faqListAndView.do">자주 묻는 질문</a></li>
					<li><a href="../qna/qnaListAndView.do">QNA</a></li>
				</ul>
			</div>


			<div id="content">
				<div class="sub_title2">
					<a id="a_list" href="../notice/noticeListAndView.do">서비스 공지사항</a>
					<a id="a_write" href="../notice/noticeWriteForm.do">공지 작성</a>
				</div>

				<div class="tab_each">
					<form action="noticeWrite.do" id="noticeWriteForm" method="post" name="noticeWriteForm">
						<div id="notice_sub">
							<strong>공지 제목</strong>
							<input type="text" name="notice_subject" class="noButton1">
							<label id="subject_msg_label" class="msg_label" style="color: red;"></label>
						</div>

						<div id="notice_cont">
							<strong>공지 내용</strong>
							<textarea name="notice_content" class="noButton2" rows="15" cols="45"></textarea>
							<label id="cont_msg_label" class="msg_label" style="color: red;"></label>
						</div>

						<div class="btn_wrap">
							<input type="button" class="noButton4" value="목록으로" 
								onclick="location.href='noticeListAndView.do'">
							<input type="submit" class="noButton4" value="작성 완료"> 
							<input type="reset" class="noButton4" value="다시 쓰기">
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

</body>
</html>