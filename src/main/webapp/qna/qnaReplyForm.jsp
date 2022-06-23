<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/qnaCommon.css">
<script type="text/javascript" src="../js/qnaCheck.js"></script>
<style type="text/css">
pre {
	white-space: pre-wrap;
	font-size: 16px;
	font-family: 'Nanum Gothic';
}
.sub_title2 {
	border-bottom: solid 3px #E6E6E6;
	width: 800px;
}
.sub_title2 a {
	width: 150px;
	font-size: 25px;
	margin-right: 12px;
	margin-bottom: 10px;
}
#qnaReplyForm {
	width: 500px;
}
#qnaReplyForm strong {
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
.sub_title2 #a_reply {
	border-bottom: solid 3px #f7323f;
	color: #f7323f;
}
#btn_wrap {
	text-align: center;
}
</style>
</head>
<body>
	<div id="qnaReply">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>더보기</h3>
			</div>
		</div>
		
		<div class="container">
			<div id="nav">
				<ul class="nav_list">
					<li><a href="../notice/noticeListAndView.do">공지사항</a></li>
					<li><a href="../event/eventListAndView.do">이벤트</a></li>
					<li><a href="../faq/faqListAndView.do">자주 묻는 질문</a></li>
					<li><a href="../qna/qnaListAndView.do">QNA</a></li>
				</ul>
			</div>
			
			<div id="content">
				<div class="sub_title2">
					<a id="a_list" href="../qna/qnaListAndView.do">QnA 게시판</a> 
					<a id="a_write" href="../qna/qnaWriteForm.do">새 문의 작성</a>
					<a id="a_reply">문의 답변</a>
				</div>
				
				<div class="tab_each">
					<form action="qnaReply.do" id="qnaReplyForm" method="post" name="qnaReplyForm">
						<input type="hidden" name="qna_num" value="${dto.qna_num}">
	  					<input type="hidden" name="pg" value="${pg}">
						
						<div>
							<strong>문의 유형</strong>
							<pre>${dto.qna_type}</pre>
							
							<strong>문의 유형</strong>
							<pre>${dto.qna_category}</pre>
							
							<strong>문의 제목</strong>
							<pre>${dto.qna_subject}</pre>
							
							<strong>문의 내용</strong>
							<pre>${dto.qna_content}</pre>
							
							<strong>공개여부</strong>
							<c:if test="${dto.qna_public eq 0}">
								<pre>공개</pre>
							</c:if>
							<c:if test="${dto.qna_public eq 1}">
								<pre>비공개</pre>
							</c:if>
						</div>
						
						<div id="qna_answer">
							<strong>문의 답변</strong>
							<textarea class="qnaButton2" name="qna_reply" rows="15" cols="45"><c:if test="${dto.qna_reply != null}">${dto.qna_reply}</c:if></textarea>
							<label id="reply_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div id="btn_wrap">
							<input type="button" class="qnaButton4" value="목록으로"
									onclick="location.href='qnaListAndView.do?pg=${pg}'">
							<input type="submit" class="qnaButton4" value="작성완료">
							<input type="reset" class="qnaButton4" value="다시쓰기">
						</div>
					</form>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>