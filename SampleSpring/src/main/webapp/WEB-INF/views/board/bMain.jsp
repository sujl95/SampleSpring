<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#logoutBtn").on("click", function() {
		location.href = "bLogout";
	});
	
	$("#boardlistBtn").on("click",function() {
		location.href = "board1";
	});
	$("#modifyBtn").on("click",function() {
		location.href = "bmodify";
	});
});
</script>
</head>
<body>
${sMemNm}님 어서오세요.<input type="button" value="로그아웃" id="logoutBtn"/>
<br/>
<input type="button" value="게시판 목록" id="boardlistBtn">
<input type="button" value="회원 정보 수정" id="modifyBtn">
</body>
</html>