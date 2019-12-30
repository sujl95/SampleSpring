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
	$("#logoutBtn").on("click", function() {
		location.href = "aLogout";
	});
	$("#loginBtn").on("click", function() {
		location.href = "aLogin";
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	$("#writeBtn").on("click", function() {
		location.href = "aWrite";
	});
	
	$(".paging_area").on("click", "span", function() {
		console.log($(this).attr("name"));
		if($(this).attr("name") != "") {
			$("#page").val($(this).attr("name"));
			reloadList();	
		}
	});
	$("tbody").on("click","tr",function() {
		$("#no").val($(this).attr("name"));
		$("#actionForm").attr("action","aDetails");
		$("#actionForm").submit();
	});
	
	$("#modifyBtn").on("click",function() {
		$("#actionForm").attr("action","aModify");
		$("#actionForm").submit();
	});
});
function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "aListAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			redrawList(result.list);
			redrawPaging(result.pb);
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}

function redrawList(list) {
	var html ="";
	
	if(list.length == 0 ) {
		html += "<tr>";
		html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i in list) {
			html += "<tr name=\"" + list[i].B_NO + "\">";
			html += "<td>" + list[i].B_NO +"</td>";
			html += "<td>" + list[i].B_TITLE +"</td>";
			html += "<td>" + list[i].BM_NM +"</td>";
			html += "<td>" + list[i].B_DT +"</td>";
			html += "<td>" + list[i].B_HIT +"</td>";
			html += "</tr>";
		}
	}
	
	$("tbody").html(html);
	
}

function redrawPaging(pb) {
	var html ="";
	//첫페이지
	html += "<span name=\"1\">처음</span>&nbsp;";
	//이전페이지
	
	if($("#page").val() == "1" ) {
		html += "<span name=\"1\">이전</span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>&nbsp;";
	}
	
	//숫자
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
		if($("#page").val() == i ) {
			html += "<span><b>" + i + "</b></span>&nbsp;";
		} else{
			html += "<span name=\"" + i + "\">" + i + "</span>&nbsp;";
		}
	}
	//다음페이지
	
	if($("#page").val() == pb.maxPcount ) {
		html += "<span name=\""+pb.maxPcount+ "\">다음</span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>&nbsp;";
	}
	
	//마지막
	html += "<span name=\"" + pb.maxPcount + "\">마지막</span>";
	
	$(".paging_area").html(html);
}
</script>
</head>
<body>
<c:choose>
	<c:when test="${!empty sBmNo}">
		${sBmNm}님 어서오세요. <input type="button" value="로그아웃" id="logoutBtn"/>
		<input type="button" value="회원 정보 수정" id="modifyBtn">
	</c:when>
	<c:otherwise>
		<input type="button" value="로그인" id="loginBtn"/>
	</c:otherwise>
</c:choose>
<form action="#" id="actionForm">
	<input type="hidden" name="page" id="page" value="1"/>
	<input type="hidden" name="no" id="no" value=""/>
	<input type="hidden" name="bm_no" id="bm_no" value="${sBmNo}"/>
	<select name="searchGbn">
		<option value="0">제목</option>
		<option value="1">작성자</option>
		<option value="2">제목 + 작성자</option>
	</select>
	<input type="text" name="searchTxt"/>
	<input type="button" value="검색" id="searchBtn"/>
	<c:if test="${!empty sBmNo}">
		<input type="button" value="등록" id="writeBtn"/>
	</c:if>
</form>
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="5">조회된 데이터가 없습니다.</td>
		</tr>
	</tbody>
</table>
<div class="paging_area">
	<span>처음</span>
	<span>이전</span>
	<span>1</span>
	<span>다음</span>
	<span>마지막</span>
</div>
</body>
</html>