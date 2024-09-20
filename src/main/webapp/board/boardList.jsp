<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.bean.BoardPaging"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: LIST</title>
<link rel="stylesheet" href="../css/boardList.css">
</head>
<body>
<div id="wrap">
	<div id = header>
		<div id="title">
			<img alt="naver_logo" src="../image/naver.png" width = 35 height = 35 onclick="location.href='../index.do'">
			<h1>글 목록</h1>
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
			<div id="content">
				<table>
					<tr>
						<th width="100">글번호</th>
						<th width="400">제목</th>
						<th width="150">작성자</th>
						<th width="150">작성일</th>
						<th width="100">조회수</th>
					</tr>
					
					<c:if test="${list != null}">
						<c:forEach var="boardDTO" items="${list}">
							<tr>
								<td align="center"><span id="seq">${boardDTO.seq}</span></td>
								<td align="center"><a class="subjectA" href="./boardView.do?seq=${boardDTO.seq}">${boardDTO.subject}</a></td>
								<td align="center">${boardDTO.id}</td>
								<td align="center">
									<fmt:parseDate value="${boardDTO.logtime}" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss" />
    								<fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd HH:mm:ss" />
								</td>
								<td align="center">${boardDTO.hit}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div id="appendA" style="text-align: center; margin-top: 15px;">
		        <c:if test="${not empty pagingHTML}">
		            ${pagingHTML}
		        </c:if>
		    </div>	
		</div>
	</div>
	<div id = footer>
		
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
function boardPaging(pg){
	location.href = "boardList.do?pg=" + pg;
}
</script>	
</body>
</html>