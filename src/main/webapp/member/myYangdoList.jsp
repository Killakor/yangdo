<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css">
<style type="text/css">
@font-face{
	font-family:'test_name';
	font-style:normal;
	font-weight:1000;
	src: url('../resources/BMJUA_ttf.ttf') format('truetype');
}
*{margin:0; padding: 0;}
.sub_title2 {margin-bottom: 10px;}
table{
	font-family:test_name;
	margin-bottom: 100px;
}

.status {
	color: #f7323f;
	font-weight: bold;
}

.due_date {
	color: black;
	text-decoration: none;
	border-bottom: 1px solid black;
	font-size: 25px;
	padding-top: 15px;
}

.due_date>span {
	color: #f7323f;
	font-size: 20px;
}

th {
	width: 200px;
	text-align: left;
	color: gray;
	font-size: 18px;
	padding-top:5px;
	padding-bottom:5px;
}
td{
	font-size: 18px;
}
.detail {
	text-align: center;
	background-color: #ebebeb;
	height: 35px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>내 양도내역</h3>
			</div>
		</div>
		<div class="container">
			<div id="nav">
				<ul>
					<li><a href="../member/memberModifyForm.do">내 정보 관리</a></li>
					<li><a class="active" href="../yangdo/yangdoList.do?my=1">이용내역</a></li>
					<li><a href="../qna/qnaListAndView.do?my=1">문의사항</a></li>
				</ul>
			</div>
			<div class="sub_title2">
				<h3>내 양도 내역</h3>
			</div>
			<div id="content">
				<table width="780">
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
</body>
</html>





