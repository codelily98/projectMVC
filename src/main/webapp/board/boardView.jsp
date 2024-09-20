<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: VIEW</title>
<link rel="stylesheet" href="../css/boardView.css">
</head>
<body>
<div id="wrap">
	<div id = header>
		<div id="title">
			<img alt="naver_logo" src="${pageContext.request.contextPath}/image/naver.png" width = 35 height = 35 onclick="location.href='../index.do'">
			<h1>글 보기</h1>
		</div>
	<jsp:include page = "../main/menu.jsp" />
	</div>
	
	<div id = container>
		<div id = nav>
			<div id="info">
				<jsp:include page="../main/nav.jsp" />
			</div>
		</div>
		<div id = section>
			<div id="formwrap">
				<table>
					<tr>
			        	<th class="content1">제목</th>
				        <td colspan="3" class="content1">${list[0].subject}</td>
				        <th class="content1">작성일</th>
				        <td colspan="2" width="20.0%" class="content1">
				        	<fmt:parseDate value="${list[0].logtime}" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss" />
    						<fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd HH:mm:ss" />
				        </td>
			    	</tr>
			    	<tr>
			        	<th class="content2" width="16.6%">글번호</th>
				        <td class="content2">${list[0].seq}</td>
				        <th class="content2" width="16.6%">작성자</th>
				        <td class="content2">${list[0].id}</td>
				        <th class="content2" width="16.6%">조회수</th>
				        <td class="content2">${list[0].hit}</td>
			    	</tr>
			    	<tr>
				        <th class="content3">내용</th>
				        <td colspan="5" class="content3" id="contentStyle">${list[0].content}</td>
				    </tr>
				    <tr>
				    	<c:if test="${list[0].id != memId}">
				        <td colspan="6" align="center">
				            <input type="button" value="목록" id="listBtn">
				        </td>
				        </c:if>
				        <c:if test="${list[0].id == memId}">
				        <td colspan="6" align="center">
				            <input type="button" value="수정" id="update-link">
				            <input type="button" value="삭제" id="deleteBtn">
				            <input type="button" value="목록" id="listBtn">
				            <input type="hidden" id="seq" name="seq" value="${list[0].seq}">
				        </td>
				        </c:if>
				    </tr>
				</table>
			</div>
		</div>
	</div>
	<div id = footer>
		
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(document).on("click", '#listBtn', function(){
		location.href="/projectMVC/board/boardList.do?pg=1"
	});
	
	$(document).on('click', '#deleteBtn', function(){
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
					location.href="/projectMVC/board/boardList.do?pg=1"
				} else {
					alert("글 삭제에 실패했습니다.");
					location.reload(true);
				}
			},
			error: function(e){
				console.log(e);
			}
		});
	});
	
	// 로그인 링크 클릭 시 #loginbtn1 버튼 클릭 이벤트 트리거
    $("#update-link").click(function(e) {
        e.preventDefault(); // 기본 링크 동작 방지
        $("#updateBtn").click(); // #loginbtn1 클릭 이벤트 발생
    });
			
	// 수정 버튼 클릭 시 formwrap 숨기고 updateForm 추가
	$("#update-link").click(function(e) {
		e.preventDefault(); // 기본 링크 동작 방지
		$("#formwrap").hide(); // formwrap 숨기기

		// 기존에 #updateForm이 없으면 새롭게 추가
		if ($("#updateForm").length === 0) {
			$("#section").append(`
				<form id="updateForm">
					<div id="updateform">
						<table>
							<tr>
								<th class="content1">제목</th>
								<td colspan="3" class="content1"><input type="text" name="subject" value="${list[0].subject}"></td>
								<th class="content1">작성일</th>
								<td colspan="2" class="content1">
									<fmt:parseDate value="${list[0].logtime}" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd HH:mm:ss" />
								</td>
							</tr>
							<tr>
								<th class="content2" width="16.6%">글번호</th>
								<td class="content2">${list[0].seq}</td>
								<th class="content2" width="16.6%">작성자</th>
								<td class="content2">${list[0].id}</td>
								<th class="content2" width="16.6%">조회수</th>
								<td class="content2">${list[0].hit}</td>
							</tr>
							<tr>
								<th class="content3">내용</th>
								<td colspan="5" class="content3"><textarea name="content">${list[0].content}</textarea></td>
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

	// 취소 버튼 클릭 시 폼을 제거하고 기존 요소를 다시 보이기
	$(document).on("click", "#cancelBtn", function(){
		$("#updateForm").remove();  // updateForm 폼 삭제
		$("#formwrap").show();      // 기존 formwrap 다시 보이기
	});
});
</script>
</body>
</html>