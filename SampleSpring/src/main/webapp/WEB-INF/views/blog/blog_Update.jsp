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
<!-- Main js파일 -->
<script type="text/javascript" src="resources/script/blog/Main.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	Categet();
	
	CKEDITOR.replace("con", {
		resize_enabled : false,
		language : "ko", 
		enterMode : "2"
	});
		
	$("#updateBtn").on("click", function() {
		$("#con").val(CKEDITOR.instances['con'].getData());
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
			
			var params = $("#updateForm").serialize();
			$.ajax({
				type : "post",
				url : "bUpdateAjax",
				dataType : "json",
				data : params,
				success:function(result) {
					if(result.res=="SUCCESS") {
						alert("수정되었습니다.");
						$("#updateForm").attr("action" , "blog_List");
						$("#updateForm").submit();
					} else {
						alert("수정에 실패하였습니다.");
					}
				},
				error:function(request,statuc,error) {
					console.log("status :" + request.status); //상태코드
					console.log("text :" + request.responceText); //request영역 반환텍스트
					console.log("error :" + request.error); //에러메세지
				}
			})	
			
		} 
		
	});
		
	$("#cancelBtn").on("click", function() {
		//뒤로가기
		history.back();
	});
});
function Categet() {
	var params = $("#actionForm").serialize();
	console.log(params);
	$.ajax({ 
		type : "post",
		url : "bWCategetAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			blog_write(result.data);
			reloadcateList(result.data, result.CT, result.cateAllcnt);
			console.log(result.data);
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}
/* 카테고리가져오기 */
function reloadcateList(data, ct,cateAllcnt) {
	var html ="";
	var html1 ="";
	if(data.length == 0 ) {
		html += "<span\">조회된 데이터가 없습니다.</span>";
	} else {
			html += "<li>                                                               ";
			html += "<a>카테고리 <span class=\"c_cnt\">("+cateAllcnt+")</span></a>                    ";
			html += "</li>                                                              ";
			html += "	<ul>                                                            ";
			html1 +="<select name=\"category_select\"; style=\"width : 100%;\">";
			if(typeof data.CT1 != "undefined") {
				html += "		<li>                                                        ";
				html += "			<a>"+data.CT1+" <span class=\"c_cnt\">("+ct[0]+")</span></a>            ";
				html += "		</li>						                                ";
				html1 +="	<option value=\"0\">"+data.CT1+"</option>            ";
			}
			if(typeof data.CT2 != "undefined") {
				html += "		<li>                                                        ";
				html += "			<a>"+data.CT2+" <span class=\"c_cnt\">("+ct[1]+")</span></a>        ";
				html += "		</li>						                                ";
				
				html1 +="	<option value=\"1\">"+data.CT2+"</option>            ";
			}
			if(typeof data.CT3 != "undefined") {
				html += "		<li>                                                        ";
				html += "			<a>"+data.CT3+" <span class=\"c_cnt\">("+ct[2]+")</span></a> ";
				html += "		</li>						                                ";
				
				html1 +="	<option value=\"2\">"+data.CT3+"</option>            ";
			}
			if(typeof data.CT4 != "undefined") {
				html += "		<li>                                                        ";
				html += "			<a>"+data.CT4+" <span class=\"c_cnt\">("+ct[3]+")</span></a>           ";
				html += "		</li>						                                ";
				html1 +="	<option value=\"3\">"+data.CT4+"</option>            ";
			}
			if(typeof data.CT5 != "undefined") {
				html += "		<li class=\"cate_CT\">                                                        ";
				html += "			<a>"+data.CT5+" <span class=\"c_cnt\">("+ct[4]+")</span></a>               ";
				html += "		</li>						                                ";
				html1 +="	<option value=\"4\">"+data.CT5+"</option>            ";
			}
			html += "	</ul>                                                           ";
			html1 +="</select>                                            ";
	}                                                                                  
//  	$(".category_list").html(html);
 	$(".category_get").html(html1);
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
					<input type="hidden" name="bm_no" id="bm_no" value="${sBmNo}"/>
					<div class="search_area">
						<select name="searchGbn" style="height: 100%;">
							<option value="0">제목</option>
							<option value="1">작성자</option>
							<option value="2">제목 + 작성자</option>
						</select>
						<input type="text" name="searchTxt"  style="height: calc(100% - 6px); vertical-align: top;"/>
						<input type="button" value="검색" id="searchBtn"  style="height: 100%;"/>
					
					<c:if test="${!empty sBmNo}">
						<input type="button" value="등록" id="writeBtn" style="height: calc(100%); vertical-align: top;"/>
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
	<div class="contents_area">
		<div class="table_area">
				<h1 style="font-size: 14pt;">글수정</h1>
				<div class="btn_area">
					<input class="btn" type="button" id="updateBtn" value="수정"/>
					<input class="btn" type="button" id="cancelBtn" value="취소"/>
				</div>
			<form action="#" id="updateForm" method="post">
				<table border="1" cellspacing="0" class="write_table">
					<tbody>
						<tr>
							<th>카테고리</th>
							<td>
								<div class="category_get">
									<select name="category_select" style="width : 100%;">
										<option value="0">${data.CT1}</option>
										<option value="1">${data.CT2}</option>
										<option value="2">${data.CT3}</option>
										<option value="3">${data.CT4}</option>
										<option value="4">${data.CT5}</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" style="width : 100%;" placeholder="제목" name="title" id="title" value="${data.B_TITLE}"/></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text"class="" style="width : 100%;"name="writer" id="writer" readonly="readonly" value="${sBmNm}"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="con"class=""style="width : 100%;" id="con" rows="10" cols="20">${data.B_CON}</textarea></td>
						</tr>
					</tbody>
				</table>
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
					<input type="hidden" name="searchTxt" value="${param.searchTxt}"/>
					<input type="hidden" name="no" value="${data.B_NO}"/>
					<input type="hidden" name="bmno" value="${sBmNo}"/>
					<input type="hidden" name="Details_no" value="${data.B_NO}"/>
					<input type="hidden" name="Details_bm_no" value="${data.BM_NO}"/>
				</form>
			<br>

		</div>
	</div>
</div>


</body>
</html>