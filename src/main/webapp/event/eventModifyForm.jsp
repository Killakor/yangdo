<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/totalCommon.css">
<!-- 
<script type="text/javascript" src="../js/eventCheck.js"></script>
-->
<style type="text/css">
.sub_title2 {
	border-bottom: solid 3px #E6E6E6;
	width: 750px;
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
#eventModifyForm {
	width: 740px;
}
#eventModifyForm strong {
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
#event_period input {
	margin-right: 20px;
}
.btn_wrap {
	text-align: center;
	margin-top: 20px;
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
					<li><a href="../notice/noticeListAndView.do">공지사항</a></li>
					<li><a class="active" href="../event/eventList.do">이벤트</a></li>
					<li><a href="../faq/faqListAndView.do">자주 묻는 질문</a></li>
					<li><a href="../qna/qnaListAndView.do">QNA</a></li>
				</ul>
			</div>

			<div id="content">
				<div class="sub_title2">
					<a id="a_list" href="../event/eventList.do">이벤트</a>
					<a id="a_write" href="../event/eventWriteForm.do">이벤트 글 작성</a>
				</div>

				<div class="tab_each">
					<form action="eventModify.do" id="eventModifyForm" method="post" 
										name="eventModifyForm" enctype="multipart/form-data">
						<input type="hidden" name="event_num" value="${dto.event_num}">
						<input type="hidden" name="pg" value="${pg}">
						
						<div id="event_title">
							<strong>이벤트 제목</strong>
							<input type="text" class="noButton1" name="event_subject" value="${dto.event_subject}">
							<label id="subject_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div id="event_period">
							<strong>이벤트 기간</strong>
							시작 : <input type="date" class="noButton3" name="event_start" value="${dto.event_start}"> 
							종료 : <input type="date" class="noButton3" name="event_end" value="${dto.event_end}">
						</div>
						<label id="period_msg_label" class="msg_label" style="color: red;"></label>
						
						<div id="event_cont">
							<strong>이벤트 내용</strong>
							<textarea cols="45" rows="15" class="noButton2" 
										name="event_content">${dto.event_content}</textarea>
							<label id="cont_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div id="event_file">
							<strong>이벤트 이미지</strong>
							<input type="file" name="event_image"
									 accept="image/jpeg, image/png" value="${dto.event_image}">
						</div>
						<label id="img_msg_label" class="msg_label" style="color: red;"></label>
						
						<div class="btn_wrap">
							<input type="button" class="noButton4" value="목록보기" 
										onclick="location.href='eventList.do?pg=${pg}'">
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