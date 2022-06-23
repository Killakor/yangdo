<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이번 주말에 뭐하지? 양도어때!</title>
<link rel="stylesheet" type="text/css" href="../css/mainCss.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#more_info").hide();
		
		$("#hide_menu").hide();
		
		$(".drop_more").hover(function(){
			$(this).find("#more_info").fadeIn(200);
		}, function(){
			$("#more_info").fadeOut(200);
		});
		
		$(".drop_mypage").hover(function(){
			$(this).find("#hide_menu").fadeIn(200);
		}, function(){
			$("#hide_menu").fadeOut(200);
		});
		
		$(".myyangdo").click(function(){
			if(${memId == null}) {
				location.href = "../member/loginForm.do";
				return false;
			}
		});
	});
</script>

<style type="text/css">
.down {
	position: relative;
	bottom: 50px;
}
</style>
</head>
<body>
	<!-- Wrap -->
	<div id="wrap">
		<!-- Header -->
		<div id="header">
			<div id="section">
				<!-- logo -->
				<h1 class="title">
					<a href="../main/index.do">
						<img src="../resources/img/logo_red.svg" width="120px">
					</a>
				</h1>
				<!-- gnb -->
				<ul class="mainnav">
					<li><a class="myyangdo" href="../yangdo/yangdoList.do?my=1">이용내역</a></li>
					<li class="drop_more">
						<a href="../notice/noticeListAndView.do">더보기</a>
						<ul id="more_info">
							<li><a href="../notice/noticeListAndView.do">공지사항</a></li>
							<li><a href="../event/eventList.do">이벤트</a></li>
							<li><a href="../faq/faqListAndView.do">자주 묻는 질문</a></li>
							<li><a href="../qna/qnaListAndView.do">QNA</a></li>
						</ul>
					</li>
					<c:if test="${empty memId}">
						<li><a href="../member/loginForm.do">로그인</a></li>
					</c:if>
					<c:if test="${not empty memId}">
						<c:if test="${memGrade == 0}">
							<li><a href="../member/memberList.do?pg=1&grade=-1">회원관리</a></li>
						</c:if>
						<li class="drop_mypage">
							<a href="../member/memberModifyForm.do">
								<img src="../resources/img/mypage.png" width="30px">
								<img class="down" src="../resources/img/chevron-down-solid.svg" width=10px>
							</a>
							<ul id="hide_menu">
								<li style="border-bottom: 1px solid lightgray;">${memNickname}</li>
								<li><a href="../member/memberModifyForm.do">내정보</a></li>
								<li><a href="../yangdo/yangdoList.do?my=1">이용내역</a></li>
								<li><a href="../member/logout.do">로그아웃</a></li>
							</ul>
						</li> 	
					</c:if>
				</ul>
			</div>
		</div>
		
		<!-- Container -->
		<div id="container">
			<div id="body_section">
				<c:if test="${req == null }">
					<jsp:include page="body.jsp"/>
				</c:if>
				<c:if test="${req != null }">
					<jsp:include page="${req }"/>
				</c:if>
			</div>
		</div>
		<div id="footer">
			<div id="footer_section">
				<div id="footer_link">
					<ul>
						<li>회사소개</li>
						<li>이용약관</li>
						<li>개인정보처리방침</li>
						<li>사업자 정보확인</li>
						<li>콘텐츠사업진흥법에의한 표시</li>
					</ul>
				</div>
				<p><strong>고객행복센터 1234-5678</strong> 오전 9시 - 오후 6시</p>
				<p>(주) 이젠아카데미
				<p>주소 : 서울특별시 서초구 서초대로77길 55 에이프로스퀘어 3층</p>
				<p>전화번호 : 1544-8147</p>
				<p>Copyright by EZEN. All rights reserved.</p>				
			</div>
		</div>
	</div>
</body>
</html>