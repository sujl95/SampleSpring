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
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action","test1");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action","test4");
		$("#actionForm").submit();
	});
	$("#deleteBtn").on("click", function() {
		if (confirm("삭제하실겁니까?")) {
			$("#actionForm").attr("action","test5s");
			$("#actionForm").submit();
		}
	});
});
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
	<input type="hidden" name="searchTxt" value="${param.searchTxt}"/>
	<input type="hidden" name="no" value="${data.NO}"/>
</form>
${data.NO}      <br/>
${data.TITLE}   <br/>
${data.DT}      <br/>
${data.WRITER}  <br/>
${data.HIT}     <br/>
- 내용  - <br/>
${data.CON} <br>
<input type="button" value="목록" id="listBtn"/>
<input type="button" value="수정" id="updateBtn"/>
<input type="button" value="삭제" id="deleteBtn"/>
</body>
</html>