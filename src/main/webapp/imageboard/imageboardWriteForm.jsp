<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: IMAGE</title>
<link rel="stylesheet" href="../css/imageboardWriteForm.css">
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<div id="wrap">
	<div id = header>
		<div id="title">
			<img alt="naver_logo" src="${context}/image/naver.png" width = 35 height = 35 onclick="location.href='${context}/index.do'">
			<h1>이미지 등록</h1>
		</div>
		<jsp:include page="../main/menu.jsp" />
	</div>
	<div id="container">
		<div id = nav>
			<div id="info">
				<jsp:include page="../main/nav.jsp" />
			</div>
		</div>
		<div id="section">
			<div id="formwrap">
				<form id="imageboardWriteForm" method="post" enctype="multipart/form-data" action="/projectMVC/imageboard/imageboardWriteAjax.do">
				<!-- enctype="application/x-www-form-urlencoded" -->
					<table>
						<tr>
				        	<th width="100">상품코드</th>
					        <td>
					            <input type="text" id="imageid" name="imageid" size="50" placeholder="상품 코드">
					            <div class="check"></div>
					        </td>
				    	</tr>
				    	<tr>
					        <th>상품명</th>
					        <td>
					            <input type="text" id="imagename" name="imagename" size="50" placeholder="상품명">
					            <div class="check"></div>
					        </td>
					    </tr>
					    <tr>
					        <th>단가</th>
					        <td>
					            <input type="text" id="imageprice" name="imageprice" size="50" placeholder="단가">
					            <div class="check"></div>
					        </td>
					    </tr>
					    <tr>
					        <th>개수</th>
					        <td>
					            <input type="text" id="imageqty" name="imageqty" size="50" placeholder="상품 코드">
					            <div class="check"></div>
					        </td>
					    </tr>
					    <tr>
					        <th>내용</th>
					        <td>
					            <textarea id="imagecontent" name="imagecontent" size="50" placeholder="상품명"></textarea>
					            <div class="check"></div>
					        </td>
					    </tr>
					    <tr>
					    	<th width="100" id="lastTh"></th>
					        <td align="left">
					        	<label for="image1" class="fileBtn">파일 선택</label><span id="selectedFile"></span>
					        	<br/>
					        	<img id="showImg" width="150px" height="150px">
					            <input type="file" id="image1" name="image1">
					        </td>
					    </tr>
					    <tr>
					        <td colspan="2" align="center">
					            <input type="button" value="이미지등록" id="imageboardWriteBtn">
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
<script type="text/javascript" src="../js/imageboardWriteForm.js"></script>
</body>
</html>
<!-- 
FileReader 란?
FileReader는 type이 file인 input 태그 또는 API 요청과 같은 인터페이스를 통해 
File 또는 Blob 객체를 편리하게 처리할수있는 방법을 제공하는 객체이며
abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 주로 사용되며,
File 또는 Blob 객체를 읽어서 result 속성에 저장한다.

FileReader도 비동기로 동작한다.

FileReader.onload()
load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 때마다 발생한다.

processData
 
기본값은 true
기본적으로 Query String으로 변환해서 보내진다('변수=값&변수=값')
파일 전송시에는 반드시 false로 해야 한다.(formData를 문자열로 변환하지 않는다)

contentType
  
기본적으로 "application/x-www-form-urlencoded; charset=UTF-8"
파일 전송시에는 'multipart/form-data'로 전송이 될 수 있도록 false로 설정한다
 -->