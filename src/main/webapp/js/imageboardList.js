function imageboardPaging(pg) {
    location.href = "imageboardList.do?pg=" + pg;
}

$(function(){
	$("input[name='allcheck']").on('change', function(){
		let allcheck = $("#allcheck").is(":checked");
		
		$("input[name='checkbox']").prop('checked', allcheck);	
	});
	
	$("input[name='checkbox']").on('click', function(){
		let checkVal = $("input[name='checkbox']:checked").length;
		let totalCheck = $("input[name='checkbox']").length;
		if(checkVal == totalCheck) {
			$("input[name='allcheck']").prop('checked', true);
		} else {
			$("input[name='allcheck']").prop('checked', false);
		}
	});
	
	$("#deletebtn").on('click', function(){
        let selectedValues = [];
		
        $('input[name="checkbox"]:checked').each(function() {
            selectedValues.push($(this).val());
        });

        if (selectedValues.length === 0) {
            alert('삭제할 항목을 선택하세요.');
            return;
        }
		
		$.ajax({
			type: 'post',
			url: '/projectMVC/imageboard/imageboardDelete.do',
			data: {
                'selectedValues': selectedValues
            },
            traditional: true,
			success: function(data) {
				alert('선택된 항목이 삭제되었습니다.');
                location.reload();
			},
			error: function(e) {
				console.log(e);
				location.reload();
			}
		});
	});
});