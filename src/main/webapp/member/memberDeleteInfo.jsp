<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/memCommon.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#deleteForm").submit(function(){
			if (!$("input[name='agreeChkbox']").is(":checked")) {
				alert("체크박스에 체크해주세요.");
				return false;
			}
		});
		
		$("input[name='agreeChkbox']").click(function(){
			if($(this).is(":checked")){
				$("input[type='submit']").removeClass("memButton4");
				$("input[type='submit']").addClass("memButton3");
			} else {
				$("input[type='submit']").removeClass("memButton3");
				$("input[type='submit']").addClass("memButton4");
			}
		})
	})
</script>
<style type="text/css">
p, span {font-family: 'Nanum Gothic'; font-size: 13px;}
.sub_title2 {margin-bottom: 10px;}
#container p, form {
	margin: 20px 0;
}
.info_p1 {
	border-bottom: 1px solid rgba(0, 0, 0, 0.08);
	padding-bottom: 20px;
	font-size: 16px;
}
.info_p2 {
	font-weight: bold;
}
.info_p3 {
	margin: 15px;
	padding-left: 20px;
}
.mark {
	color: rgb(255, 0, 85);
	font-weight: bold;
}
.memButton3, .memButton4 {
	display: inline-block;
	width: 150px; height: 48px;
	margin: 8px 0 16px 0; padding: 0;
	font-size: 16px;
	font-weight: bold;
}
.userId {
	color:blue;
	font-weight: bold;
}
.chkbox > span{font-weight: bold;}
#deleteAgree {
	border-top: 1px solid rgba(0, 0, 0, 0.08);
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="sub_wrap">
			<div class="sub_title">
				<h3>회원 탈퇴</h3>
			</div>
		</div>
		<div class="container">
			<div class="sub_title2">
				<h3>탈퇴 안내</h3>
			</div>
			<div id='info'>
				<p class="info_p1">
					회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
				</p>
				<p class="info_p2">
					<span class="mark">&#33;&nbsp;</span>사용하고 계신 아이디(<span class="userId">${memId }</span>)는 탈퇴할 경우 복구가 불가능합니다.
				</p>
				<p class="info_p2">
					<span class="mark">&#33;&nbsp;</span>탈퇴 후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.
				</p>	
				<p class="info_p3">
					회원정보 및 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
					삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
				</p>
				
				<p class="info_p2">
					<span class="mark">&#33;&nbsp;</span>탈퇴 후에도 서비스에 등록한 게시물은 그대로 남아 있습니다.
				</p>	
				<p class="info_p3">
						게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아있습니다.<br>
						삭제를 원하는 게시글이 있다면 <span class="mark">반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span><br>
						탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
				</p>
				
			</div>
			<form action="memberDelete.do" id="deleteForm" method="post">
				<div id="deleteAgree">
					<p class="mark">
						탈퇴 후에는 아이디 <span class="userId">${memId }</span>의 데이터는 복구할 수 없습니다.
						게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
					</p>
					<p>
						<input type="checkbox" name="agreeChkbox"><span class="chkbox">&nbsp;안내 사항을 모두 확인하였으며, 이에 동의합니다.</span>
					</p>
				</div>
				<input type="submit" class="memButton4" value="확인">
				<input type="button" class="memButton4" value="돌아가기" onclick="history.back()">
			</form>
		</div>
	</div>
</body>
</html>