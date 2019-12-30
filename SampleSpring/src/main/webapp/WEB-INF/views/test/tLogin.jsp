<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginBtn").on("click" , function() {
		if($.trim($("#memId").val()) == "") {
			alert("아이디를 입력하세요.");
			$("#memId").focus();
		} else if($.trim($("#memPw").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#memPw").focus();
		} else {
			$("#actionForm").attr("action", "tLogins");
			$("#actionForm").submit();
		}
	});
	
	$("#joinBtn").on("click", function() {
		location.href = "tJoin";
	});
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="text" name="memId" id="memId" placeholder="아이디"/>
	<input type="password" name="memPw" id="memPw" placeholder="비밀번호"/>
	<input type="button" id="loginBtn" value="로그인"/>
	<input type="button" id="joinBtn" value="회원가입"/>
</form>
</body>
</html>