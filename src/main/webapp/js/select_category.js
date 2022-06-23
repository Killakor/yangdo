	$(function() {
		// 1 depth 읽기
		$("#region_category1").load("../ajax/text/category-data1.html #category1-1",function() {
			$(this).show();
				});
		// 이벤트 설정 : 1depth
		$(document).on("change", "#region_category1 > select", function() {
			// 1depth가 변경되었으므로, 2depth, 3depth는 초기화
			$("#region_category2").empty().hide();

			// 선택된 항목이 지시하는 하위 카테고리 페이지의 url얻기
			var target = $(this).find("option:selected").attr("data-target");
			var selector = "../ajax/text/category-data1.html " + target;

			// 다음 항목 로드
			$("#region_category2").load(selector, function() {
				$(this).show();
			});
		});

		// 이벤트 설정 : 2depth
		$(document).on("change", "#region_category2 > select", function() {
			
			// 선택된 항목이 지시하는 하위 카테고리 페이지의 url얻기
			var target = $(this).find("option:selected").attr("data-target");
			var selector = "../ajax/text/category-data1.html " + target;
			
			// 선택한 항목이 존재한다면?
			var data1 = $("#region_category1 > select > option:selected").val();
			var data2 = $("#region_category2 > select > option:selected").val();
			var slash = " ";
			// 출력
			document.getElementById("region_select").value = data1 + slash + data2
		});
	});
	
	$(function() {
		// 1 depth 읽기
		$("#spot_category1").load("../ajax/text/category-data2.html #category1-1",function() {
			$(this).show();
				});
		// 이벤트 설정 : 1depth
		$(document).on("change", "#spot_category1 > select", function() {
			// 1depth가 변경되었으므로, 2depth, 3depth는 초기화
			$("#spot_category2").empty().hide();

			// 선택된 항목이 지시하는 하위 카테고리 페이지의 url얻기
			var target = $(this).find("option:selected").attr("data-target");
			var selector = "../ajax/text/category-data2.html " + target;

			// 다음 항목 로드
			$("#spot_category2").load(selector, function() {
				$(this).show();
			});
		});

		// 이벤트 설정 : 2depth
		$(document).on("change", "#spot_category2 > select", function() {
			
			// 선택된 항목이 지시하는 하위 카테고리 페이지의 url얻기
			var target = $(this).find("option:selected").attr("data-target");
			var selector = "../ajax/text/category-data2.html " + target;
			
			// 선택한 항목이 존재한다면?
			var data1 = $("#spot_category1 > select > option:selected").val();
			var data2 = $("#spot_category2 > select > option:selected").val();
			var slash = " > ";
			// 출력
			document.getElementById("kind_select").value = data1 + slash + data2
		});
	});