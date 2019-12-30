<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 슬림 스크롤 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
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
	
	$(".logo_wrap").on("click",function() {
		location.href = "blog_Main";
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
	$("tbody").on("click","tr",function() {
		$("#no").val($(this).attr("name"));
		$("#actionForm").attr("action","aDetails");
		$("#actionForm").submit();
	});
	
	$("#modifyBtn").on("click",function() {
		$("#actionForm").attr("action","aModify");
		$("#actionForm").submit();
	});
	
	$(".table_area").on("click", ".Blog_contents_area", function() {
		$("#no").val($(this).attr("name"));
		console.log($("#no").val());
		$("#actionForm").attr("action","aDetails");
		$("#actionForm").submit();
	});
	$(".whole_body").slimScroll({
		width: "968px",
		height: "100%"
	});
	
	$(".left_wrap").slimScroll({
		width: "300px",
		height: "100%"
	});
});
function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "blogListAjax",
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
		html += "<td colspan=\"2\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i in list) {
			html += "<tr name=\"" + list[i].B_NO + "\">";
// 			html += "<td>" + list[i].B_NO +"</td>";
			html += "<th>" + list[i].B_TITLE +"</th>";
// 			html += "<td>" + list[i].BM_NM +"</td>";
			html += "<td>" + list[i].B_DT +"</td>";
			html += "<td>" + list[i].B_HIT +"</td>";
			html += "</tr>";
		}
	}
	
	$("tbody").html(html);
// 	var html ="";
	
// 	if(list.length == 0 ) {
// 		html += "<span\">조회된 데이터가 없습니다.</span>";
// 	} else {
// 		for(var i in list) {
// 			html += "<div name=\"" + list[i].B_NO + "\" class=\"Blog_contents_area\">"
// 			html += "	<div class=\"Blog_contents_author\">"
// 			html += "		<div class=\"author\">" + list[i].BM_NM + "</div>"
// 			html += "		<div class=\"time\">" + list[i].B_DT + "</div>"
// 			html += "	\"</div>"
// 			html += "	<div class=\"Blog_contents_header\">"
// 			html += "	" + list[i].B_TITLE + "</div>"
// 			html += "	<div class=\"Blog_contents_contents\">"
// 			html += "	"+ list[i].B_CON + "</div>"
// 			html += "	<div class=\"Blog_contents_comment\">"
// 			html += "	공감<span>55</span> 댓글 <span>7</span>"
// 			html += "	</div>"
// 			html += "</div>"
// 		}
// 	}
// // 	$("tbody").html(html);
//  	$(".Blog_list_area").html(html);
	
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
<div class="left_wrap">
	<div class="logo_wrap">
		<h1 style="cursor:pointer;">
			 SLOG
		</h1>
	</div>
	<div class="category">
		<ul class="">
			<li>
				<a>개발 <span class="c_cnt">(20)</span></a>
			</li>
				<ul>
					<li>
						<a>Server <span class="c_cnt">(3)</span></a>
					</li>						
					<li>
						<a>PHP, Mysql <span class="c_cnt">(9)</span></a>
					</li>						
					<li>
						<a>HTML, CSS, Script <span class="c_cnt">(7)</span></a>
					</li>						
					<li>
						<a>Android <span class="c_cnt">(1)</span></a>
					</li>						
					<li>
						<a>IOS <span class="c_cnt">(0)</span></a>
					</li>						
				</ul>
			<li>
				<a>일상 <span class="c_cnt">(1)</span></a>
			</li>
				<ul>
					<li>
						<a>일상 <span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>독서 <span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>기타 <span class="c_cnt">(1)</span></a>
					</li>						
				</ul>
		</ul>
	</div>
	<div class="">
	</div>
</div>
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
				<input type="hidden" name="bmno" id="bmno" value="${param.bmno}"/>
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
	<div class="Blog_Details_area">
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
	</div>
	<div class="table_area">
		<div class="Blog_table_list">
				<h4>'##' 카테고리의 다른글</h4>
				<hr>
			<table class="Blog_table">
				<colgroup>
					<col width="70%">	
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
<!-- 						<th>번호</th> -->
						<th>제목</th>
<!-- 						<th>작성자</th> -->
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">조회된 데이터가 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
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