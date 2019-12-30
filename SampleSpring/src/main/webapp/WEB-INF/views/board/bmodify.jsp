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
		if($.trim($("#idTxt").val()) == "") {
			alert("아이디를 입력하세요.");
			$("#idTxt").focus();
		} else if($.trim($("#pwTxt").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#pwTxt").focus();
		} else if ($.trim($("#nmTxt").val()) == "") {
			alert("이름을 입력하세요.");
			$("#nmTxt").focus();
		} else {
			$("#actionForm").attr("action", "bmodifys");
			$("#actionForm").submit();
		}
	}); 
	$("#selectBtn").on("click",function() {
		$("#actionForm").attr("action","bmodify");
		$("#actionForm").submit();
	});
});

</script>
</head>
<body>
<form action="bmodifys" method="post" id="actionForm">
	<input type="hidden" name="bmno" id="bmno" value="${data.BM_NO}"/><br/>
	아이디 : <input type="text" name="idTxt" id="idTxt" readonly="readonly" value="${data.BM_ID}"/><br/>
	비밀 번호 :	<input type="password" name="pwTxt" id="pwTxt" value="" placeholder="PW입력"/><br/>
	이름 : <input type="text" name="nmTxt" id="nmTxt" value="${data.BM_NM}" placeholder="이름입력"/><br/>
	<input type="button" id="writeBtn" value="등록"/>
</form>
</body>
</html>