<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".logo_wrap").on("click",function() {
			location.href = "blog_Main";
		});
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
	<div class="contents_area">
		<div class="table_area">
				<h1 style="font-size: 14pt;">글쓰기</h1>
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
		</div>
	</div>
</div>

</body>
</html>