/**
 * Main.js
 */
$(document).ready(function() {

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
	
	$(".whole_body").slimScroll({
		width: "968px",
		height: "100%"
	});
});
//카테고리 가져오기(글쓰기,수정)
function WCateget() {
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
//카테고리 가져오기
function Categet() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "bCategetAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			blog_write(result.data);
			reloadcate(result.data, result.CT, result.cateAllcnt);
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}
/* 카테고리 가져오기 (글쓰기,수정)*/
function reloadcateList(data, ct,cateAllcnt) {
	var html ="";
	var html1 ="";
	
	if(typeof data == "undefined") {
		html += "<span\">조회된 데이터가 없습니다.</span>";
	} else {
//		html += " <form action=\"#\" id=\"cateForm\" method=\"post\">";
		html += "		<li name=\"category_num\" id=\"category_num\" value=\"0\">                                                        ";
		html += "<a>전체 <span class=\"c_cnt\">("+cateAllcnt+")</span></a>                    ";
		html += "</li>                                                              ";
		html += "	<ul class=\"category_list_area\">                                                            ";
		html1 +="<select name=\"category_select\"; style=\"width : 100%;\">";
		if(typeof data.CT1 != "undefined") {
			html += "		<li name=\"category_num\" id=\"category_num\" value=\"1\">                                                        ";
			html += "			<a>"+data.CT1+" <span class=\"c_cnt\">("+ct[0]+")</span></a>            ";
			html += "		</li>						                                ";
			html1 +="	<option value=\"0\">"+data.CT1+"</option>            ";
		}
		if(typeof data.CT2 != "undefined") {
			html += "		<li name=\"category_num\" id=\"category_num\" value=\"2\">                                                        ";
			html += "			<a>"+data.CT2+" <span class=\"c_cnt\">("+ct[1]+")</span></a>        ";
			html += "		</li>						                                ";
			
			html1 +="	<option value=\"1\">"+data.CT2+"</option>            ";
		}
		if(typeof data.CT3 != "undefined") {
			html += "		<li name=\"category_num\" id=\"category_num\" value=\"3\">                                                        ";
			html += "			<a>"+data.CT3+" <span class=\"c_cnt\">("+ct[2]+")</span></a> ";
			html += "		</li>						                                ";
			
			html1 +="	<option value=\"2\">"+data.CT3+"</option>            ";
		}
		if(typeof data.CT4 != "undefined") {
			html += "		<li name=\"category_num\" id=\"category_num\" value=\"4\">                                                        ";
			html += "			<a>"+data.CT4+" <span class=\"c_cnt\">("+ct[3]+")</span></a>           ";
			html += "		</li>						                                ";
			html1 +="	<option value=\"3\">"+data.CT4+"</option>            ";
		}
		if(typeof data.CT5 != "undefined") {
			html += "		<li name=\"category_num\" id=\"category_num\" value=\"5\">                                                        ";
			html += "			<a>"+data.CT5+" <span class=\"c_cnt\">("+ct[4]+")</span></a>               ";
			html += "		</li>						                                ";
			html1 +="	<option value=\"4\">"+data.CT5+"</option>            ";
		}
		html += "	</ul>                                                           ";
//		html += "</form>";
		html1 +="</select>                                            ";
	}                                                                                  
	$(".category_list").html(html);
	$(".category_get").html(html1);
}
/* 카테고리가져오기 */
function reloadcate(data, ct,cateAllcnt) {
	var html ="";
	if(typeof data == "undefined") {
		html += "<span\">조회된 데이터가 없습니다.</span>";
	} else {
//			html += " <form action=\"#\" id=\"cateForm\" method=\"post\">";
		html += "		<li name=\"category_num\" id=\"category_num\" value=\"0\">                                                        ";
			html += "<a>전체 <span class=\"c_cnt\">("+cateAllcnt+")</span></a>                    ";
			html += "</li>                                                              ";
			html += "	<ul class=\"category_list_area\">                                                            ";
			if(typeof data.CT1 != "undefined") {
				html += "		<li name=\"category_num\" id=\"category_num\" value=\"1\">                                                        ";
				html += "			<a>"+data.CT1+" <span class=\"c_cnt\">("+ct[0]+")</span></a>            ";
				html += "		</li>						                                ";
			}
			if(typeof data.CT2 != "undefined") {
				html += "		<li name=\"category_num\" id=\"category_num\" value=\"2\">                                                        ";
				html += "			<a>"+data.CT2+" <span class=\"c_cnt\">("+ct[1]+")</span></a>        ";
				html += "		</li>						                                ";
			}
			if(typeof data.CT3 != "undefined") {
				html += "		<li name=\"category_num\" id=\"category_num\" value=\"3\">                                                        ";
				html += "			<a>"+data.CT3+" <span class=\"c_cnt\">("+ct[2]+")</span></a> ";
				html += "		</li>						                                ";
			}
			if(typeof data.CT4 != "undefined") {
				html += "		<li name=\"category_num\" id=\"category_num\" value=\"4\">                                                        ";
				html += "			<a>"+data.CT4+" <span class=\"c_cnt\">("+ct[3]+")</span></a>           ";
				html += "		</li>						                                ";
			}
			if(typeof data.CT5 != "undefined") {
				html += "		<li name=\"category_num\" id=\"category_num\" value=\"5\">                                                        ";
				html += "			<a>"+data.CT5+" <span class=\"c_cnt\">("+ct[4]+")</span></a>               ";
				html += "		</li>						                                ";
			}
			html += "	</ul>                                                           ";
//			html += "</form>";
	}                                                                                  
 	$(".category_list").html(html);
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


