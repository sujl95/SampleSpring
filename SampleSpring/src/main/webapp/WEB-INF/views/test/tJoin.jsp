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
	$("#writeBtn").on("click", function() {
		$("#actionForm").attr("action","tJoins");
		$("#actionForm").submit();
	});
	$("#selectBtn").on("click",function() {
		$("#actionForm").attr("action","tJoin");
		$("#actionForm").submit();
	});
});

</script>
</head>
<body>
<form action="tJoins" method="post" id="actionForm">
	<input type="text" name="idTxt" id="idTxt" placeholder="ID입력" value="${param.idTxt}"/>
	<input type="text" name="pwTxt" id="pwTxt" placeholder="PW입력"/>
	<input type="text" name="nmTxt" id="nmTxt" placeholder="이름입력"/>
	<input type="text" name="ckTxt" id="ckTxt" value="0" placeholder="ID중복체크"/>
	<%-- <input type="text" name="ckTxt" id="ckTxt" value="${param.MEM_ID}" placeholder="ID중복체크"/> --%>
	<input type="button" id="selectBtn" value="ID중복조회"/>
	<input type="button" id="writeBtn" value="등록"/>
</form>

<%-- ${param.MEM_ID} --%>
</body>
</html>