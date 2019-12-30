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
		CKEDITOR.replace("con", {
			resize_enabled : false,
			language : "ko", 
			enterMode : "2"
		});
		
	$("#updateBtn").on("click", function() {
		$("#con").val(CKEDITOR.instances['con'].getData());
		if($.trim($("#title").val()) == "") {
			alert("제목을 입력하세요.");
			$("#title").focus();
		} else if($.trim($("#writer").val()) == "") {
			alert("작성자를 입력하세요.");
			$("#writer").focus();
		} else if($.trim($("#con").val()) == "") {
			alert("제목을 입력하세요.");
			$("#con").focus();
		} else {
			$("#updateForm").submit();
		} 
		
	});
		
	$("#cancelBtn").on("click", function() {
		//뒤로가기
		history.back();
	});
});
</script>
</head>
<body>
<form action="test4s" id="updateForm" method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
	<input type="hidden" name="searchTxt" value="${param.searchTxt}"/>
	<input type="hidden" name="no" value="${data.NO}"/>
<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" value="${data.TITLE}"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" id="writer" value="${data.WRITER}" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="con" id="con" rows="10" cols="20">${data.CON}</textarea></td>
		</tr>
	</tbody>
</table>
</form>
<br>
<input type="button" id="updateBtn" value="수정"/>
<input type="button" id="cancelBtn" value="취소"/>
</body>
</html>