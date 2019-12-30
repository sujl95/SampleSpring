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
	reloadList();
	
	$("#listBtn").on("click", function() {
		location.href = "aList";
	});
	
	$("#updateBtn").on("click", function() {
		if ('${data.BM_NO}' == '${sBmNo}') {
			$("#actionForm").attr("action","aUpdate");
			$("#actionForm").submit();
		} else {
			alert("본인이 올린글만 수정가능합니다")
		}
	});
	$("#deleteBtn").on("click", function() {
		if ('${data.BM_NO}' == '${sBmNo}') {
			if (confirm("삭제하실겁니까?")) {
				var params = $("#actionForm").serialize();
				$.ajax({ 
					type : "post",
					url : "aDeleteAjax",
					dataType :"json",
					data : params,
					success:function(result) {
						if(result.res=="SUCCESS") {
							alert("삭제되었습니다.");
							location.href = "aList";
						} else {
							alert("삭제에 실패하였습니다.");
						}
					},
					error:function(request,status,error) {
						console.log("status :" + request.status); //상태코드
						console.log("text :" + request.responceText); //request영역 반환텍스트
						console.log("error :" + request.error); //에러메세지
					}
					
				});
			}
		}	else {
			alert("본인이 올린글만 삭제 가능합니다")
		}
	});
});
function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "aDetailsAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
	<input type="hidden" name="searchTxt" value="${param.searchTxt}"/>
	<input type="hidden" name="no" value="${data.B_NO}"/>
	<input type="hidden" name="bm_no" value="${data.BM_NO}"/>
</form>
번호 : ${data.B_NO}      <br/>
제목 : ${data.B_TITLE}   <br/>
가입일 : ${data.DT}      <br/>
작성자 : ${data.BM_NM}  <br/>
조회수 : ${data.B_HIT}     <br/>
- 내용  - <br/>
${data.B_CON} <br>
<c:choose>
	<c:when test="${sBmNo eq data.BM_NO}"> 
		<input type="button" value="목록" id="listBtn"/>
		<input type="button" value="수정" id="updateBtn"/>
		<input type="button" value="삭제" id="deleteBtn"/>
	</c:when>
	<c:otherwise>
	 	<input type="button" value="목록" id="listBtn"/>
	</c:otherwise>
</c:choose>
</body>
</html>