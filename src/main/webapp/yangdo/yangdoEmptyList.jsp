<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css?v2">
<link rel="stylesheet" type="text/css" href="../css/ListCss.css?v2">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/toggle_category.js"></script>
<script type="text/javascript">
	$(function(){
		var yangdo_kind = "<c:out value="${yangdo_kind}"/>";
		if (['호텔', '모텔', '펜션'].indexOf(yangdo_kind) >= 0) {
			$("#category1-1").show();
			$("#category1-2").show();
			$("#category1-3").show();
		} else if (['스포츠', '영화', '콘서트'].indexOf(yangdo_kind) >= 0) {
			$("#category2-1").show();
			$("#category2-2").show();
			$("#category2-3").show();
		} else {
			$("#category3-1").show();
			$("#category3-2").show();
		}
		
		if(${yangdo_kind == "호텔"}) $(".class3").eq(0).addClass("active");
		else if(${yangdo_kind == "모텔"}) $(".class3").eq(1).addClass("active");
		else if(${yangdo_kind == "펜션"}) $(".class3").eq(2).addClass("active");
		else if(${yangdo_kind == "스포츠"}) $(".class3").eq(3).addClass("active");
		else if(${yangdo_kind == "영화"}) $(".class3").eq(4).addClass("active");
		else if(${yangdo_kind == "콘서트"}) $(".class3").eq(5).addClass("active");
		else if(${yangdo_kind == "레스토랑"}) $(".class3").eq(6).addClass("active");
		else $(".class3").eq(7).addClass("active");
	});
</script>
</head>
<body>
	<div id="yangdoList">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>${yangdo_kind } 양도 글 보기</h3>
			</div>
		</div>
		<div class="container">
			<div id="nav">
				<div id="choose_category">
					<ul>
						<li class="class1">카테고리</li><br>
							<c:if test="${memId != null}">
								<li><a style="font-size:30px; color:#f7323f;"href="yangdoWriteForm.do">양도하기</a></li><br>
							</c:if>
						<li class="class2"> 숙박 <img src="../resources/img/chevron-down-solid.svg" id="category1"></li><br>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=호텔" id="category1-1">호텔</a></li>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=모텔" id="category1-2">모텔</a></li>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=펜션" id="category1-3">펜션</a></li><br>
					</ul>
					<ul>
						<li class="class2"> 티켓 <img src="../resources/img/chevron-down-solid.svg" id="category2"></li><br>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=스포츠"  id="category2-1">스포츠</a></li>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=영화"  id="category2-2">영화</a></li>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=콘서트"  id="category2-3">콘서트/뮤지컬</a></li><br>
					</ul>
					<ul>
						<li class="class2"> 식사권 <img src="../resources/img/chevron-down-solid.svg" id="category3"></li><br>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=레스토랑" id="category3-1">레스토랑</a></li>
						<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=식사권" id="category3-2">호텔 식사권</a></li><br>
					</ul>
				</div>
			</div>
			<div id="content">
				<table width="780" style="margin: auto;">
						<tr>
							<th style="font-size:25px;"> ${yangdo_kind }에 대한 양도 내역이 없습니다.</th>
						</tr><br><br>
						<tr>
							<th style="padding-top:30px; font-size:25px;">다음에 이용해주세요 ㅠ^ㅠ</th>
						</tr>
				</table>
			</div>
		</div>
	</div>
	<!--  
	<c:if test="${memId == null }">
		<a href="../member/loginForm.jsp">로그인</a>
	</c:if>
	<c:if test="${memId != null}">
		<a href="yangdoWriteForm.do">새글쓰기</a>
		<br>
		<a href="../main/index.jsp">메인화면</a>
		<br>
	</c:if>
	-->
</body>
</html>





