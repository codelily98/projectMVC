<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: UPDATE</title>
<link rel="stylesheet" href="../css/updateForm.css">
</head>
<body>
<div id="wrap">
<h1>
	<img alt="naver_logo" src="../image/naver.png" width = 50 height = 50 style="cursor: pointer;" onclick="location.href='../index.do'">
</h1>
<span>회원정보수정</span>
<form name="updateForm">
	<table border="1">
		<tr>
	        <th width="100">이름</th>
	        <td>
	        	<input type="text" name="name" id="name" value="${list[0].name }"/>
	        	<div id="nameDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>아이디</th>
	        <td>
	        	<input type="text" name="id" id="id" size="30" value="${list[0].id }" readonly>     
	        </td>
	    </tr>
	    
	    <tr>
	        <th>비밀번호</th>
	        <td>
	        	<input type="password" name="pwd" id="pwd" size="40" placeholder="비밀번호 입력">
	        	<div id="pwdDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>재확인</th>
	        <td>
	        	<input type="password" id="repwd" size="40" placeholder="비밀번호 입력">
	        </td>
	    </tr>
	    
	    <tr>
	        <th>성별</th>
	        <td>
	        	<input type="radio" name="gender" value="M" <c:if test = "${list[0].gender == 'M'}">checked</c:if>/>남자
	            <input type="radio" name="gender" value="F" <c:if test = "${list[0].gender == 'F'}">checked</c:if>/>여자
	        </td>
	    </tr>
	    
	    <tr>
	        <th>이메일</th>
	        <td>
	        	<input type="email" name="email1" id="email1" value="${list[0].email1 }">
	        	@
	        	<input type="text" name="email2" id="email2" value="${list[0].email2 }">
	        	
	        	<input type="email" name="email3" id="email3" list="email3_list" oninput="change()">        
	        	<datalist id="email3_list">
	        		<option value="직접입력"></option>
	                <option value="naver.com"/>
	                <option value="gmail.com"/>
	                <option value="daum.net"/>
	        	</datalist>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>휴대전화</th>
	        <td>
	            <select id="tel1" name="tel1">
	                <optgroup label="hp">
	                    <option value="010" <c:if test = "${list[0].tel1 == '010'}">selected</c:if>>010</option>
	                    <option value="011" <c:if test = "${list[0].tel1 == '011'}">selected</c:if>>011</option>
	                    <option value="019" <c:if test = "${list[0].tel1 == '019'}">selected</c:if>>019</option>
	                </optgroup>
	            </select>
		         -
		         <input type="text" id="tel2" name="tel2" size="4" maxlength="4" value="${list[0].tel2 }">
		         -
		         <input type="text" id="tel3" name="tel3" size="4" maxlength="4" value="${list[0].tel3 }">
			</td>
	    </tr>
	    
	    <tr>
	    	<th>주소</th>
	    	<td>
	    		<input type="text" name="zipcode" id="zipcode" size="6" readonly value="${list[0].zipcode }">
	    		<button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br/>
	    		<input type="text" name="addr1" id="addr1" size="60" readonly value="${list[0].addr1 }"><br/>
	    		<input type="text" name="addr2" id="addr2" size="60" value="${list[0].addr2 }">
	    	</td>
	    </tr>
	    
	    <tr>
	    	<td colspan="2" align="center">
	    		<input type="button" value="회원정보수정" id="updateBtn" />
	    		<input type="reset" value="다시작성" onclick="location.reload()" />
	    	</td>
	    </tr>
	</table>
</form>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/member.js"></script>
</body>
</html>