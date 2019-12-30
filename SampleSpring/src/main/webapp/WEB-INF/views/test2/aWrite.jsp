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
		if('${res}' == 1){
			alert("로그인을 해주세요");
			location.href = "bLogin";
		} 
			
	$("#saveBtn").on("click", function() {
		$("#con").val(CKEDITOR.instances['con'].getData()); //ckeditor에서 화면중 con이라는 이름을 가진 데이터를 가져온다
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
			//jQuery 활용
			var params = $("#saveForm").serialize(); //serialize폼안에 값 전달()
			
			$.ajax({
				type : "post", //데이터 전송방식
				url : "aWriteAjax", //주소
				dataType :"json", //데이터 전송규격
				data : params, //보낼 데이터
				//{키 : 값, 키 : 값,...} -> json
				success : function(result) {
					if(result.res=="SUCCESS") {
						location.href = "aList";
					} else {
						alert("등록에 실패하였습니다");
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
		//뒤로가기
		history.back();
	});
});
</script>
</head>
<body>
<form action="#" id="saveForm" method="post">
<input type="hidden" name="bm_no" value="${sBmNo}"/>
<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" id="writer" readonly="readonly" value="${sBmNm}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="con" id="con" rows="10" cols="20"></textarea></td>
		</tr>
	</tbody>
</table>
</form>
<br>
<input type="button" id="saveBtn" value="저장"/>
<input type="button" id="cancelBtn" value="취소"/>
</body>
</html>