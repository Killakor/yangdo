<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css">
<style type="text/css">
table {
	font-size: 14px;
	border-collapse: collapse;
}
th {background: rgb(253, 235, 235)}
tr {border-bottom: 1px solid rgba(0, 0, 0, 0.08);}
td {
	font-family: 'Nanum Gothic';
	font-size: 13px;
}
.table_tr1 {border-bottom: 2px solid rgb(230, 28, 81);}
.table_tr2 {cursor: pointer;}
.table_tr2:hover{background: rgba(0, 0, 0, 0.02);}
.modify_tr {background: rgba(0, 0, 0, 0.05);}
.search_tr {background: rgba(0, 0, 0, 0.05);}
.modify_tr select, .search_select, .search_data {
	display: inline-block;
	border: 1px solid rgba(0, 0, 0, 0.08);
	margin-right: 10px;
	width: 120px; height: 30px;
}
.search_data {
	width: 400px;
	padding-left: 10px;
}
.modify_tr input, .search_btn {
	width: 70px; height: 30px;
	color: white;
	background: rgba(0, 0, 0, 0.26);
	border-radius: 6px; border: 0;
	font-size: 16px;
	cursor: pointer;
}
.grade_select, .grade_select > option {
	font-family: 'Nanum Gothic';
	font-size: 14px;
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function modifyData(grade) {
		var new_tr = $("<tr>");
		new_tr.addClass("modify_tr");
		
		var new_td1 = $("<td>", {align: "center", height: "50", colspan: "3"}).html("회원 등급 수정");
		var new_td2 = $("<td>", {colspan: "5"});
		
		var new_select = $("<select>");
		var new_option1 = $("<option>").html("일반회원");
		var new_option2 = $("<option>").html("정지회원");
		var new_option3 = $("<option>").html("관리자");
		
		if(grade == "일반회원") new_option1.attr("selected", "selected");
		else if(grade =="정지회원") new_option2.attr("selected", "selected");
		else new_option3.attr("selected", "selected");
		
		new_select.append(new_option1).append(new_option2).append(new_option3);
		new_select.addClass("grade_select");
		
		var modify_button = $("<input>", {"type":"button", "value": "수정"});
		modify_button.addClass("modify_btn");
		new_td2.append(new_select).append(modify_button);
		
		new_tr.append(new_td1).append(new_td2);
		$(".current_tr").after(new_tr);
	}
	
	$(function(){
		if(${grade} == -1) $("#nav li a").eq(0).addClass("active");
		else if(${grade} == 1) $("#nav li a").eq(1).addClass("active");
		else if(${grade} == 99) $("#nav li a").eq(2).addClass("active");
		else $("#nav li a").eq(3).addClass("active");
		
		$("#content").on("click", ".table_tr2", function() {
			$('.modify_tr').remove();
			var grade = $(this).children().eq(6).text();
			
			$(this).addClass("current_tr");
			modifyData(grade);
			$(this).removeClass("current_tr");
		});
		
		$("#memberList").on("click", ".modify_btn", function(){
			var current_tr = $(this).parent().parent();
			var index = $("#memberList tr").index(current_tr) - 1;
			var id = $("#memberList tr").eq(index).children().eq(0).text();
			var current_grade = $(".grade_select option:selected").val();
			
			if(confirm(current_grade + "(으)로 변경하시겠습니까?")) {
				$.ajax({
					url: "adminModify.do",
					type: "POST",
					data: {"id": id, "grade": current_grade},
					success: function(result){
						if(result == "success"){
							alert("변경 완료되었습니다.");
							location.reload();
						} else {
							alert("회원등급 변경에 실패했습니다.");
						}
					},
					error: function(xhr, textStatus, errorThrown){
						$("#result").html("[ERROR] "+xhr.status);
					}
				});
			}
		});
		
		$(".search_btn").click(function(){
			var category = $(".search_select option:selected").val();
			var data = $(".search_data").val();
			
			if(!data) {
				alert("검색어를 입력해주세요.");
				return false;
			}
		});
	
		$.ajax({
			url: "memberListJson.do",
			type: "POST",
			data: {"pg": "${pg}", "grade": "${grade}"},
			dataType: "json",
			success: function(json){		
				$.each(json.items, function(index, item){
					var addr = item.addr.replace("\n", "<br>");
					
					// 태그 생성
					var tr = $("<tr>", {align: "center"});
					var td1 = $("<td>", {height: "50"}).html(item.id);
					var td2 = $("<td>").html(item.name);
					var td3 = $("<td>").html(item.nickname);
					var td4 = $("<td>").html(item.email);
					var td5 = $("<td>").html(item.tel);
					var td6 = $("<td>").html(addr);
					var td7 = $("<td>").html(item.grade);
					var td8 = $("<td>").html(item.logtime);
				
					// 조립
					tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8);
					tr.addClass("table_tr2");
					// 출력
					$("#memberList").append(tr);
				});
			},
			error: function(xhr, textStatus, errorThrown){
				alert("[ERROR] " + xhr.status);
			}			
		});
	});
</script>
</head>
<body>
	<div id="memList">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>회원관리</h3>
			</div>
		</div>
		<div class="container">
			<div id="nav">
				<ul>
					<li><a href="memberList.do?pg=1&grade=-1">전체보기</a></li>
					<li><a href="memberList.do?pg=1&grade=1">일반회원</a></li>
					<li><a href="memberList.do?pg=1&grade=99">정지회원</a></li>
					<li><a href="memberList.do?pg=1&grade=0">관리자</a></li>
				</ul>
			</div>
			<div id="content">
				<table width="800">
					<tr class="table_tr1">
						<th width="70" height="40">아이디</th>
						<th width="70">이름</th>
						<th width="70">닉네임</th>
						<th width="120">이메일</th>
						<th width="120">전화번호</th>
						<th>주소</th>
						<th width="80">회원 등급</th>
						<th width="80">가입일</th>
					</tr>

					
					<!--  목록 출력 -->
					<tbody id="memberList">


					
					
					</tbody>


					
					<!-- 페이징 -->
					<tr>
						<td colspan="8" align="center" height="40">
							<c:if test="${startPage > 5 }">
								<a class="paging" href="memberList.do?pg=${startPage-1 }&grade=${grade}">&lt;&nbsp;</a>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
								<c:if test="${pg==i }">
									<a class="currentPaging" href="memberList.do?pg=${i}&grade=${grade}">${i}</a>
								</c:if>
								<c:if test="${pg!=i }">
									<a class="paging" href="memberList.do?pg=${i}&grade=${grade}">${i}</a>
								</c:if>
							</c:forEach>
							<c:if test="${endPage <totalP }">
								<a class="paging" href="memberList.do?pg=${endPage+1}&grade=${grade}">&nbsp;&gt;</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		
	</div>
</body>
</html>