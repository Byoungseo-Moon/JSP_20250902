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
	
</style>	
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	
	<div id="container">
	<%	
		String empNo = request.getParameter("empNo");
		
		String query = "SELECT E.EMPNO, E.ENAME, E2.ENAME AS MGR_NAME, E.SAL, AVG_SAL, D.DNAME "
					 + "FROM EMP E "
					 + "INNER JOIN EMP E2 ON E.MGR = E2.EMPNO "
					 + "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
					 + "INNER JOIN (SELECT DEPTNO, AVG(SAL) AVG_SAL FROM EMP GROUP BY DEPTNO) T "
					 + "ON E.DEPTNO = T.DEPTNO "
					 + "WHERE E.EMPNO = '" + empNo + "'";
				
		try{
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()){			
	%>	
			 <div> 사번 : <%= rs.getString("EMPNO") %> </div>		
			 <div> 이름 : <%= rs.getString("ENAME") %> </div>	
			 <div> 매니저이름 : <%= rs.getString("MGR_NAME") %> </div>	
			 <div> 급여 : <%= rs.getString("SAL") %> </div>	
			 <div> 부서평균급여 : <%= rs.getString("AVG_SAL") %> </div>	
			 
			 
	<%
			} else{
				out.println("데이터 조회에 실패했습니다.");
			}	
	
			} catch(SQLException e){
				out.println("##오류가 발생했습니다.");
			}
	%>		 
 
		
	</div>		

</body>
</html>