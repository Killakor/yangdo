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
		} else if (['스포츠', '영화', '뮤지컬'].indexOf(yangdo_kind) >= 0) {
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
		else if(${yangdo_kind == "뮤지컬"}) $(".class3").eq(5).addClass("active");
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
				<ul>
					<li class="class1">카테고리</li><br>
						<c:if test="${memGrade eq 1}">
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
					<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=뮤지컬"  id="category2-3">뮤지컬</a></li><br>
				</ul>
				<ul>
					<li class="class2"> 식사권 <img src="../resources/img/chevron-down-solid.svg" id="category3"></li><br>
					<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=레스토랑" id="category3-1">레스토랑</a></li>
					<li><a class="class3" href="yangdoList.do?pg=1&yangdo_kind=식사권" id="category3-2">호텔 식사권</a></li><br>
				</ul>
			</div>
			<div id="content">
				<table width="780" style="margin: auto;">
					<c:forEach var="bean" items="${list}">
						<tr>
							<th colspan="2" class="due_date">양도 마감일 : <span>${bean.yangdo_due_date }
									22:59:59</span></th>
						</tr>
						<tr>
							<th>예약일자</th>
							<td style="color: black; font-weight: bold;">
							<fmt:parseDate value="${bean.res_start_date}" var="parse_res_start_date" pattern="yyyy-MM-dd" />
							<fmt:formatDate	value="${parse_res_start_date}" var="result_res_start_date"	pattern="yyyy.MM.dd" />
							${result_res_start_date} / 
							<fmt:parseDate value="${bean.res_start_date}" var="parse_res_start_date" pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${parse_res_start_date.time / (1000*60*60*24)}"	integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${bean.res_end_date}" var="parse_res_end_date" pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${parse_res_end_date.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							<c:if test="${endDate - strDate == 0}">
								<label style="color: blue;">당일예약</label>
							</c:if>
							<c:if test="${endDate - strDate != 0}">
								<label style="color: blue;">${endDate - strDate}박 ${endDate - strDate + 1}일</label>	
							</c:if>
							</td>
						</tr>
						<tr>
							<th>지역</th>
							<td>${bean.res_region }</td>
						</tr>
						<tr>
							<th>예약 유형</th>
							<td>${bean.yangdo_kind }</td>
						</tr>
						<tr>
							<th>예약장소 / 예약정보</th>
							<td>${bean.res_spot } / ${bean.res_seat}</td>
						</tr>
						<tr>
							<th>양도금액</th>
							<fmt:parseNumber value="${bean.yangdo_price }" var="yangdo_price"/>
							<fmt:formatNumber value="${yangdo_price }" var="result_yangdo_price" pattern="#,###"/>
							<td style="font-weight: bold;">${result_yangdo_price}원</td>
						</tr>
						<tr>
							<th>상태</th>
							<td class="status">${bean.yangdo_status }</td>
						</tr>
						<tr>
							<th colspan="2"
								style="border-top: 1px solid lightgray; font-size: 18px;">${bean.id }</th>
						</tr>
						<tr>
							<td colspan="2" class="detail"><a
								style="font-weight: bold; text-decoration: none; color: black;"
								href="yangdoView.do?pg=${pg }&seq=${bean.seq }">자세히보기</a></td>
							<td></td>
						</tr>
					</c:forEach>
					<!-- 페이징 -->
					<tr>
						<td colspan="5" align="center" style="padding-top:30px; padding-bottom:30px; font-size:20px;">
							<c:if test="${startPage > 3 }">[<a class="paging" href="yangdoList.do?pg=${startPage-1 }&yangdo_kind=${yangdo_kind}">이전</a>]</c:if> <c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${pg == i }">[<a class="currentPaging" href="yangdoList.do?pg=${i }&yangdo_kind=${yangdo_kind}">${i }</a>]</c:if>
							<c:if test="${pg != i }">[<a class="paging" href="yangdoList.do?pg=${i }&yangdo_kind=${yangdo_kind}">${i }</a>]</c:if>
							</c:forEach>
							<c:if test="${endPage < totalP }">[<a class="paging" href="yangdoList.do?pg=${endPage+1 }&yangdo_kind=${yangdo_kind}">다음</a>]</c:if>
						</td>
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





