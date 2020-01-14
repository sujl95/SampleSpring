<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Main css -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<!-- btn -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 슬림 스크롤 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<!-- Main js -->
<script type="text/javascript" src="resources/script/blog/Main.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
// 	Categet();
	
	
	
	$(".paging_area").on("click", "span", function() {
		console.log($(this).attr("name"));
		if($(this).attr("name") != "") {
			$("#page").val($(this).attr("name"));
			reloadList();	
		}
	});
	
	
	$(".table_area").on("click", ".Blog_contents_area", function() {
		var arr = [];
		arr = $(this).attr("name").split(",");
		console.log(arr);
		$("#bmno").val(arr[0]);
		$("#no").val(arr[1]);
		console.log($("#bmno").val());
		console.log($("#no").val());
		$("#actionForm").attr("action","blog_List");
		$("#actionForm").submit();
	});
	
});

function reloadList() {
	var params = $("#actionForm").serialize();
	console.log(params);
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
/* 게시글가져오기 */
function redrawList(list) {
	var html ="";
	
	if(list.length == 0 ) {
		html += "<span\">조회된 데이터가 없습니다.</span>";
	} else {
		for(var i in list) {
			html += "<div name=\"" + list[i].BM_NO +","+list[i].B_NO+"\" class=\"Blog_contents_area\">"
			html += "	<div class=\"Blog_contents_author\">"
			html += "		<div class=\"author\">" + list[i].BM_NM + "</div>"
			html += "		<div class=\"time\">" + list[i].B_DT + "</div>"
			html += "	\"</div>"
			html += "	<div class=\"Blog_contents_header\">"
			html += "	" + list[i].B_TITLE + "</div>"
			html += "	<div class=\"Blog_contents_contents\">"
			html += "	"+ list[i].B_CON + "</div>"
			html += "	<div class=\"Blog_contents_comment\">"
			html += "	댓글 <span>7</span>"
			html += "	</div>"
			html += "</div><hr>"
		}
	}
 	$(".Blog_list_area").html(html);
	
}

function redrawPaging(pb) {
	var html ="";
	//첫페이지
	html += "<span name=\"1\"><<</span>&nbsp;";
	//이전페이지
	
	if($("#page").val() == "1" ) {
		html += "<span name=\"1\"><</span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 - 1) + "\"><</span>&nbsp;";
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
		html += "<span name=\""+pb.maxPcount+ "\">></span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">></span>&nbsp;";
	}
	
	//마지막
	html += "<span name=\"" + pb.maxPcount + "\">>></span>";
	
	$(".paging_area").html(html);
}


</script>
</head>
<body>
<div class="left_wrap">
	<div class="logo_wrap">
		<h1 style="cursor:pointer;">
			SLOG
		</h1>
	</div>
	<div class="category">
		<ul class="category_list">
			
		</ul>
	</div>
</div>
<div class="whole_body">
	<div class="wrap">
		<div class="gnb_area">
			<div class="gnb_btn_area">
			<div class="gnb_search_area">
				 <form action="#" id="actionForm" method="post">
					<input type="hidden" name="page" id="page" value="1"/>
					<input type="hidden" name="no" id="no" value="${param.no}"/>
					<input type="hidden" name="bmno" id="bmno" value="${param.bmno}"/>
					<input type="hidden" name="bm_no" id="bm_no" value="${sBmNo}"/>
					<input type="hidden" name="cate_no" id="cate_no" value="${param.cate_no}"/>
					<div class="search_area">
<!-- 						<select name="searchGbn" style="height: 100%;"> -->
<!-- 							<option value="0">제목</option> -->
<!-- 							<option value="1">작성자</option> -->
<!-- 							<option value="2">제목 + 작성자</option> -->
<!-- 						</select> -->
<!-- 						<input type="text" name="searchTxt"  style="height: calc(100% - 6px); vertical-align: top;"/> -->
<!-- 						<input type="button" value="검색" id="searchBtn"  style="height: 100%;"/> -->
					
					<c:if test="${!empty sBmNo}">
						<input type="button" value="글쓰기" id="writeBtn" style="height: calc(100%); vertical-align: top;"/>
					</c:if>
					</div>
				</form>
			</div>
			<c:choose>
				<c:when test="${!empty sBmNo}">
					${sBmNm}님 어서오세요. <input type="button" value="로그아웃" id="logoutBtn" style="height: 30px; vertical-align: top;"/>
					<div class="setting">
						설정
					</div>
					<div class="setting_area">
						<div class="setting_hover" style="border-bottom : 1px solid #cacaca;" id="modifyBtn">회원 정보 수정</div><br>
						<div class="setting_hover" id="categoryBtn">카테고리 설정</div>
					</div>
				</c:when>
				<c:otherwise>
					<input type="button" value="로그인" id="loginBtn"  />&nbsp;
					<input type="button" id="joinBtn" value="회원가입">
				</c:otherwise>
			</c:choose>
<!-- 				<span>내 블로그</span>&nbsp; | &nbsp; -->
<!-- 				<span>이웃블로그</span>&nbsp; | &nbsp; -->
<!-- 				<span>블로그 홈</span>&nbsp; | &nbsp; -->
			</div>
		</div>
	</div>
	<div class="gnb_area_bottom">
		<div class="btn_area_left">
			 
		</div>
	</div>
	<div class="contents_area">
		<div class="table_area">
			<h1 style="font-size: 14pt;">블로그 리스트</h1>
			<div class="Blog_list_area">
			</div>
			<div class="paging_area">
				<span><<</span>
				<span><</span>
				<span>1</span>
				<span>></span>
				<span>>></span>
			</div>
		</div>
	</div>
</div>
</body>
</html>