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
<link rel="stylesheet" type="text/css" href="../css/ListViewCss.css?v2">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/PayFormScript.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#test").click(function() {
			$("#scd_table_bottom").slideToggle();
		});
	});
	
	$(function(){	
		// submit 버튼 클릭 시 입력 검사
		$("#pay_submit").click(function(){
			// 휴대폰 입력검사
			if(!$("input[name='phone1']").val()) {
				alert("휴대폰 번호를 입력해주세요.");
				$("input[name='phone']").focus();
				
				return false;
			}
			if(!$("input[name='phone2']").val()) {
				alert("휴대폰 번호를 입력해주세요.");
				$("input[name='phone2']").focus();
				
				return false;
			}
			if(!$("input[name='phone3']").val()) {
				alert("휴대폰 번호를 선택해주세요.");
				$("span[id='phone3']").focus();
				
				return false;
			}
			var confirm_pay = confirm("-결제 정보 확인하기-\n 결제자:${memId}\n 예약시작일:${dto.res_start_date}\n 예약종료일:${dto.res_end_date}\n 양도가:${dto.yangdo_price}원\n 양도장소:${dto.res_spot}\n 양도정보:${dto.res_seat}\n 예약수:${dto.yangdo_res_count}\n 예약인원:${dto.yangdo_people}")
			if( confirm_pay == true){
				document.getElementById('yangdoPayForm').submit();
			} else {
				alert('취소를 누르셨습니다');
			}
		});
		
	});
</script>

<style type="text/css">
select {
	width: 200px;
	padding: 5px;
	border: 1px solid #999;
	border-radius: 5px;
	font-size: 15px;
}

div.receiver_inform input {
	width: 75px;
	height: 25px;
	border-radius: 10px;
	text-align: center;
}
</style>


