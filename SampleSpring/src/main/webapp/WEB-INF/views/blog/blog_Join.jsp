<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery js 파일 -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#bmId").on("focusout", function() {
		if($(this).val().length < 4) {
			alert("아이디는 4글자 이상입니다.");
// 			$("#idMsg").html("아이디는 4글자 이상입니다");
// 			$("#idMsg").css("color","red");
// 			$("#idMsg").css("background-color","rgba(255,100,100,0.7)");
			$("#checkId").val(0);
		} else {
			//수동 
			//var parmas = "*bmId=" + $("#bmId").val();
			
			//jQuery 활용
			var params = $("#actionForm").serialize(); //serialize폼안에 값 전달()
			console.log(params);
			
			$.ajax({
				type : "post", //데이터 전송방식
				url : "bIdCheckAjax", //주소
				dataType :"json", //데이터 전송규격
				data : params, //보낼 데이터
				//{키 : 값, 키 : 값,...} -> json
				success : function(result) {
					if(result.cnt > 0 ) { 
						alert("중복된 아이디가 있습니다.");
// 						$("#idMsg").html("중복된 아이디가 있습니다");
// 						$("#idMsg").css("color","red");
// 						$("#idMsg").css("background-color","rgba(255,100,100,0.7)");
						$("#checkId").val(0);
					} else {
						alert("사용 가능한 아이디 입니다.");
// 						$("#idMsg").html("사용 가능한 아이디 입니다");
// 						$("#idMsg").css("color","green");
// 						$("#idMsg").css("background-color","rgba(100,255,100,0.7)");
						$("#checkId").val(1);
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
		if($.trim($("#bmId").val()) == "") {
			alert("아이디를 입력하세요.");
			$("bmId").focus();			
		} else if($.trim($("#bmPw").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#bmPw").focus();
		}  else if ($("#bmNm").val() != $("#pwTxt1").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#bmNm").focus();
		}  else if($.trim($("#bmNm").val()) == "") {
			alert("이름을 입력하세요. ");
		} else if($("#checkId").val() == 0) {
			alert("아이디가 유효하지 않습니다.");
		} else {
			//jQuery 활용
			var params = $("#actionForm").serialize(); //serialize폼안에 값 전달()
			
			$.ajax({
				type : "post", //데이터 전송방식
				url : "bJoinAjax", //주소
				dataType :"json", //데이터 전송규격
				data : params, //보낼 데이터
				//{키 : 값, 키 : 값,...} -> json
				success : function(result) {
					if(result.res=="SUCCESS") {
						location.href = "blog_Login";
					} else {
						alert("가입에 실패하였습니다");
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
	
	$("#cancelBtn").on("click", function() {
		location.href = "blog_Main";
	});
});

</script>
</head>
<body>
<input type="hidden" id="checkId" value="0"/>
<div class="wrap_login_bg">
	<div class="Join_contents_area">
		<div class="Join_title_area">
			회원가입
		</div>
		<form action="#" method="post" id="actionForm">
			<div class="login_btn_area" style="font-size : 20px;">
				<input class="input_normal" type="text" name="bmId" id="bmId" placeholder="아이디"/>
				<input class="input_normal" type="password" name="bmPw" id="bmPw" placeholder="비밀번호"/>
				<input class="input_normal" type="password" name="pwTxt" id="pwTxt1" value="" placeholder="PW확인"/>
				<input class="input_normal" type="text" name="bmNm" id="bmNm" placeholder="이름" />
				<input class="input_normal bgwhite pocursor txthover" type="button" id="joinBtn" value="가입"/>
				<input class="input_normal bgwhite pocursor txthover" type="button" id="cancelBtn" value="취소"/>
			</div>
		</form>
	</div>
</div>
<%-- ${param.MEM_ID} --%>
</body>
</html>