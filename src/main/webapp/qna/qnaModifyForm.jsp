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
#qnaModifyForm {
	width: 500px;
}
#qnaModifyForm strong {
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
#public input{
	margin-left: 20px;
}
#bottom_btn {
	margin-top: 20px;
	text-align: center;
}
</style>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="qnaModify">
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
					<li><a class="active" href="../qna/qnaListAndView.do">QNA</a></li>
				</ul>
			</div>
			
			<div id="content">
				<div class="sub_title2">
					<a id="a_list" href="../qna/qnaListAndView.do">QnA 게시판</a> <a
						id="a_write" href="../qna/qnaWriteForm.do">새 문의 작성</a>
				</div>
				
				<div class="tab_each">
					<form action="qnaModify.do" id="qnaModifyForm" method="post" name="qnaModifyForm">
						<input type="hidden" name="qna_num" value="${dto.qna_num}">
	  					<input type="hidden" name="pg" value="${pg}">
						
						<div>
							<strong>문의 유형</strong> 
							<select name="qna_type" class="qnaButton1">
								<option value="none">문의 유형을 선택하세요.</option>
								<option value="이용문의" <c:if test="${dto.qna_type eq '이용문의'}">selected="selected"</c:if>>이용문의</option>
								<option value="결제"<c:if test="${dto.qna_type eq '결제'}">selected="selected"</c:if>>결제</option>
								<option value="회원정보"<c:if test="${dto.qna_type eq '회원정보'}">selected="selected"</c:if>>회원정보</option>
								<option value="이벤트"<c:if test="${dto.qna_type eq '이벤트'}">selected="selected"</c:if>>이벤트</option>
								<option value="기타"<c:if test="${dto.qna_type eq '기타'}">selected="selected"</c:if>>기타</option>
							</select>
							<label id="type_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div>
							<strong>카테고리</strong> 
							<select name="qna_category" class="qnaButton1">
								<option value="none">카테고리를 선택하세요.</option>
								<option value="호텔" <c:if test="${dto.qna_category eq '호텔'}">selected="selected"</c:if>>호텔</option>
								<option value="모텔" <c:if test="${dto.qna_category eq '모텔'}">selected="selected"</c:if>>모텔</option>
								<option value="펜션" <c:if test="${dto.qna_category eq '펜션'}">selected="selected"</c:if>>펜션</option>
								<option value="스포츠" <c:if test="${dto.qna_category eq '스포츠'}">selected="selected"</c:if>>스포츠</option>
								<option value="영화" <c:if test="${dto.qna_category eq '영화'}">selected="selected"</c:if>>영화</option>
								<option value="콘서트" <c:if test="${dto.qna_category eq '콘서트'}">selected="selected"</c:if>>콘서트</option>
								<option value="레스토랑" <c:if test="${dto.qna_category eq '레스토랑'}">selected="selected"</c:if>>레스토랑</option>
								<option value="식사권" <c:if test="${dto.qna_category eq '식사권'}">selected="selected"</c:if>>식사권</option>
								<option value="기타" <c:if test="${dto.qna_category eq '기타'}">selected="selected"</c:if>>기타</option>
							</select>
							<label id="category_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div>
							<strong>문의 제목</strong>
							<input type="text" class="qnaButton1" name="qna_subject" value="${dto.qna_subject}">
							<label id="subject_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div>
							<strong>문의 내용</strong>
							<textarea class="qnaButton2" cols="55" rows="10" name="qna_content">${dto.qna_content}</textarea>
							<label id="cont_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div id="public">
							<strong>공개 여부</strong>
							<c:if test="${dto.qna_public eq 0}">
								<input type="radio" class="qnaButton3" name="qna_public" value=0 checked="checked">공개
								<input type="radio" class="qnaButton3" name="qna_public" value=1>비공개
							</c:if>
							<c:if test="${dto.qna_public eq 1}">
								<input type="radio" class="qnaButton3" name="qna_public" value=0>공개
								<input type="radio" class="qnaButton3" name="qna_public" value=1 checked="checked">비공개
							</c:if>
							
						</div>
						
						<div id="bottom_btn">
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