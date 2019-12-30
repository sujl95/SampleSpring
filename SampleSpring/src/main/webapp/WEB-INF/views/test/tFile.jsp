<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#uploadBtn").on("click", function() {
		var fileForm = $("#fileForm");
		//.ajaxForm -> Form 실행 이벤트를 Ajax형태의 전송으로 변경
		fileForm.ajaxForm({
			beforeSubmit : function(data,frm,opt) {//보내기전 validation check가 필요할 경우
				console.log("전송전!!"); return true; // Form수행을 하지 않을 것이면 return false;
			},//submit이후의 처리
			success: function(responseText,statusText) {
				if(responseText.result =="SUCCESS") {
					console.log(responseText);
				} else{
					console.log("저장실패");
				}
			},//ajax error
			error : function() {
				console.log("에러 발생 !!");
			}
		});
		
		fileForm.submit();
	});
})
</script>
</head>
<body>
<form id="fileForm" action="fileUploadAjax" 
	  method="post" enctype="multipart/form-data">
<h3>첨부파일</h3>
<table border="1">
	<tr>
		<th>첨부파일1</th>
		<td><input type="file" name="attFile1" size="85"/></td>
	</tr>
	<tr>
		<th>첨부파일2</th>
		<td><input type="file" name="attFile2" size="85"/></td>
	</tr>
</table>
</form>
<input type="button" value="저장" id="uploadBtn"/>
</body>
</html>