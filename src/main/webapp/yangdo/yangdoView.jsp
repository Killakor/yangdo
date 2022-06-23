<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css?v2">
<link rel="stylesheet" type="text/css" href="../css/ListViewCss.css?v3">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#test").click(function(){
		$("#scd_table_bottom").slideToggle();
	});
});

function next(){
	 if(confirm("양도받기는 20분이내에 결제처리 하셔야합니다.\n\n양도를 진행하시겠습니까?")){
	  location.href="yangdoPayForm.do?pg=${pg }&seq=${dto.seq}";
	  } else{
	 	alert('취소를 누르셨습니다');
	 	return false;
	 	}
	}
</script>
</head>
<body>
	<div class="yangdo_information">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>양도정보 상세보기 </h3>
			</div>
		</div>
		<div class="container">
		<table class="table_top" width="650" style="margin: auto;">
			<tr>
				<td colspan="2" style="font-family: 'test_name'; font-size: 25px; border-bottom: 1px solid black; font-weight: bold;">양도정보</td>
			</tr>
			<tr align="left">
				<td class="content">양도가</td>
				<fmt:parseNumber value="${dto.yangdo_price }" var="yangdo_price"/>
				<fmt:formatNumber value="${yangdo_price }" var="result_yangdo_price" pattern="#,###"/>
				<td style="font-weight: bold;">${result_yangdo_price}원</td>
			</tr>
			<tr align="left">
				<td class="content">양도마감일</td>
				<td style="color: #f7323f; font-weight: bold;">${dto.yangdo_due_date}
					23:00 까지</td>
			</tr>
			<tr align="left">
				<td class="content">양도사유</td>
				<td>${dto.yangdo_reason}</td>
			</tr>
			<tr align="left">
				<td class="content" >상태</td>
				<td style="color:#f7323f">${dto.yangdo_status}</td>
			</tr>
			<tr>
				<td colspan="2"
					style="color: #ABABAB; font-size: 12px; border-top: 1px solid lightgray; padding-top: 5px; padding-bottom: 5px; font-family: 'Nanum Gothic'">
					* 양도받은 예약은 예약변경 및 부분취소는 불가하며, 예약취소만 가능합니다.</td>
			</tr>
		</table>
		<table class="table_bottom" width="650" style="margin: auto;">
			<tr id="test" align="left">
				<td colspan="2" style="font-size: 25px; border-bottom: 1px solid black; font-weight: bold; padding-bottom: 15px;">예약신청 정보
					<img src=../resources/img/chevron-down-solid.svg width="20" height="20" align="right">
				</td>
			</tr>
		</table>
	</div>
	<div id="scd_table_bottom" class="res_information">
		<table class="scd_table_bottom" width="650" style="margin:auto;">
			<tr>
				<td align="left" class="content">예약 장소</td>
				<td align="right">${dto.res_spot }</td>
			</tr>
			<tr>
				<td align="left" class="content">예약 정보</td>
				<td align="right">${dto.res_seat }</td>
			</tr>
			<tr>
				<td align="left" class="content">예약 기간</td>
				<td align="right"><fmt:parseDate var="parse_res_start_date"
						value="${dto.res_start_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
						var="result_res_start_date" value="${parse_res_start_date}"
						pattern="MM/dd(E)" /> ${result_res_start_date} ~ <fmt:parseDate
						var="parse_res_end_date" value="${dto.res_end_date}"
						pattern="yyyy-MM-dd" /> <fmt:formatDate var="result_res_end_date"
						value="${parse_res_end_date}" pattern="MM/dd(E)" />
					${result_res_end_date}</td>
			</tr>
			<tr>
				<td align="left" class="content">예약 인원</td>
				<td align="right">${dto.yangdo_people }명</td>
			</tr>
			<tr>
				<td align="left" class="content">원래 예약 요금</td>
				<fmt:parseNumber value="${dto.res_price }" var="res_price"/>
				<fmt:formatNumber value="${res_price }" var="result_res_price" pattern="#,###"/>
				<td align="right">${result_res_price }원</td>
			</tr>
			<tr>
				<td align="left" class="content">총 이용 금액</td>
				<fmt:parseNumber value="${dto.res_total }" var="res_total"/>
				<fmt:formatNumber value="${res_total }" var="result_res_total" pattern="#,###"/>
				<td align="right">${result_res_total }원</td>
			</tr>
		</table>
	</div>
	<div class="receive_yangdo">
		<table width="650" height="70" style="margin:auto; border-radius:15px">
			<tr>
				<c:if test="${memId != dto.id && memGrade == 1 }">
					<td style="font-size:25px; background:#f7323f; border-radius: 15px;" align="center"  onclick="next()">
					<a href="#" style="text-decoration:none; color:white;">예약양도받기</a></td>
				</c:if>
				<c:if test="${(memId == dto.id && memGrade == 1)||(memGrade==0)}">
					<td style="font-size:25px; background:#f7323f; border-radius: 15px;" align="center">
					<a href="yangdoModifyForm.do?pg=${pg }&seq=${dto.seq}" style="text-decoration:none; color:white;">수정하기</a></td>
					<td style="font-size:25px; background:#f7323f; border-radius: 15px;" align="center">
					<a href="yangdoDelete.do?pg=${pg }&seq=${dto.seq}" style="text-decoration:none; color:white;">글 삭제하기</a></td>
				</c:if>
				<td style="font-size:25px; background:#f7323f; border-radius: 15px;" align="center">
					<a href="javascript:window.history.back();" style="text-decoration:none; color:white;">돌아가기</a>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>