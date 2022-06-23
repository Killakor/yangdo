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
.sub_title2 {
	border-bottom: solid 3px #E6E6E6;
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
.tab_each{
	clear: both;
}
.cont_wrap {
	width: 820px;
}

.notices_title {
	height: 80px;
	margin: auto;
	border-bottom: solid 1px #F2F2F2;
}
.notices_title > h2, p {
	margin-top: 40px;
}
.notices_title h2 {
	font-size: 23px;
}
.notices_title p {
	margin-top: 5px;
	font-size: 18px;
	color: #6E6E6E;
}
#down_icon {
	float: right;
	margin-right: 50px;
	padding-top: 10px;
}
.notices_cont {
	background-color: #F2F2F2;
	width: 780px;
	margin: auto;
}
.btn {
	margin-top: 10px;
	text-align: center;
}
.notices_paging {
	margin-top: 20px;
	text-align: center;
}
</style>
<script type="text/javascript" src=../js/jquery-3.6.0.min.js></script>
<script type="text/javascript">
	/*
	$(function(){
		$(".cont_wrap").hide();
		
		$(".notices_title").click(function(){
			$(this).next("div").toggle();
			
		}, function(){
			$(this).children("img").attr(("src", function(index, attr){
				if(attr.match('up')) {
					return attr.replace("up", "down");
				} else {
					return attr.replace("down", "up");
				}
			}));
		});
	});
	*/

	$(function(){
		$(".cont_wrap").hide();
		
		$(".notices_title").click(function(){
			$(this).next("div").toggle();
		});
		
		$(".notices_title").click(function(){
			$(this).children("img").attr(("src", function(index, attr){
				if(attr.match('down')) {
					return attr.replace("down", "up");
				} else {
					return attr.replace("up", "down");
				}
			}));
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
					<li><a class="active" href="../notice/noticeListAndView.do">공지사항</a></li>
					<li><a href="../event/eventList.do">이벤트</a></li>
					<li><a href="../faq/faqListAndView.do">자주 묻는 질문</a></li>
					<li><a href="../qna/qnaListAndView.do">QNA</a></li>
				</ul>
			</div>
			
			
			<div id="content">
				<div class="sub_title2">
					<a id="a_list" href="../notice/noticeListAndView.do">서비스 공지사항</a>
					<c:if test="${memGrade == 0}">
						<a id="a_write" href="../notice/noticeWriteForm.do">공지 작성</a>
					</c:if>
				</div>
				
				<div class="tab_each">
					<ul id="notices">
						<li>
							<c:forEach var="dto" items="${list}">
								<div class="notices_title">
									<img id="down_icon" alt="down" src="../resources/img/chevron-down-solid.svg"
										width="20px" height="20px">
									<h2>${dto.notice_subject}</h2>
									
									<p>${dto.notice_logtime}</p>
								</div>
								
								<div class="cont_wrap">
									<pre class="notices_cont">${dto.notice_content}</pre>
									<c:if test="${memGrade == 0}">
										<div class="btn">
											<input type="button" class="noButton5" value="수정" 
												onclick="location.href='noticeModifyForm.do?notice_num=${dto.notice_num}&pg=${pg}'">
											<input type="button" class="noButton5" value="삭제"
									 			onclick="location.href='noticeDelete.do?notice_num=${dto.notice_num}&pg=${pg}'">
										</div>
									</c:if>
								</div>													
							</c:forEach>
						</li>
					</ul>
	
					<div class="notices_paging">
						<c:if test="${startPage > 5}">
							<a class="paging" href="noticeListAndView.do?pg=${startPage-1}">&#60;</a>
						</c:if>
			
						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<c:if test="${pg == i}">
								<a class="currentPaging" href="noticeListAndView.do?pg=${i}">${i}</a>
							</c:if>
							<c:if test="${pg != i}">
								<a class="paging" href="noticeListAndView.do?pg=${i}">${i}</a>
							</c:if>
						</c:forEach>
			
						<c:if test="${endPage < totalPage}">
							<a class="paging" href="noticeListAndView.do?pg=${endPage+1}">&#62;</a>
						</c:if>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>








