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
	});
	$("#writeBtn").on("click", function() {
		if(($.trim($("#category1Txt").val()) == "") && 
		   ($.trim($("#category2Txt").val()) == "") &&
		   ($.trim($("#category3Txt").val()) == "") &&
		   ($.trim($("#category4Txt").val()) == "") &&
		   ($.trim($("#category5Txt").val()) == "")
		) {
			alert("최소 1개이상의 카테고리를 입력하세요.");
		} 
		else {
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post",
				url : "bCategoryAjax",
				dataType : "json",
				data : params,
				success:function(result) {
					if(result.res=="SUCCESS") {
						alert("카테고리 등록을 성공 하였습니다");
						location.href = "blog_Main";
					} else {
						alert("카테고리 등록을 실패 하였습니다");
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
	<div class="Category_contents_area">
		<div class="login_title_area">
			카테고리설정
		</div>
<!-- 		<div class="login_txt_area"> -->
<!-- 		</div> -->
		<div class="Category_btn_area">
			<form action="#" method="post" id="actionForm">
				<input type="hidden" name="bmno" readonly="readonly" id="bmno" value="${data.BM_NO}"/><br/>
				<input class="input_normal" type="text" name="nmTxt" id="nmTxt" value="${data.BM_NM}" placeholder="이름입력"/><br/>
				<input class="input_normal" type="text" name="categoryTxt1" id="category1Txt" placeholder="카테고리1입력" value="${data.CT1}"/><br/>
				<input class="input_normal" type="text" name="categoryTxt2" id="category2Txt" placeholder="카테고리2입력" value="${data.CT2}"/><br/>
				<input class="input_normal" type="text" name="categoryTxt3" id="category3Txt" placeholder="카테고리3입력" value="${data.CT3}"/><br/>
				<input class="input_normal" type="text" name="categoryTxt4" id="category4Txt" placeholder="카테고리4입력" value="${data.CT4}"/><br/>
				<input class="input_normal" type="text" name="categoryTxt5" id="category5Txt" placeholder="카테고리5입력" value="${data.CT5}"/><br/>
				<input class="input_normal bgwhite pocursor txthover" type="button" id="writeBtn" value="저장"/>
				<input class="input_normal bgwhite pocursor txthover" type="button" id="cancelBtn" value="취소"/>
			</form>
		</div>
	</div>
</div>
</body>
</html>