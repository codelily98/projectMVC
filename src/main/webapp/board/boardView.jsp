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
				        	<fmt:parseDate value="${list[0].logtime}" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss"/>
    						<fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd HH:mm:ss"/>
				        </td>
			    	</tr>
			    	<tr>
			        	<th class="content2" width="16.6%">작성번호</th>
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
				    	<th></th>
				    	<td colspan="5">
				    		<div class="check"></div>
				    	</td>
				    </tr>
				    <tr>
				    	<c:if test="${list[0].id != memId}">
				        <td colspan="6" align="center">
				            <input type="button" value="목록" id="listBtn">
				            <input type="hidden" id="pg" name="pg" value="${pg}">
				        </td>
				        </c:if>
				        <c:if test="${list[0].id == memId}">
				        <td colspan="6" align="center">
				            <input type="button" value="수정" id="update-link">
				            <input type="button" value="삭제" id="deleteBtn">
				            <input type="button" value="목록" id="listBtn">
				            <input type="hidden" id="pg" name="pg" value="${pg}">
				            <input type="hidden" id="subject" name="subject" value="${list[0].subject}">
				            <input type="hidden" id="logtime" name="logtime" value="<fmt:formatDate value='${parsedDate}' pattern='yy.MM.dd HH:mm:ss'/>">
				            <input type="hidden" id="seq" name="seq" value="${list[0].seq}">
				            <input type="hidden" id="id" name="id" value="${list[0].id}">
				            <input type="hidden" id="hit" name="hit" value="${list[0].hit}">
				            <input type="hidden" id="content" name="content" value="${list[0].content}">
				        </td>
				        </c:if>
				    </tr>
				</table>
			</div>
		</div>
	</div>
	<div id = footer>
		<input type="hidden" value="${memPwd}" id="pwd" name="pwd">
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
</body>
</html>