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
	font-size: 16px;
	font-family: 'Nanum Gothic';
}
.sub_title2 {
	border-bottom: solid 3px #E6E6E6;
	width: 800px;
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
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".qna_content").hide();
		$(".qna_title").click(function(){
			$(this).nextUntil(".qna_title").toggle();
		});
	}); 
	
</script>
</head>
<body>
	<div id="qnaListAndView">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>더보기</h3>
			</div>
		</div>
		
		<div class="container">
			<div id="nav">
				<ul class="nav_list">
					<li><a href="../notice/noticeListAndView.do">공지사항</a></li>
					<li><a href="../event/eventList.do">이벤트</a></li>
					<li><a href="../faq/faqListAndView.do">자주 묻는 질문</a></li>
					<li><a class="active" href="../qna/qnaListAndView.do">QNA</a></li>
				</ul>
			</div>
			
			<div id="content">
				<div class="sub_title2">
					<a id="a_list" href="../qna/qnaListAndView.do">QnA 게시판</a>
					<c:if test="${memGrade < 10}">
						<a id="a_write" href="../qna/qnaWriteForm.do">새 문의 작성</a>
					</c:if>
				</div>
				
				<div class="tab_each">
					<table width="800">
						<tr id="tr_1" height="50">
							<th width="90">문의유형</th>
							<th width="90">답변유무</th>
							<th width="420">문의/답변</th>
							<th width="100">작성자</th>
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
										<c:when test="${dto.qna_public == 1}">
											<c:if test="${memGrade == 0 or memId == dto.id}">
												<pre>  ${dto.qna_subject}</pre>
											</c:if>
											<c:if test="${(memId != dto.id and memGrade > 0) or memId ==  null}">
												<pre>  비밀글 입니다. <img alt="down" src="../resources/img/locker.png" width="12px" height="12px"></pre>
											</c:if>
										</c:when>
										<c:otherwise>
											<pre>  ${dto.qna_subject}</pre>
										</c:otherwise>
									</c:choose>
								</td>
								<td align="center">${dto.id}</td>
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
											<c:when test="${dto.qna_public == 1}">
												<c:if test="${memGrade == 0 or memId == dto.id}">
													<pre>${dto.qna_content}</pre>
												</c:if>
												
												<c:if test="${(memId != dto.id and memGrade > 0) or memId ==  null}">
													<pre>  비밀글 입니다. <img alt="down" src="../resources/img/locker.png" width="12px" height="12px"></pre>
												</c:if>
											</c:when>
											<c:otherwise>
												<pre>${dto.qna_content}</pre>
											</c:otherwise>							
										</c:choose>
										<c:if test="${memId==dto.id}">
											<input type="button" value="수정" 
												onclick="location.href=' qnaModifyForm.do?qna_num=${dto.qna_num}&pg=${pg}'">
											<input type="button" value="삭제"
								 				onclick="location.href='qnaDelete.do?qna_num=${dto.qna_num}&pg=${pg}'">
										</c:if> 
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
											<c:when test="${dto.qna_public == 1}">
												<c:if test="${memGrade == 0 or memId == dto.id}">
													<c:if test="${dto.qna_reply eq null}"><pre>답변 대기중</pre></c:if>
													<c:if test="${dto.qna_reply != null}">
														<pre>${dto.qna_reply}</pre>
														<pre class="redate">답변일 : ${dto.qna_redate}</pre>
													</c:if>
												</c:if>
												
												<c:if test="${(memId != dto.id and memGrade > 0) or memId ==  null}">
													<pre>  비밀글 입니다. <img alt="down" src="../resources/img/locker.png" width="12px" height="12px"></pre>
												</c:if>
											</c:when>
											
											<c:otherwise>
												<c:if test="${dto.qna_reply eq null}"><pre>답변 대기중</pre></c:if>
												<c:if test="${dto.qna_reply != null}">
													<pre>${dto.qna_reply}</pre>
													<pre class="redate">답변일 : ${dto.qna_redate}</pre>
												</c:if>
											</c:otherwise>
										</c:choose>
										
										<c:if test="${memGrade == 0}">
											<input type="button" value="답글"
									 			onclick="location.href='qnaReplyForm.do?qna_num=${dto.qna_num}&pg=${pg}'">
										</c:if>
									</div>
								</td>
							</tr>	
						</c:forEach>
					</table>
					
					<div class="notices_paging">
						<c:if test="${startPage > 5}">
							<a class="paging" href="qnaListAndView.do?pg=${startPage-1}">&#60;</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<c:if test="${pg == i}">
								<a class="currentPaging" href="qnaListAndView.do?pg=${i}">${i}</a>
							</c:if>
							<c:if test="${pg != i}">
								<a class="paging" href="qnaListAndView.do?pg=${i}">${i}</a>
							</c:if>
						</c:forEach>

						<c:if test="${endPage < totalPage}">
							<a class="paging" href="qnaListAndView.do?pg=${endPage+1}">&#62;</a>
						</c:if>
					</div>
				</div>
				
			</div>	
		</div>
	</div>
</body>
</html>