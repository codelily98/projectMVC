<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="imageboard.bean.ImageBoardPaging"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: IMAGELIST</title>
<link rel="stylesheet" href="../css/imageboardList.css">
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
			<form id="checkForm">
			<div id="content">
				<table>
					<tr>
						<th width="75">
							<input type="checkbox" id="allcheck" class="checkbox" name="allcheck"/>
							<span id="num">번호</span>
						</th>
						<th width="150">이미지</th>
						<th width="100">상품명</th>
						<th width="150">단가</th>
						<th width="75">개수</th>
						<th width="150">합계</th>
					</tr>
					<c:if test="${not empty list}">
						<c:forEach var="imageboardDTO" items="${list}">
							<tr>
								<td align="center">
									<input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="${imageboardDTO.seq}"/>
									${imageboardDTO.imageid}
								</td>
								<td align="center"><a class="subjectA" href="#"><img width="100px" height="100px" src="../storage/${imageboardDTO.image1}" alt="${imageboardDTO.imagename}"></a></td>
								<td align="center">${imageboardDTO.imagecontent}</td>
								<td align="center">
									<fmt:formatNumber value="${imageboardDTO.imageprice}" pattern="#,###"/>원
								</td>
								<td align="center">
									<fmt:formatNumber value="${imageboardDTO.imageqty}" pattern="#,###"/>개
								</td>							
								<td align="center">
									<fmt:formatNumber value="${imageboardDTO.imageprice * imageboardDTO.imageqty}" pattern="#,###"/>원
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
			            <tr>
			                <td colspan="6" align="center">등록된 이미지가 없습니다.</td>
			            </tr>
			        </c:if>
				</table>
			</div>
			<div id="btnwrap">
				<input type="button" value="선택 삭제" id="deletebtn"/>
			</div>
			</form>
			<div id="appendA" style="text-align: center;">
			    <c:if test="${not empty pagingHTML}">
		            ${pagingHTML}
				</c:if>	
		    </div>		    
		</div>
	</div>
	<div id = footer>
		<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
		<input type="hidden" id="Sid" name="Sid" value="${memId}">
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/imageboardList.js"></script>
</body>
</html>