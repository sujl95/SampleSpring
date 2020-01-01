<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#cancelBtn").on("click", function() {
		location.href = "blog_Main";
	});
	$("#withdrawalBtn").on("click", function() {
		if(confirm("회원탈퇴 하실겁니까?")) {
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post",
				url : "bWithdrawalAjax",
				dataType : "json" ,
				data : params,
				success:function(result){
					if(result.res=="SUCCESS") {
						alert("정상적으로 탈퇴 되었습니다");
						location.href = "blog_Login";
					} else {
						alert("탈퇴 처리가 되지 않았습니다");
					}
				}
			})
		}
	});
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
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post",
				url : "bModifyAjax",
				dataType : "json",
				data : params,
				success:function(result) {
					if(result.res=="SUCCESS") {
						alert("회원정보 수정을 성공 하였습니다");
						location.href = "aList";
					} else {
						alert("회원정보 수정을 실패 하였습니다");
					}
				},
				error:function(request,status,error) {
					console.log("status :" + request.status); //상태코드
					console.log("text :" + request.responceText); //request영역 반환텍스트
					console.log("error :" + request.error); //에러메세지
				}
			})
		}
	}); 
});

</script>
</head>
<body>
<div class="wrap_login_bg">
	<div class="Modify_contents_area">
		<div class="login_title_area">
			회원정보수정
		</div>
		<div class="login_btn_area">
			<form action="#" method="post" id="actionForm">
				<input type="hidden" name="bmno" id="bmno" value="${data.BM_NO}"/><br/>
				<input class="input_normal" type="text" name="idTxt" id="idTxt" readonly="readonly" placeholder="ID입력" value="${data.BM_ID}"/><br/>
				<input class="input_normal" type="password" name="pwTxt" id="pwTxt" value="" placeholder="PW입력"/><br/>
				<input class="input_normal" type="text" name="nmTxt" id="nmTxt" value="${data.BM_NM}" placeholder="이름입력"/><br/>
				<input class="input_normal bgwhite pocursor txthover" type="button" id="writeBtn" value="수정"/>
				<input class="input_normal bgwhite pocursor txthover" type="button" id="withdrawalBtn" value="회원탈퇴"/>
				<input class="input_normal bgwhite pocursor txthover" type="button" id="cancelBtn" value="취소"/>
			</form>
		</div>
	</div>
</div>
</body>
</html>