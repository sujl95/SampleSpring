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
		if($.trim($("#bmId").val()) == "") {
			alert("아이디를 입력하세요.");
			$("#bmId").focus();
		} else if($.trim($("#bmPw").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#bmPw").focus();
		} else {
			//jQuery 활용
			var params = $("#actionForm").serialize(); //serialize폼안에 값 전달()
			
			$.ajax({
				type : "post", //데이터 전송방식
				url : "aLoginAjax", //주소
				dataType :"json", //데이터 전송규격
				data : params, //보낼 데이터
				//{키 : 값, 키 : 값,...} -> json
				success : function(result) {
					if(result.res=="SUCCESS") {
						location.href = "aList";
					} else {
						alert("로그인에 실패하였습니다");
					}
				},
				error : function(request , status, error) {
					console.log("status :" + request.status); //상태코드
					console.log("text :" + request.responceText); //request영역 반환텍스트
					console.log("error :" + request.error); //에러메세지
				}
			});
		}
	});
	
	$("#joinBtn").on("click", function() {
		location.href = "aJoin";
	});
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="text" name="bmId" id="bmId" placeholder="아이디"/>
	<input type="password" name="bmPw" id="bmPw" placeholder="비밀번호"/>
	<input type="button" id="loginBtn" value="로그인"/>
	<input type="button" id="joinBtn" value="회원가입"/>
</form>
</body>
</html>