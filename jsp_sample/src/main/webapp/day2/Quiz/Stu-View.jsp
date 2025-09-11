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
		ResultSet rs = null;
		String stuName = request.getParameter("stuName");
		
		String query = "SELECT * FROM STUDENT S "
				       + "INNER JOIN ("
				       + "SELECT STU_NO, AVG(ENR_GRADE) FROM ENROL GROUP BY STU_NO) T "
				       + " ON S.STU_NO = T.STU_NO";
		rs = stmt.executeQuery(query);
		if(rs.next()){
	%>
	  <form name="form" action="Stu-Remove.jsp">	
	    <input name="stuNo" value="<%=rs.getString("STU_NO") %> "hidden">
		<table>
		  	<tr>
		  		<th>학번</th>
		  		<td><%= rs.getString("STU_NO") %></td>	  		
		  	</tr>
		  	<tr>
		  		<th>이름</th>
		  		<td><%= rs.getString("STU_NAME") %></td>	  		
		  	</tr>
		  	<tr>
		  		<th>학과</th>
		  		<td><%= rs.getString("STU_DEPT") %></td>	  		
		  	</tr>
		  	<tr>
		  		<th>시험평균점수</th>
		  		<td><%= rs.getString("ENG_GRADE") %></td>	  		
		  	</tr>
				  		
		  </table>
		  
		  <div>
		  	<inout type="button" value="삭제" onclick="fnRemove()">		  
		  </div>
		 </form>
	 <%
		} else {
		 out.println("게시글 조회에 실패했습니다.");
		} 
	 %>
	</div>
		

</body>
</html>

 <script>
 	function fnRemove(){
 		let form = document.form;
 	if(!confirm)({"정말 삭제 하시겠습니까?")
 		return;
 	}
 		form.submit();
 	}
 	 
 </script>





