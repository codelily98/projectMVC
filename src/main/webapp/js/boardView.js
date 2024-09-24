$(function(){
    // 목록 버튼 클릭 시 목록 페이지로 이동
    $(document).on("click", '#listBtn', function(){
        let pg = $("#pg").val();	
        location.href = "/projectMVC/board/boardList.do?pg=" + pg;
    });

    
    // 삭제 버튼 클릭 시 AJAX로 글 삭제
    $(document).on('click', '#deleteBtn', function(){
		let pg = $("#pg").val();
		let pwd = $("#pwd").val();
		console.log(pwd);
		let chpwd = prompt("비밀번호를 입력해주세요");
		console.log(chpwd);
		
		if(pwd == chpwd) {
	        $.ajax({
	            type: 'post',
	            url: '/projectMVC/board/boardDelete.do',
	            data: {'seq': $("#seq").val()},
	            dataType: 'text',
	            success: function(data){
	                let result = data.trim();
	                console.log(result);
	                
	                if(result == 'true') {
	                    alert("글 삭제에 성공했습니다.");
						location.href = "/projectMVC/board/boardList.do?pg=1";                    
	                } else {
	                    alert("글 삭제에 실패했습니다.");
	                    location.reload(true);
	                }
	            },
	            error: function(e){
	                console.log(e);
	            }
	        });
		} else {
			$(".check").html("비밀번호를 확인해주세요");
		}
    });

    // 수정 버튼 클릭 시 formwrap 숨기고 updateForm 추가
    $("#update-link").click(function(e) {
        e.preventDefault(); // 기본 링크 동작 방지
        $("#formwrap").hide(); // formwrap 숨기기

        // 기존에 #updateForm이 없으면 새롭게 추가
        if ($("#updateForm").length === 0) {
            // 서버에서 필요한 데이터를 미리 자바스크립트 변수로 전달
            let subject = $("#subject").val();  // 서버에서 미리 subject 값을 설정해야 함
            let logtime = $("#logtime").val();  // 마찬가지로 서버에서 설정된 logtime 값
            let seq = $("#seq").val();
            let id = $("#id").val();
            let hit = $("#hit").val();
            let content = $("#content").val();

            $("#section").append(`
                <form id="updateForm">
                    <div id="updateform">
                        <table>
                            <tr>
                                <th class="content1">제목</th>
                                <td colspan="3" class="content1">
									<input type="text" name="resubject" value="${subject}">
								</td>
                                <th class="content1">작성일</th>
                                <td colspan="2" class="content1">${logtime}</td>
                            </tr>
                            <tr>
                                <th class="content2" width="16.6%">작성번호</th>
                                <td class="content2">${seq}</td>
                                <th class="content2" width="16.6%">작성자</th>
                                <td class="content2">${id}</td>
                                <th class="content2" width="16.6%">조회수</th>
                                <td class="content2">${hit}</td>
                            </tr>
                            <tr>
                                <th class="content3">내용</th>
                                <td colspan="5" class="content3">
									<textarea name="content">${content}</textarea>
									<div class="check"></div>
								</td>
                            </tr>
                            <tr>
                                <td colspan="6" align="center">
                                    <input type="submit" value="저장" id="saveBtn">
                                    <input type="button" value="취소" id="cancelBtn">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            `);
        }
    });
	// 저장 버튼 클릭 시 AJAX로 업데이트 처리
	$(document).on('submit', '#updateForm', function(e) {
		e.preventDefault(); // 폼의 기본 제출 동작 방지
		
		let chsubject = $("input[name='resubject']").val();
		let chcontent = $("textarea[name=content]").val();
		
		if(chsubject !== '' && chcontent !== '') {
			$.ajax({
				type: 'post',
				url: '/projectMVC/board/boardUpdate.do',
				data: {
					'subject': $("input[name=resubject]").val(),
					'content': $("textarea[name=content]").val(),
					'seq': $("#seq").val() // 게시물 번호
				},
				dataType: 'text',
				success: function(data){
					let result = data.trim();
					if(result == 'true') {
						alert("글 수정에 성공했습니다.");
						location.href = "/projectMVC/board/boardList.do?pg=1"; // 성공 시 목록으로 이동
					} else {
						alert("글 수정에 실패했습니다.");
					}
				},
				error: function(e){
					console.log(e);
				}
			});
		} else {
			$(".check").html("제목 또는 내용을 입력하세요.");
		}
	});

    // 취소 버튼 클릭 시 폼을 제거하고 기존 요소를 다시 보이기
    $(document).on("click", "#cancelBtn", function(){
        $("#updateForm").remove();  // updateForm 폼 삭제
        $("#formwrap").show();      // 기존 formwrap 다시 보이기
    });
});
