<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: WRITE</title>
<link rel="stylesheet" href="../css/boardWriteForm.css">
</head>
<body>
<div id="wrap">
	<div id = header>
		<div id="title">
			<img alt="naver_logo" src="${pageContext.request.contextPath}/image/naver.png" width = 35 height = 35 onclick="location.href='../index.do'">
			<h1>글 작성</h1>
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
				<form id="boardWriteForm">
					<table>
						<tr>
				        	<th width="100">제목</th>
					        <td>
					            <input type="text" id="subject" name="subject" size="50" placeholder="제목 입력">
					            <div id="subjectDiv"></div>
					        </td>
				    	</tr>
				    	<tr>
					        <th>내용</th>
					        <td>
					            <textarea id="content" name="content" rows="15" cols="50" placeholder="내용 입력"></textarea>
					            <div id="contentDiv"></div>
					        </td>
					    </tr>
					    <tr>
					        <td colspan="2" align="center">
					            <input type="button" value="글쓰기" id="boardWriteBtn">
					            <input type="reset" value="다시작성" id="resetBtn">
					        </td>
					    </tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id = footer>
		
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardWrite.js"></script>
</body>
</html>