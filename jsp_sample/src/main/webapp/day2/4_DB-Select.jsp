<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../db/db.jsp" %> <!-- db 연결 jsp  -->
	<%
		ResultSet rs = null;
		String query = "SELECT * FROM STUDENT";
		rs = stmt.executeQuery(query);
		
		/*
		rs.next(); // 커서이동후 data가 있으면 true, 없으면 false
		String stuName = rs.getString("STU_NAME"); // 해당 커서가 있는 행의 학생이름 출력
		out.println(stuName + " ");*/
		
		while(rs.next()){
			out.println(rs.getString("STU_NAME") + " "); // html문법상 println은 줄바꿈 않함		
		}		
	%>
	






</body>
</html>