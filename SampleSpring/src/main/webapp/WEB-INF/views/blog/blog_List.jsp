<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 슬림 스크롤 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	console.log(${sBmNo});
// 	console.log(data.BM_NO);
	$("#logoutBtn").on("click", function() {
		location.href = "blog_Logout";
	});
	$("#loginBtn").on("click", function() {
		location.href = "blog_Login";
	});
	
	$(".logo_wrap").on("click",function() {
		location.href = "blog_Main";
	});

	$("#joinBtn").on("click", function() {
		location.href = "blog_Join";
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
		if($(this).attr("name") != "") {
			$("#no").val($(this).attr("name"));
			reloadDetailList();
		}
	});
	
	$("#modifyBtn").on("click",function() {
		$("#actionForm").attr("action","aModify");
		$("#actionForm").submit();
	});
	
	$(".table_area").on("click", ".Blog_contents_area", function() {
		$("#no").val($(this).attr("name"));
		console.log($("#no").val());
	});
	$(".whole_body").slimScroll({
		width: "968px",
		height: "100%"
	});
	
	$(".left_wrap").slimScroll({
		width: "300px",
		height: "100%"
	});
	
	$("#Comment_textarea").on("keyup",function() {
		var content = $(this).val();
		console.log(content.length);
	    $('.Comment_cnt').html(content.length);    //글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#Comment_cnt').html("(200 / 최대 200자)");
	    }
	});
	
	$(".Blog_Comments_Button").on("click", function() {
		if($(".Blog_Comments_show").css("display") == "none"){
			console.log("체크");
			$(".Blog_Comments_show").show();
			$("#Blog_Comments_show").html("댓글 보기");
		}else{
			$(".Blog_Comments_show").hide();
			$("#Blog_Comments_show").html("댓글 숨기기");
		}
	});
	$(".Blog_Comments_reply_btn").on("click", function() {
		if($(this).parent().children(".Blog_Comments_reply").css("display") == "none"){
			replyshow($(this).parent().children(".Blog_Comments_reply"));
			console.log("체크");
			$(this).parent().children(".Blog_Comments_reply").show();
			$(this).css("background-color","#cacaca");
			$(this).css("color","#FFFFFF");
		}else{
			$(this).parent().children(".Blog_Comments_reply").hide();
			$(this).css("background-color","#F0F0F0");
			$(this).css("color","black");
		}
	});
	
	
	
});

function replyshow(obj){
	var html ="";
		html += "<div class=\"Blog_Comments_textbox_area\">";
		html += "	<div class=\"Blog_Comments_textbox_author\">";
		html += "		작성자 : ${sBmNm}";
		html += "	</div>";
		html += "	<textarea class=\"Blog_Comments_textbox\"  placeholder=\"답글을 작성하려면 로그인 해주세요\" id=\"Comment_textarea\"></textarea>";
		html += "	<div class=\"Blog_Comments_textbox_cnt_area\"><span class=\"Comment_cnt\">0</span>/200<input type=\"button\" id=\"Comment_add\" value=\"등록\"></div>";
		html += "</div>";
	obj.html(html);

}

function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "blogListAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			redrawList(result.list);
			redrawList1(result.data);
			redrawPaging(result.pb);
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}

