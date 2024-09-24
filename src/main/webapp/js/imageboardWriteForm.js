function readURL(input) {
	let reader = new FileReader();

	reader.onload = function(e) {
		$("#showImg").attr("src", e.target.result); //e.target - 이벤트가 발생하는 요소를 반환해준다.
	}
		
	reader.readAsDataURL(input.files[0]);
}

$(document).ready(function(){
	$("#showImg").hide();
	$("#selectedFile").text("선택된 파일 없음");
	
	$("#image1").on('change', function(){
		let selectedFile = $(this)[0].files[0];
				
		if(selectedFile) {
			$("#selectedFile").text(selectedFile.name);
			readURL(this);
			$("#showImg").show();
		} else {
			$("#selectedFile").text("선택된 파일 없음");
			$("#showImg").hide();
		}
	});
});

/*
$(function(){
	$("#imageboardWriteBtn").on("click", function(){
		$("#imageboardWriteForm").submit();
	})
});
*/

$("#imageboardWriteBtn").click(function(){
	let formData = new FormData($("#imageboardWriteForm")[0]);
	
	$.ajax({
		type: 'post',
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		url: "/projectMVC/imageboard/imageboardWriteAjax.do",
		data: formData,
		success: function(data){
			alert("이미지 등록완료");
			location.href="/projectMVC/imageboard/imageboardList.do?pg=1";
		},
		error: function(e){
			console.log(e);
		}
	});
});