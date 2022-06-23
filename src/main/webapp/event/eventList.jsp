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
.sub_title2 #a_list{
	border-bottom: solid 3px #f7323f;
	color: #f7323f;
}
.event_wrap {
	height: 380px;
}
.event_title {
	padding: 10px;
}
.event_title h2 {
	font-size: 23px;
}
.event_title p {
	margin-top: 5px;
	font-size: 18px;
	color: #6E6E6E;
}
.event_paging {
	text-align: center;
	width: 650px;
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
					<c:if test="${memGrade == 0}">
						<a id="a_write" href="../event/eventWriteForm.do">이벤트 글 작성</a>
					</c:if>
				</div>
				
				<div class="tab_each">
					<ul id="event">
						<li>
							<c:forEach var="dto" items="${list}">
								<div class="event_wrap">
									<div class="event_title">
										<h2>${dto.event_subject}</h2>
										<p>기간 : ${dto.event_start}~${dto.event_end} </p>
									</div>
									
									<div class="event_cont">
										<a href="../event/eventView.do?event_num=${dto.event_num}&pg=${pg}">
											<img alt="이미지" src="../storage/${dto.event_image}" width="650" height="270">
										</a>
									</div>
								</div>
							</c:forEach>
						</li>
					</ul>
					
					<div class="event_paging">
						<c:if test="${startPage > 5}">
							<a class="paging" href="eventList.do?pg=${startPage-1}">&#60;</a>
						</c:if>
			
						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<c:if test="${pg == i}">
								<a class="currentPaging" href="eventList.do?pg=${i}">${i}</a>
							</c:if>
							<c:if test="${pg != i}">
								<a class="paging" href="eventList.do?pg=${i}">${i}</a>
							</c:if>
						</c:forEach>
			
						<c:if test="${endPage < totalPage}">
							<a class="paging" href="eventList.do?pg=${endPage+1}">&#62;</a>
						</c:if>
					</div>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>