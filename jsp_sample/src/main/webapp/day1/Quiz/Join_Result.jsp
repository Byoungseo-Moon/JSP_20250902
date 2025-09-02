<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 위에서 받은 결과들을 출력 -->
<!-- 취미는 2개이상일 경우 모두 출력 -->

	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");	
	
	%>

	<div>아이디 : <%= userId %></div>
	<div>비밀번호 : <%= pwd %></div>
	<div>이름 : <%= userName %></div>
	<div>번호 : <%= phone %></div>
	<div>성별 : <%= gender.equals("M") ? "남자" : "여자" %></div>
	

</body>
</html>