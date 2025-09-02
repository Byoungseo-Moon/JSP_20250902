<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 외부 클래스는 import해서 사용한다 -->
	<!-- 자라랑 import방법에 차이가 있다. html에서 작성해야하기 때문에 -->
	
	<%@ page import="java.util.Date" %>
	<%= new Date().toLocaleString() %>

</body>
</html>