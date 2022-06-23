$(function(){
	//alert("test");
	var idCheck = false;
	var nicknameCheck = false;
	
	// submit 버튼 클릭 시 입력 검사
	$("#yangdoWriteForm").submit(function(){
		// 시작일 입력검사
		if(!$("input[name='res_start_date']").val()) {
			alert("시작일을 입력해주세요.");
			$("input[name='res_start_date']").focus();
			
			return false;
		}
		// 종료일 입력검사
		if(!$("input[name='res_end_date']").val()) {
			alert("종료일을 입력해주세요.");
			$("input[name='res_end_date']").focus();
			
			return false;
		}
		// 지역 입력검사
		if(!$("input[name='res_region']").val()) {
			alert("지역을 선택해주세요.");
			$("span[id='region_category1']").focus();
			
			return false;
		}
		// 양도 종류 입력검사
		if(!$("input[name='yangdo_kind']").val()) {
			alert("지역을 선택해주세요.");
			$("span[id='spot_category1']").focus();
			
			return false;
		}
		// 예약장소 입력검사
		if(!$("input[name='res_spot']").val()) {
			alert("예약 장소를 입력해주세요.");
			$("input[name='res_spot']").focus();
			
			return false;
		}
		// 예약 정보 입력검사
		if(!$("input[name='res_seat']").val()) {
			alert("예약 정보를 입력해주세요.");
			$("input[name='res_seat']").focus();
			
			return false;
		}
		// 예약 금액 입력검사
		if(!$("input[name='res_price']").val()) {
			alert("예약 금액을 입력해주세요.");
			$("input[name='res_price']").focus();
			
			return false;
		}
		// 총 이용금액 입력검사
		if(!$("input[name='res_total']").val()) {
			alert("총 이용금액을 입력해주세요.");
			$("input[name='res_total']").focus();
			
			return false;
		}
		// 예약 금액 입력검사
		if(!$("input[name='res_price']").val()) {
			alert("예약 금액을 입력해주세요.");
			$("input[name='res_price']").focus();
			
			return false;
		}
		// 총 이용 금액 입력검사
		if(!$("input[name='res_total']").val()) {
			alert("지역을 선택해주세요.");
			$("span[id='spot_category1']").focus();
			
			return false;
		}
		// 양도 마감일 입력검사
		if(!$("input[name='yangdo_due_date']").val()) {
			alert("양도 마감일을 입력해주세요.");
			$("input[name='yangdo_due_date']").focus();
			
			return false;
		}
		// 양도가 입력검사
		if(!$("input[name='yangdo_price']").val()) {
			alert("양도가를 입력해주세요.");
			$("input[name='yangdo_price']").focus();
			
			return false;
		}
		
		// 양도 사유 입력검사
		if(!$("input[name='yangdo_reason']").val()) {
			alert("양도 사유를 입력해주세요.");
			$("input[name='yangdo_reason']").focus();
			
			return false;
		}
		// 예약 수 입력검사
		if(!$("input[name='yangdo_res_count']").val()) {
			alert("예약 한 건수를 입력해주세요.");
			$("input[name='yangdo_res_count']").focus();
			
			return false;
		}
		// 예약 인원 입력검사
		if(!$("input[name='yangdo_people']").val()) {
			alert("양도 마감일을 입력해주세요.");
			$("input[name='yangdo_people']").focus();
			
			return false;
		}
	});
	
	$("input[name='yangdo_price']").blur(function(){
		var yangdo_price = Number($("input[name='yangdo_price']").val());
		var yangdo_fee = yangdo_price * 0.05;
		var yangdo_total_price = yangdo_price - yangdo_fee;
		
		$("input[name='yangdo_fee']").val(yangdo_fee);
		$("input[name='yangdo_total_price']").val(yangdo_total_price);
	});
	
});

	