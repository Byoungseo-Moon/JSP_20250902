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
		margin: 20px auto;
	}
	table, tr, td, th{
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th{
		backgroud-color: gray;
		
	}		
	tr:nth-child(odd){
		background-color:azure; 
	}
	.grade{
		color: blue;
		font-weight: bold;
	}
	
	a{
		color:black;
		text-decoration: none;		
	}
	
</style>	

</head>
<body>
	<%@ include file="../db/db.jsp" %> 
	
	<%
		//사원들의 급여등급, 부서이름 포함하여 조회
		String query = "SELECT EMPNO, ENAME, JOB, SAL, DNAME, GRADE FROM EMP E "
		               + "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO " 
		               + "INNER JOIN SALGRADE S ON E.SAL BETWEEN LOSAL AND HISAL " 
		               + "ORDER BY GRADE DESC";
		/* out.println(query); */
		
		ResultSet rs = stmt.executeQuery(query);
	%>
	 <div id="container">
	
	  <table>
			<tr style="font-weight:bold; background-color:gray; color:white;">
				<td>사번</td>
				<td>이름</td>
				<td>직위</td>
				<td>급여</td>
				<td>부서</td>
				<td>급여등급</td>
			</tr>	
	<%	
		 while(rs.next()){
			 int grade = rs.getInt("GRADE");
	%>
			<tr <%= grade >=4 ? "class='grade'" : "" %>>
				<td><%= rs.getString("EMPNO") %></td>
				<td><a href="Emp-View.jsp?empNo=<%=rs.getString("EMPNO")%>"><%= rs.getString("ENAME") %></a></td>
				<td><%= rs.getString("JOB") %></td>
				<td><%= rs.getString("SAL") %></td>
				<td><%= rs.getString("DNAME") %></td>
				<td><%= rs.getString("GRADE") %></td>
			</tr>				
	<%
		 }
	%>				
	  </table>
	  
	  <a href="Emp-Add.jsp"></a>
	   <input type="button" value="사원추가">
	  </a>
		
	</div>


</body>
</html>