</head>
<body>
	<div class="yangdo_information">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>결제하기</h3>
			</div>
		</div>
		<div class="container">
			<form action="yangdoPayTake.do" id="yangdoPayForm" name="yangdoPayForm"	method="post">
				<input type="hidden" name="seq" value="${seq}">
				<input type="hidden" name="id" value="${dto.id}">
				<input type="hidden" name="pg" value="${pg}">
				<input type="hidden" name="res_start_date" value="${dto.res_start_date }">
				<input type="hidden" name="res_end_date" value="${dto.res_end_date }">
				<input type="hidden" name="res_region" value="${dto.res_region }">
				<input type="hidden" name="res_spot" value="${dto.res_spot }">
				<input type="hidden" name="res_price" value="${dto.res_price}">
				<input type="hidden" name="res_seat" value="${dto.res_seat }">
				<input type="hidden" name="yangdo_kind" value="${dto.yangdo_kind }">
				<input type="hidden" name="res_total" value="${dto.res_total }">
				<input type="hidden" name="yangdo_due_date" value="${dto.yangdo_due_date }">
				<input type="hidden" name="yangdo_price" value="${dto.yangdo_price }">
				<input type="hidden" name="yangdo_fee" value="${dto.yangdo_fee }">
				<input type="hidden" name="yangdo_total_price" value="${dto.yangdo_total_price }">
				<input type="hidden" name="yangdo_reason" value="${dto.yangdo_reason }">
				<input type="hidden" name="yangdo_res_count" value="${dto.yangdo_res_count }">
				<input type="hidden" name="yangdo_people" value="${dto.yangdo_people }">
				
				<div>
					<table class="table_top" width="650" style="margin: auto;">
						<tr>
							<td colspan="2"	style="font-size: 25px; border-bottom: 1px solid black; font-weight: bold;">양도정보</td>
						</tr>
						<tr align="left">
							<td width="200" class="content">양도가</td>
							<fmt:parseNumber value="${dto.yangdo_price }" var="yangdo_price" />
							<fmt:formatNumber value="${yangdo_price }" var="result_yangdo_price" pattern="#,###" />
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
							<td class="content">상태</td>
							<td style="color: #f7323f; font-weight: bold;">${dto.yangdo_status}</td>
						</tr>
						<tr>
							<td colspan="2"
								style="color: #ABABAB; font-size: 12px; border-top: 1px solid lightgray; padding-top: 5px; padding-bottom: 5px; font-family: 'Nanum Gothic'">
								* 양도받은 예약은 예약변경 및 부분취소는 불가하며, 예약취소만 가능합니다.</td>
						</tr>
					</table>
				</div>
				<table class="table_bottom" width="650" style="margin: auto;">
					<tr id="test" align="left">
						<td colspan="2"
							style="font-size: 25px; border-bottom: 1px solid black; font-weight: bold; padding-bottom: 15px;">예약신청
							정보 <img src=../resources/img/chevron-down-solid.svg width="20"
							height="20" align="right">
						</td>
					</tr>
				</table>
				<div id="scd_table_bottom" class="res_information">
					<table class="scd_table_bottom" width="650" style="margin: auto;">
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
							<td align="right">
							<fmt:parseDate var="parse_res_start_date"	value="${dto.res_start_date}" pattern="yyyy-MM-dd" />
							<fmt:formatDate	var="result_res_start_date" value="${parse_res_start_date}"	pattern="MM/dd(E)" /> ${result_res_start_date} ~ 
							<fmt:parseDate var="parse_res_end_date" value="${dto.res_end_date}"	pattern="yyyy-MM-dd" />
							<fmt:formatDate	var="result_res_end_date" value="${parse_res_end_date}"	pattern="MM/dd(E)" /> ${result_res_end_date}
							</td>
						</tr>
						<tr>
							<td align="left" class="content">예약 인원</td>
							<td align="right">${dto.yangdo_people }명</td>
						</tr>
						<tr>
							<td align="left" class="content">원래 예약 요금</td>
							<fmt:parseNumber value="${dto.res_price }" var="res_price" />
							<fmt:formatNumber value="${res_price }" var="result_res_price"
								pattern="#,###" />
							<td align="right">${result_res_price }원</td>
						</tr>
						<tr>
							<td align="left" class="content">총 이용 금액</td>
							<fmt:parseNumber value="${dto.res_total }" var="res_total" />
							<fmt:formatNumber value="${res_total }" var="result_res_total"
								pattern="#,###" />
							<td align="right">${result_res_total }원</td>
						</tr>
					</table>
				</div>
				<div class="receiver_inform">
					<table width="650" style="margin: auto;">
						<tr>
							<td colspan="2"
								style="font-size: 25px; padding: 10px 0; font-weight: bold; border-bottom: 1px solid black;">예약자
								정보</td>
						</tr>
						<tr>
							<td width="200">예약자ID</td>
							<td><input style="width: 268px;" type="text" name="receiver_name" value="${memId }"></td>
						</tr>
						<tr>
							<td width="200">연락처</td>
							<td><input type="text" name="phone1"> - <input
								type="text" name="phone2"> - <input type="text"
								name="phone3"></td>
						</tr>
					</table>
				</div>
				<div class="choice_pay_method">
					<table width="650" style="margin: auto;">
						<tr>
							<td colspan="2"
								style="font-size: 25px; border-bottom: 1px solid #f7323f; font-weight: bold; padding-bottom: 10px; padding-top: 10px;">결제방법
								선택</td>
						</tr>
						<tr>
							<td style="color: #f7323f; font-size: 30px;">결제금액</td>
							<td style="text-align: right; padding: 15px 0;">${result_yangdo_price }원</td>
						</tr>
						<tr>
							<td width="200" height="30">결제 수단 선택</td>
							<td height="30">
								<select name="paymethod" class="paymethod">
									<option value="신용/체크카드">신용 / 체크카드</option>
									<option value="간편계좌이체">간편계좌이체</option>
									<option value="휴대폰결제">휴대폰결제</option>
								</select>
							</td>
						</tr>
					</table>
				</div>

				<div class="receive_yangdo">
					<table width="650" height="70"
						style="background: #f7323f; margin: auto; border-radius: 15px">
						<tr>
							<td id="pay_submit" style="font-size: 25px;" align="center">
								<input type="button" class="pay_submit" id="pay_submit" value="결제하기" style="color: white; background-color: #f7323f; border: 0">
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>

	</div>
</body>
</html>