function reloadDetailList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "blogDetailAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			redrawList(result.list);
			redrawList1(result.data);
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
			html += "<th>" + list[i].B_TITLE +"</th>";
			html += "<td>" + list[i].B_DT +"</td>";
			html += "<td>" + list[i].B_HIT +"</td>";
			html += "</tr>";
		}
	}
	
	$("tbody").html(html);
}
function redrawList1(data) {
	var html ="";
	console.log(data);
	console.log(data.length);
	
	if(data.length == 0 ) {
		html += "<tr>";
		html += "<td colspan=\"2\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
			html += "<div name=\"" + data.B_NO + "\">";
// 			html += "<td>" + list[i].B_NO +"</td>";
			html += "" + data.B_TITLE +"<br/>";
// 			html += "<td>" + list[i].BM_NM +"</td>";
			html += "" + data.B_DT +"<br/>";
			html += "" + data.B_HIT +"<br/>";
			
			html += "<div class=\"Details_header\" name=\"" + data.B_NO + "\">";
			html += "	<div class=\"Details_title\">";
			html += "		<h2>"+ data.B_TITLE +"</h2>";
			html += "	</div>";
			html += "	<div class=\"Details_author\">";
			html += "		 카테고리 | Web / Html </br>" + "작성자 | "+ data.BM_NM + "" + "&nbsp;&nbsp;&nbsp;&nbsp;	작성일 | " + data.B_DT + "";
			html += "	</div>";
			html += "</div>";
			html += "<div class=\"Detail_contents\">";
			html += ""+  data.B_CON + "";
			html += "</div>";
	}
	
	$(".Blog_Details").html(html);
	
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
		<ul class="">
			<li>
				<a>카테고리 <span class="c_cnt">(20)</span></a>
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
		</ul>
	</div>
	<div class="">
	</div>
</div>
<div class="whole_body">
	<div class="wrap">
		<div class="gnb_area">
			<div class="gnb_btn_area">
			<div class="gnb_search_area">
				 <form action="#" id="actionForm">
					<input type="hidden" name="page" id="page" value="1"/>
					<input type="hidden" name="no" id="no" value="${param.no}"/>
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
		</div>
	</div>
<!-- 	<div class="contents_area"> -->
<!-- 		<div class="contents_title_area"> -->
<!-- 			<div class="contents_title"> -->
<!-- 				안녕하세요 -->
<!-- 			</div> -->
<!-- 			<div class="contents_author_area"> -->
<!-- 				by <span>The Wing</span> &nbsp;작성일<span> 2019-12-18</span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="Blog_Details_area">
		<form action="#" method="post" id="actionForm">
			<input type="hidden" name="page" value="${param.page}"/>
			<input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
			<input type="hidden" name="searchTxt" value="${param.searchTxt}"/>
			<input type="hidden" name="no" value="${data.B_NO}"/>
			<input type="hidden" name="bm_no" value="${data.BM_NO}"/>
		</form>
		<div class="Blog_Details">
			<div class="Details_header">
				<div class="Details_title">
				</div>
				<div class="Details_author">
				</div>
			</div>
			<div class="Detail_contents">
			</div>
		</div>
		<div class="Blog_Comments_area">
			<div class="Blog_Comments_Button" id="Comments_show">
				<img style="width : 30px; height : 30px;"alt="comments_button" src="resources/images/blog/comment.PNG">
				<div class="Blog_Comments_text"><span id="Blog_Comments_show">댓글 보기</span> ( <span>0</span> )</div>
				
			</div>
			<div class="Blog_Comments_show">
				<div class="Blog_Comments_box">
					<div class="Blog_Comments_author">
						SJ BLOG
					</div>
					<div class="Blog_Comments_contents">
						아주GOOD입니다 아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다
					</div>
					<div class="Blog_Comments_date">
						2020.01.02 16:00
					</div>
<!-- 					<input type="button" class="Blog_Comments_reply_btn" value="답글" > -->
					<div class="Blog_Comments_reply" >
					</div>
				</div>
				<div class="Blog_Comments_box">
					<div class="Blog_Comments_author">
						SJ BLOG
					</div>
					<div class="Blog_Comments_contents">
						아주GOOD입니다 아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다
					</div>
					<div class="Blog_Comments_date">
						2020.01.02 16:00
					</div>
<!-- 					<input type="button" class="Blog_Comments_reply_btn" value="답글" > -->
					<div class="Blog_Comments_reply" >
					</div>
				</div>
				<div class="Blog_Comments_box">
					<div class="Blog_Comments_author">
						SJ BLOG
					</div>
					<div class="Blog_Comments_contents">
						아주GOOD입니다 아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다
					</div>
					<div class="Blog_Comments_date">
						2020.01.02 16:00
					</div>
<!-- 					<input type="button" class="Blog_Comments_reply_btn" value="답글" > -->
					<div class="Blog_Comments_reply" >
					</div>
				</div>
				<div class="Blog_Comments_box">
					<div class="Blog_Comments_author">
						SJ BLOG
					</div>
					<div class="Blog_Comments_contents">
						아주GOOD입니다 아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다아주GOOD입니다
					</div>
					<div class="Blog_Comments_date">
						2020.01.02 16:00
					</div>
<!-- 					<input type="button" class="Blog_Comments_reply_btn"  value="답글" > -->
					<div class="Blog_Comments_reply" >
					</div>
				</div>
				<div class="paging_area">
						<span>처음</span>
						<span>이전</span>
						<span>1</span>
						<span>다음</span>
						<span>마지막</span>
					</div>
					<div class="Blog_Comments_textbox_area">
						<div class="Blog_Comments_textbox_author">
							작성자 : ${sBmNm}
						</div>
						<textarea class="Blog_Comments_textbox"  placeholder="댓글을 작성하려면 로그인 해주세요" id="Comment_textarea"></textarea>
						<div class="Blog_Comments_textbox_cnt_area"><span class="Comment_cnt">0</span>/200 &nbsp;&nbsp;<input type="button" id="Comment_add" class="btn"value="등록"></div>
						
					</div>
			</div>
		</div>
		<div class="btn_area" style="margin-right: 40px;">
			<c:choose>
				<c:when test="${sBmNo eq param.bmno}"> 
					<input type="button" class="btn" value="목록" id="listBtn"/>
					<input type="button" class="btn" value="수정" id="updateBtn"/>
					<input type="button" class="btn" value="삭제" id="deleteBtn"/>
				</c:when>
				<c:otherwise>
				 	<input type="button" class="btn" value="목록" id="listBtn"/>
				</c:otherwise>
			</c:choose>
		</div>
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
			<span><<</span>
			<span><</span>
			<span>1</span>
			<span>></span>
			<span>>></span>
		</div>
	</div>
</div>
</body>
</html>