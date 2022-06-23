<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/totalCommon.css">
<style type="text/css">
pre {
	white-space: pre-wrap;
	padding: 20px;
	font-size: 16px;
	font-family: 'Nanum Gothic';
}
#tab {
	background: rgba(0, 0, 0, 0.02);
	border-top: 1px solid rgba( 0, 0, 0, 0.08);
	border-bottom: 1px solid rgba( 0, 0, 0, 0.08);
}
#tab > span {
	display: inline-block;
	margin: 0; padding: 8px 25px;
	height: 30px;
	line-height: 30px;
}
.faq_active {
	border-bottom: 3px solid rgb(230, 28, 81);
}
.sub_title2 {
	border-bottom: solid 3px #E6E6E6;
} 
.sub_title2 h1 {
	width: 150px;
	font-size: 25px;
	margin-bottom: 10px;
	color: #f7323f;
}
#write_btn {
	float: right;
	position: relative;
	bottom: 30px;
	right: 50px;
}
.tab_each{
	clear: both;
}
.cont_wrap {
	width: 820px;
}
pre {
	white-space: pre-wrap;
	padding: 20px;
}
.faq_title {
	height: 100px;
	margin: auto;
	border-bottom: solid 1px #F2F2F2;
}
.faq_title h2 {
	position: relative;
	top: 40px;
}
.faq_title h2 {
	font-size: 23px;
}

#down_icon {
	float: right;
	position: relative;
	top: 20px;
	right: 60px;
}
.faq_cont {
	background-color: #F2F2F2;
	margin: auto;
}
#btn_wrap {
	text-align: center;
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var index = ${category}-1;
		
		$("#tab > span").removeClass("faq_active");
		$("#tab > span").eq(index).addClass("faq_active");
	});
	
	$(function(){
		$(".cont_wrap").hide();
		$(".faq_title").click(function(){
			$(this).next("div").toggle();
		});
	});
</script>
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
					<li><a href="../event/eventList.do">이벤트</a></li>
					<li><a class="active" href="../faq/faqListAndView.do">자주 묻는 질문</a></li>
					<li><a href="../qna/qnaListAndView.do">QNA</a></li>
				</ul>
			</div>
			
			<div id="content">
				<div id="tab">
					<span><a href="../faq/faqListAndView.do?category=1">top7</a></span>  
					<span><a href="../faq/faqListAndView.do?category=2">이용문의</a></span> 
					<span><a href="../faq/faqListAndView.do?category=3">결제</a></span> 
					<span><a href="../faq/faqListAndView.do?category=4">회원정보</a></span> 
					<span><a href="../faq/faqListAndView.do?category=5">모바일티켓</a></span> 
					<span><a href="../faq/faqListAndView.do?category=6">신고</a>	</span>
					
					<c:if test="${memGrade == 0}">
						<input type="button" value="FAQ 작성" 
						onclick="location.href='faqWriteForm.do'">
					</c:if>
				</div>
				
				<div class="tab_each">
					<ul id="faq">
						<li>
							<c:forEach var="dto" items="${list}">
								<c:if test="${category eq dto.faq_category}">
									<div class="faq_title">
										<h2>${dto.faq_subject}</h2>
										<img id="down_icon" alt="down" src="../resources/img/angle-small-down_lg.svg"
										width="20px" height="20px">
									</div>
								
									<div class="cont_wrap">
										<pre class="faq_cont">${dto.faq_content}</pre>
										
										<div id="btn_wrap">
											<c:if test="${memGrade == 0}">
												<input type="button" class="noButton5" value="수정" 
												onclick="location.href='faqModifyForm.do?faq_num=${dto.faq_num}&pg=${pg}'">
												<input type="button" class="noButton5" value="삭제"
										 		onclick="location.href='faqDelete.do?faq_num=${dto.faq_num}&pg=${pg}'">
											</c:if>
										</div>
									</div>
									
								</c:if>													
							</c:forEach>
						</li>
					</ul>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>