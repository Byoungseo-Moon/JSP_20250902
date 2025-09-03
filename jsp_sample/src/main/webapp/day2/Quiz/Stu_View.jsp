<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width:700px;
		margin: 50px auto;
		
	table, tr, td, th{
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th{
		background-color:azure;	
		width:70px; 
	}
	td{
		width:400px;
	}
</style>
</head>
<body>

	<%@ include file="../../db/db.jsp" %>
	<div id="container">	
	<%
	    String stuName = request.getParameter("stuName");
		ResultSet rs = null;
		String query = "SELECT * FROM STUDENT S "
				       + "INNER JOIN ("
				       + "SELECT STU_NO, AVG(ENR_GRADE) FROM ENROL GROUP BY STU_NO) T "
				       + " ON S.STU_NO = T.STU_NO";
		rs = stmt.executeQuery(query);
		if(rs.next()){
	%>
	
		<table>
		  	<tr>
		  		<th>학번</th>
		  		<td><%= rs.getString("TITLE") %></td>	  		
		  	</tr>
		  	<tr>
		  		<th>이름</th>
		  		<td><%= rs.getString("USERID") %></td>	  		
		  	</tr>
		  	<tr>
		  		<th>학과</th>
		  		<td><%= rs.getString("CTIME") %></td>	  		
		  	</tr>
		  	<tr>
		  		<th>시험평균점수</th>
		  		<td><%= rs.getString("CONTENTS") %></td>	  		
		  	</tr>
				  		
		  </table>	
	

</body>
</html>