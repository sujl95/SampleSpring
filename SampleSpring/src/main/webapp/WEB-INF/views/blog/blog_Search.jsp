<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 검색</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	$("#logoutBtn").on("click", function() {
		location.href = "blog_Logout";
	});
	$("#loginBtn").on("click", function() {
		location.href = "blog_Login";
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	$("#writeBtn").on("click", function() {
		location.href = "blog_Write";
	});
	
	$(".paging_area").on("click", "span", function() {
		console.log($(this).attr("name"));
		if($(this).attr("name") != "") {
			$("#page").val($(this).attr("name"));
			reloadList();	
		}
	});
	
	$("#modifyBtn").on("click",function() {
		$("#actionForm").attr("action","aModify");
		$("#actionForm").submit();
	});
	
	$(".table_area").on("click", ".Blog_contents_area", function() {
		$("#bmno").val($(this).attr("name"));
		$("#actionForm").attr("action","blog_List");
		$("#actionForm").submit();
	});
	
});
function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "bListAjax",
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
		html += "<span\">조회된 데이터가 없습니다.</span>";
	} else {
		for(var i in list) {
			html += "<div name=\"" + list[i].BM_NO + "\" class=\"Blog_contents_area\">"
			html += "	<div class=\"Blog_contents_author\">"
			html += "		<div class=\"author\">" + list[i].BM_NM + "</div>"
			html += "		<div class=\"time\">" + list[i].B_DT + "</div>"
			html += "	\"</div>"
			html += "	<div class=\"Blog_contents_header\">"
			html += "	" + list[i].B_TITLE + "</div>"
			html += "	<div class=\"Blog_contents_contents\">"
			html += "	"+ list[i].B_CON + "</div>"
			html += "	<div class=\"Blog_contents_comment\">"
			html += "	공감<span>55</span> 댓글 <span>7</span>"
			html += "	</div>"
			html += "</div>"
		}
	}
// 	$("tbody").html(html);
 	$(".Blog_list_area").html(html);
	
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
<div class="whole_body">
	<div class="wrap">
		<div class="gnb_area">
			<div class="gnb_btn_area">
			<c:choose>
				<c:when test="${!empty sBmNo}">
					${sBmNm}님 어서오세요. <input type="button" value="로그아웃" id="logoutBtn"/>
					<input type="button" value="회원 정보 수정" id="modifyBtn">
				</c:when>
				<c:otherwise>
					<input type="button" value="로그인" id="loginBtn"/>&nbsp;
					<input type="button" id="joinBtn" value="회원가입">
				</c:otherwise>
			</c:choose>
				<span>내 블로그</span>&nbsp; | &nbsp;
				<span>이웃블로그</span>&nbsp; | &nbsp;
				<span>블로그 홈</span>&nbsp; | &nbsp;
			</div>
		</div>
	</div>
	<div class="gnb_area_bottom">
		<div class="btn_area_left">
			 <form action="#" id="actionForm">
				<input type="hidden" name="page" id="page" value="1"/>
				<input type="hidden" name="no" id="no" value=""/>
				<input type="hidden" name="bmno" id="bmno" value=""/>
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
		</div>
	</div>
	<div class="contents_area">
		<div class="contents_title_area">
			<div class="contents_title">
				안녕하세요
			</div>
			<div class="contents_author_area">
				by <span>The Wing</span> &nbsp;작성일<span> 2019-12-18</span>
			</div>
		</div>
	</div>
	<div class="table_area">
		<div class="Blog_list_area">
		</div>
		<div class="paging_area">
			<span>처음</span>
			<span>이전</span>
			<span>1</span>
			<span>다음</span>
			<span>마지막</span>
		</div>
	</div>
</div>
</body>
</html>