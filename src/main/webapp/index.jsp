<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: HOME</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<div id = wrap>
	<div id = header>
		<div id="title">
			<img alt="naver_logo" src="${context}/image/naver.png" width = 35 height = 35 onclick="location.href='${context}/index.do'">
			<h1>메인화면</h1>
		</div>
		<jsp:include page="./main/menu.jsp" />
	</div>
	<div id="container">
		<div id = nav>
			<div id="info">
				<jsp:include page="./main/nav.jsp" />
			</div>
		</div>
		<div id="section">
			<div id="content">
				<h3>
					저희 홈페이지를 방문해주셔서 감사합니다.
					Have a nice Day!
				</h3><br/>
				<img alt="리치1" src="./image/rich1.jpg" width="650px" height="300px">
			</div>
		</div>
	</div>
	<div id = footer>
		
	</div>
</div>
</body>
</html>