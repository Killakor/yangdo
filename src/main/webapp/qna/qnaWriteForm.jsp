<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/qnaCommon.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
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
#qnaWriteForm {
	width: 500px;
}
#qnaWriteForm strong {
	display: block;
	margin: 20px 0 10px 0;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}
.sub_title2 #a_write {
	border-bottom: solid 3px #f7323f;
	color: #f7323f;
}
#public input{
	margin-left: 20px;
}
#bottom_btn {
	margin-top: 20px;
	text-align: center;
}
</style>

</head>
<body>
	<div id="qnaListAndView">
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
					<a id="a_list" href="../qna/qnaListAndView.do">QnA 게시판</a> 
					<a id="a_write" href="../qna/qnaWriteForm.do">새 문의 작성</a>
				</div>

				<div class="tab_each">
					<form action="qnaWrite.do" id="qnaWriteForm" method="post" name="qnaWriteForm">
						<div>
							<strong>문의 유형</strong> 
							<select name="qna_type" class="qnaButton1">
								<option value="none" selected="selected">문의 유형을 선택하세요.</option>
								<option value="이용문의">이용문의</option>
								<option value="결제">결제</option>
								<option value="회원정보">회원정보</option>
								<option value="이벤트">이벤트</option>
								<option value="기타">기타</option>
							</select>
							<label id="type_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div>
							<strong>카테고리</strong> 
							<select name="qna_category" class="qnaButton1">
								<option value="none" selected="selected">카테고리를 선택하세요.</option>
								<option value="호텔">호텔</option>
								<option value="모텔">모텔</option>
								<option value="펜션">펜션</option>
								<option value="스포츠">스포츠</option>
								<option value="영화">영화</option>
								<option value="콘서트">콘서트</option>
								<option value="레스토랑">레스토랑</option>
								<option value="식사권">식사권</option>
								<option value="기타">기타</option>
							</select>
							<label id="category_msg_label" class="msg_label" style="color: red;"></label>
						</div>

						<div>
							<strong>문의 제목</strong> 
							<input type="text" class="qnaButton1" name="qna_subject">
							<label id="subject_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div>
							<strong>문의 내용</strong>
							<textarea class="qnaButton2" name="qna_content" rows="15" cols="45"></textarea>
							<label id="cont_msg_label" class="msg_label" style="color: red;"></label>
						</div>
						
						<div id="public">
							<strong>공개 여부</strong> 
							<input type="radio" class="qnaButton3" name="qna_public" value=0 checked="checked">공개 
							<input type="radio" class="qnaButton3" name="qna_public" value=1>비공개
						</div>

						<div id="bottom_btn">
							<input type="button" class="qnaButton4" value="목록으로"
									onclick="location.href='qnaListAndView.do'">
							<input type="submit" class="qnaButton4" value="작성완료"> 
							<input type="reset" class="qnaButton4" value="다시쓰기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</html>