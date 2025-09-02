<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 디렉티브는 파일을 한곳에 다 모은 다음에 컴파일 실행  -->
	<%@ include file="Variable.jsp" %>
	<hr>
	
	<!-- 액션태그는 각 파일에서 먼저 컴파일 실행하고, 그 결과를 모아서 출력  --> <!-- 이런 경우엔 에러가 발생함-->
	<%-- <jsp:include page="Variable.jsp"></jsp:include>	 --%>
	
	<%= num1 + num2 %>
	
</body>
</html>