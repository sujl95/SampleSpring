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
	
});