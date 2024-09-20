<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<c:if test = "${sessionScope.memId == null }">
<input type = button value = 로그인 
	onclick = "location.href = '${context}/member/loginForm.do'"/><br/><br/>
<input type = button value = 회원가입
	onclick = "location.href = '${context}/member/writeForm.do'"/><br/><br/>
</c:if>
<c:if test = "${sessionScope.memId != null }">
<h3><a href="${context}/member/updateForm.do">${sessionScope.memName}님</a></h3>
<input type = button value = 로그아웃 id = logoutBtn /><br/><br/>
<input type = button value = 회원정보수정
	onclick = "location.href = '${context}/member/updateForm.do'"/><br/><br/>
</c:if>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	//로그아웃
	$('#logoutBtn').click(function(){
		$.ajax({
			type: 'post',
			url:'/projectMVC/member/logout.do',
			success:function(){
				location.href = "/projectMVC/index.do"
			},
			error:function(e){
				console.log(e);
			}
		})
	});
</script>