<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N: LOGIN</title>
<link rel="stylesheet" href="../css/loginForm.css">
</head>
<body>
<div id="wrap">
<h1>
	<img alt="naver_logo" src="../image/naver.png" width = 50 height = 50 style="cursor: pointer;" onclick="location.href='../index.do'">
</h1>
<span>로그인</span>
<form id="loginForm">
	<table border="1">
		<tr>
	        <th>아이디</th>
	        <td>
	        	<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
	        	<div id="idDiv"></div>
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
	    	<td colspan="2" align="center">
	    		<input type="button" value="로그인" id="loginBtn"/>
	    		<input type="button" value="회원가입"
	    			onclick="location.href='${pageContext.request.contextPath }/member/writeForm.do'" />      
	    	</td>
	    </tr>
	</table>
	<div id = loginResult></div>
</form>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		$('#loginResult').empty();
		
		if($('#id').val() == '')
			$('#idDiv').html('아이디 입력');
		else if($('#pwd').val() == '')
			$('#pwdDiv').html('비밀번호 입력');
		else
			$.ajax({
				type: 'post',
				url: './login.do',
				
				//data: 'id=' + $('#id').val() + '&pwd=' + $('#pwd').val(),
				data: {
					'id': $('#id').val(),
					'pwd': $('#pwd').val()
				},
				dataType: 'text', //서버로부터 받는 타입, 'text' or 'xml' or 'json'
				success: function(data){
					//alert(data.trim());
					
					if(data.trim() == 'fail')
						$('#loginResult').html('아이디 또는 비밀번호가 틀렸습니다.')
					else {
						location.href = "../index.do";
					}
				},
				error: function(e){
					console.log(e);
				}
			});
	});
});
</script>
</body>
</html>