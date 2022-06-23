<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/totalCommon.css">
<style type="text/css">
pre {
	white-space: pre-wrap;
	font-size: 16px;
	font-family: 'Nanum Gothic';
}
.sub_title2 {
	margin-bottom: 10px;
}
.sub_title2 > h3 {
	font-size: 25px;
}
table {
	border-collapse: collapse;
}
tr {
	border-bottom: solid 1px #E6E6E6;
}
td {
	font-size: 15px;
}
#tr_1 {
	background-color: rgb(253, 235, 235);
	border-bottom: 2px solid rgb(230, 28, 81);
}
.qna_title span {
	display: inline-block;
	width: 55px;
	color: rgb(230, 28, 81);
}
.qna_title .no_result {
	font-size: 15px;
	border: solid 1px #F2F2F2;
	padding: 5px;
}
.qna_title .yes_result {
	font-size: 15px;
	padding: 5px;
	background-color: rgb(253, 235, 235);
}
.qna_content {
	background-color: #F2F2F2;
}
.q_icon {
	padding: 20px;
}
.a_icon {
	padding: 20px;
}
.qna_content_q, .qna_content_a  {
	padding: 20px;
}
.qna_content_q input, .qna_content_a input {
	width: 40px;
	height: 20px;
	margin-top: 10px;
	font-family: 'Nanum Gothic';
	font-size: 13px;
}
.redate {
	font-size: 15px;
	margin-top: 7px;
}
.notices_paging {
	text-align: center;
	margin-top: 20px;
}


</style>
</head>
<body>
	<div id="wrap">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>내 문의내역</h3>
			</div>
		</div>
		<div class="container">
			<div id="nav">
				<ul>
					<li><a href="../member/memberModifyForm.do">내 정보 관리</a></li>
					<li><a href="../yangdo/yangdoList.do?my=1">이용내역</a></li>
					<li><a class="active" href="../qna/qnaListAndView.do?my=1">문의사항</a></li>
				</ul>
			</div>
			<div class="sub_title2">
				<h3>내 문의 내역</h3>
			</div>	
			<div id="content">
				<table width="800">
					<tr id="tr_1" height="50">
						<th width="90">문의유형</th>
						<th width="90">답변유무</th>
						<th>문의/답변</th>
						<th width="100">작성일</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<!-- 제목tr -->
						<tr class="qna_title" height="50">
							<td align="center">${dto.qna_type}</td>
							<td align="center">
								<c:if test="${dto.qna_result == 0}">
									<span class="no_result">미완료</span>
								</c:if>
								<c:if test="${dto.qna_result != 0}">
									<span class="yes_result">답변완료</span>
								</c:if> 
							</td>
							<td>
								<c:choose>
									<c:when test="${dto.qna_public == 1 and memId != dto.id}">
										<pre>  비밀글 입니다. <img alt="down" src="../resources/img/locker.png" width="12px" height="12px"></pre>
									</c:when>
									<c:otherwise>
										<pre>  ${dto.qna_subject}</pre>
									</c:otherwise>
								</c:choose> 
							</td>
							<td align="center">${dto.qna_logtime}</td>
						</tr>
						
						<!-- 질문tr -->
						<tr class="qna_content">
							<td>
								<img class="q_icon" alt="down" src="../resources/img/letter-q.png"
										width="50px" height="50px">
							</td>
							<td colspan="4">
								<div class="qna_content_q">
								<c:choose>
									<c:when test="${dto.qna_public == 1 and memId != dto.id}">
										<pre>  비밀글 입니다. <img alt="down" src="../resources/img/locker.png" width="12px" height="12px"></pre>
									</c:when>
									<c:otherwise>
										<pre>${dto.qna_content}</pre>
										<c:if test="${memId==dto.id}">
											<input type="button" value="수정" 
												onclick="location.href=' qnaModifyForm.do?qna_num=${dto.qna_num}&pg=${pg}'">
											<input type="button" value="삭제"
								 				onclick="location.href='qnaDelete.do?qna_num=${dto.qna_num}&pg=${pg}'">
										</c:if>
									</c:otherwise>
								</c:choose>
									
								</div>
							</td>
						</tr>
						
						<!-- 답변tr -->
						<tr class="qna_content">
							<td>
								<img class="a_icon" alt="down" src="../resources/img/letter-a.png"
										width="50px" height="50px">
							</td>
							<td colspan="4">
								<div class="qna_content_a">
								<c:choose>
									<c:when test="${dto.qna_public == 1 and memId != dto.id}">
										<pre>  비밀글 입니다. <img alt="down" src="../resources/img/locker.png" width="12px" height="12px"></pre>
									</c:when>
									<c:otherwise>
										<c:if test="${dto.qna_reply eq null}"><pre>답변 대기중</pre></c:if>
										<c:if test="${dto.qna_reply != null}">
											<pre>${dto.qna_reply}</pre>
											<p class="redate">답변일 : ${dto.qna_redate}</p>
										</c:if>
										<c:if test="${memGrade == 0}">
											<input type="button" value="답글"
								 				onclick="location.href='qnaReplyForm.do?qna_num=${dto.qna_num}&pg=${pg}'">
										</c:if>
									</c:otherwise>
								</c:choose>
									
								</div>
							</td>
						</tr>	
					</c:forEach>
				</table>
				<div class="notices_paging">
					<c:if test="${startPage > 5}">
						<a class="paging" href="qnaListAndView.do?pg=${startPage-1}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${pg == i}">
							<a class="currentPaging" href="qnaListAndView.do?pg=${i}">${i}</a>
						</c:if>
						<c:if test="${pg != i}">
							<a class="paging" href="qnaListAndView.do?pg=${i}">${i}</a>
						</c:if>
					</c:forEach>

					<c:if test="${endPage < totalP}">
						<a class="paging" href="qnaListAndView.do?pg=${endPage+1}">다음</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>