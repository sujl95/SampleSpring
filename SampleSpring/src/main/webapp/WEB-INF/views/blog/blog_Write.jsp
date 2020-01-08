<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	$("#modifyBtn").on("click",function() {
		$("#actionForm").attr("action","blog_Modify");
		$("#actionForm").submit();
	});
	
	$("#categoryBtn").on("click",function() {
		$("#actionForm").attr("action","blog_Category");
		$("#actionForm").submit();
	});
	
	$(".setting").on("click",function(e) {
		if($(".setting_area").css("display") == "none"){ 
		 $(".setting_area")
	     .addClass("on")
		 .css({
	       left: "672px",
	       top: "37px"
	     });
		}
		 else {
			 $(".setting_area")
		     .removeClass("on");
		 }
	});
	CKEDITOR.replace("con", {
		resize_enabled : false,
		language : "ko", 
		enterMode : "2"
	});
	if('${res}' == 1){
		alert("로그인을 해주세요");
		location.href = "blog_Login";
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
				url : "bWriteAjax", //주소
				dataType :"json", //데이터 전송규격
				data : params, //보낼 데이터
				//{키 : 값, 키 : 값,...} -> json
				success : function(result) {
					if(result.res=="SUCCESS") {
						location.href = "blog_List";
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
function Categet() {
	var params = $("#actionForm").serialize();
	console.log(params);
	$.ajax({ 
		type : "post",
		url : "bCategetAjax",
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
 	$(".category_list").html(html);
 	$(".category_get").html(html1);
}
/* 글쓰기 */
function blog_write(data) {
	$("#writeBtn").on("click", function() {
		if((typeof data.CT1 == "undefined" )&&
		   (typeof data.CT2 == "undefined" )&&
		   (typeof data.CT3 == "undefined" )&&
		   (typeof data.CT4 == "undefined" )&&
		   (typeof data.CT5 == "undefined" )) {
			alert("카테고리가 없습니다 카테고리를 1개이상 설정해주세요");
			$("#actionForm").attr("action","blog_Category");
			$("#actionForm").submit();
		}
		else {
			location.href = "blog_Write";
		}			
	});
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
			<li>
				<a>카테고리 <span class="c_cnt">(0)</span></a>
			</li>
				<ul>
					<li>
						<a>카테고리1 <span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>카테고리2<span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>카테고리3<span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>카테고리4<span class="c_cnt">()</span></a>
					</li>						
					<li>
						<a>카테고리5<span class="c_cnt">(0)</span></a>
					</li>						
				</ul>
		</ul>
	</div>
</div>

<div class="whole_body">
	<div class="wrap">
		<div class="gnb_area">
			<div class="gnb_btn_area">
			<div class="gnb_search_area">
				 <form action="#" id="actionForm">
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
				<h1 style="font-size: 14pt;">글쓰기</h1>
				<div class="btn_area">
					<input class="btn" type="button" id="saveBtn" value="저장"/>
					<input class="btn" type="button" id="cancelBtn" value="취소"/>
				</div>
			<form action="#" id="saveForm" method="post">
				<input type="hidden" name="bm_no" value="${sBmNo}"/>
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
							<td><input type="text" style="width : 100%;" placeholder="제목" name="title" id="title"/></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text"class="" style="width : 100%;"name="writer" id="writer" readonly="readonly" value="${sBmNm}"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="con"class=""style="width : 100%;" id="con" rows="10" cols="20"></textarea></td>
						</tr>
					</tbody>
				</table>
			</form>
			<br>

		</div>
	</div>
</div>

</body>
</html>