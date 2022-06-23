<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css?v3">
<link rel="stylesheet" type="text/css" href="../css/WriteFormCss.css?v2">
<script type="text/javascript" src=../js/jquery-3.6.0.min.js></script>
<script type="text/javascript" src="../js/WriteFormScript.js"></script>
<script type="text/javascript" src="../js/toggle_category.js"></script>
<script type="text/javascript" src="../js/select_category.js"></script>
</head>
<body>
	<div id="yangdoWrite">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>양도하기</h3>
			</div>
		</div>
		<div class="container">
			<div id="nav">
				<div id="choose_category">
					<ul>
						<li class="class1">카테고리</li><br>
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
			</div>
			<div class="exec">
				<form action="yangdoWrite.do" id="yangdoWriteForm" name="yangdoWriteForm" method="post" >
					<div id="input">
						<table>
							<tr>
								<td style="color:#f7323f;">*모든항목은 필수입니다.</td>
							</tr>
							<tr>
								<td><h3>양도자 : ${memId }</h3></td>
							</tr>
							<tr>
								<td style="text-align:left;">
									<h3>예약 일자</h3>
									<span class="span_date">시작일</span><span class="span_date">종료일</span><br>
									<input type="date" name="res_start_date">
									<input type="date" name="res_end_date">
								</td>
							</tr>
							<tr>
								<td>
									<h3>지역 선택</h3> 
									<span id="region_category1"></span> 
									<span id="region_category2"></span><br> 
									<input style="padding-top:10px; border: none;" id="region_select" name="res_region" readonly>
								</td>
							</tr>
							<tr>
								<td>
									<h3 class="yangdo_kind">양도 종류</h3>
									<span id="spot_category1"></span> 
									<span id="spot_category2"></span><br> 
									<input style="padding-top:10px; border: none;" id="kind_select" name="yangdo_kind" readonly>
								</td>
							</tr>
							<tr>
								<td>
									<h3>예약한 장소</h3>
									<input type="text" name="res_spot" placeholder="ex)서울 시그니엘호텔">
								</td>
							</tr>
							<tr>
								<td>
									<h3>예약 좌석 or 방</h3> 
									<input type="text" name="res_seat" placeholder="ex)티켓 => 좌석번호(h3, h4) , 숙박=> 수페리어더블, 스탠다드)">
								</td>
							</tr>
							<tr>
								<td>
									<h3>예약 금액</h3>
									<input type="text" name="res_price" placeholder="숫자만 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td>
									<h3>총 이용 금액</h3>
									<input type="text" name="res_total" placeholder="숫자만 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td>
									<h3>양도 마감일</h3>
									<input type="date" name="yangdo_due_date">
								</td>
							</tr>
							<tr>
								<td>
									<h3>양도가</h3>
									<input type="text" name="yangdo_price" placeholder="숫자만 입력해주세요.">
							</tr>
							<tr>
								<td>
									<h3>양도 수수료(양도가 5%)</h3>
									<input type="text" name="yangdo_fee" readonly style="background:rgba(0, 0, 0, 0.08);" onclick="calcNow(), calcTotal()">
								</td>
							</tr>
							<tr>
								<td>
									<h3>양도성사시 환불금액</h3> <input type="text"
									name="yangdo_total_price" readonly style="background:rgba(0, 0, 0, 0.08);">
								</td>
							</tr>
							<tr>
								<td>
									<h3>양도사유</h3> <input type="text" name="yangdo_reason">
								</td>
							</tr>
							<tr>
								<td>
									<h3>예약 수</h3> <input type="text" name="yangdo_res_count" placeholder="숫자만 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td>
									<h3>예약 인원</h3> <input type="text" name="yangdo_people" placeholder="숫자만 입력해주세요."><br>
								</td>
							</tr>
							<tr>
								<td>
								<c:if test="${memGrade eq 1}">
									<input type="submit" value="등록하기" class="myButton">
								</c:if>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>