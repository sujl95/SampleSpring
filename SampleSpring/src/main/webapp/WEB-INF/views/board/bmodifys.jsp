<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
if('${res}' == 1 ) {
	alert("회원 정보수정에 성공하였습니다");
	location.href = "bMain";
} else if('${res}' == 2 ) {
	alert("회원 정보수정에 실패하였습니다");
	history.back();
} else {
	
}
	
</script>
</head>
<body>

</body>
</html>