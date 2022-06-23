<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/totalCommon.css">
<script type="text/javascript" src="../js/faqCheck.js"></script>
<style type="text/css">
pre {
	white-space: pre-wrap;
	padding: 20px;
	font-size: 16px;
	font-family: 'Nanum Gothic';
}
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
#faqModifyForm {
	width: 790px;
}
#faqModifyForm strong {
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
#faq_cotegory option {
	font-size: 16px;
	font-family: 'Nanum Gothic';
}
#btn_wrap {
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
					<a id="a_write" href="../faq/faqWriteForm.do">FAQ 작성</a>
				</div>

				<div class="tab_each">
					<form action="faqModify.do" id="faqModifyForm" method="post" name="faqModifyForm">
						<input type="hidden" name="faq_num" value="${dto.faq_num}">
						<input type="hidden" name="pg" value="${pg}">
						
						<div id="faq_cont">
							<strong>FAQ 카테고리</strong>
							<select class="noButton1" name="faq_category">
								<option value="1" <c:if test="${dto.faq_category eq 1}">selected="selected"</c:if>>top7</option>
								<option value="2" <c:if test="${dto.faq_category eq 2}">selected="selected"</c:if>>이용문의</option>
								<option value="3" <c:if test="${dto.faq_category eq 3}">selected="selected"</c:if>>결제</option>
								<option value="4" <c:if test="${dto.faq_category eq 4}">selected="selected"</c:if>>회원정보</option>
								<option value="5" <c:if test="${dto.faq_category eq 5}">selected="selected"</c:if>>모바일티켓</option>
								<option value="6" <c:if test="${dto.faq_category eq 6}">selected="selected"</c:if>>신고</option>
							</select>
						</div>
						
						<div id="faq_title">
							<strong>FAQ 제목</strong>
							<input type="text" class="noButton1" name="faq_subject" value="${dto.faq_subject}">
							<label id="subject_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div id="faq_cont">
							<strong>FAQ 내용</strong>
							<textarea name="faq_content" class="noButton2" 
										rows="15" cols="45">${dto.faq_content}</textarea>
							<label id="cont_msg_label" class="msg_label" style="color: red;"></label>
						</div>

						<div id="btn_wrap">
							<input type="button" class="noButton4" value="목록으로" 
											onclick="location.href='faqListAndView.do'">
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