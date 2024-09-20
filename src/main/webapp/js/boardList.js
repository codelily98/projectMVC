function boardPaging(pg) {
    location.href = "boardList.do?pg=" + pg;
}

// 조회수 증가 및 글 보기 페이지로 이동
$(document).on("click", ".subjectA", function(e) {
    e.preventDefault(); // 기본 링크 동작 방지
    let seq = $(this).closest('tr').find('#seq').text(); // 현재 글번호 가져오기
    let currentPage = $("input[name='currentPage']").val(); // 원래의 href

    // AJAX로 조회수 증가 요청
    $.ajax({
        type: 'post',
        url: '/projectMVC/board/boardHit.do', // 조회수 증가를 처리하는 URL
        data: {'seq': seq},
        dataType: 'text',
        success: function(data) {
            if (data.trim() == 'true') {
                // 조회수 증가 성공 시 원래 URL로 이동
                location.href="./boardView.do?pg="+currentPage+"&seq="+seq;
            } else {
                alert("조회수 증가에 실패했습니다.");
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
});
