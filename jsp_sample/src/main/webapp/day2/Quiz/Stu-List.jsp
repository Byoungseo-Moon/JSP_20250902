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
		backgroud-color: azure;
		color:blue;
		width:100px;
	}
	
	
	tr:nth-chile(odd){
		background-color:azure; 
	}
	#search{
		margin-bottom: 5px;
	}

</style>
</head>
<body>

 <%@ include file="../../db/db.jsp" %>


	<div ID="container">
	
	<div id="search">
  		검색어 : <input type="text" id="keyword">
  		<button onclick="fnSearch()">검색</button>
  		
  	</div>
   
  	<table>
  		<tr>
  			<th>학번</th>
  			<th>이름</th>
  			<th>학과</th>
  			<th>키</th>  					
  		</tr>
 	
	<%
		ResultSet rs = null;	
		String query = "SELECT * FROM STUDENT";		               
		rs = stmt.executeQuery(query);		  
		  
		while(rs.next()){			
	%>		
			<tr>
				<td> <%= rs.getString("STU_NO") %> </td>
				<td>
					<a href="javascript:;" onclick="fnBoard(<%= rs.getString("STU_NO") %>)"> <%= rs.getString("STU_NAME") %></a>
				</td>
				<td> <%= rs.getString("STU_DEPT") %> </td>
				<td> <%= rs.getString("STU_HEIGHT") %> </td>
			</tr>		
	<%	
		}
		
	%>

		
  	</table>
	
	</div>

</body>
</html>

<script>

	function fnBoard(boardNo){
		location.href = "Board-View.jsp?boardNo=" + boardNo;
	}

	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		out.println(keyword);
		location.href = "Stu-List.jsp?keyword=" + keyword;
	}

</script>




