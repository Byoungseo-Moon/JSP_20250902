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
	#search, select{
		margin-bottom: 5px;
	}
	a {
		text-decoration: none;
	}
	.page a{
		text-decoration: none;
		color: black;
		padding: 3px;
		text-align: center;
	}
	
	.page .active{
		font-weight: bold;
		/* font-size:5px; */
	}
	
</style>
</head>
<body>

  <%@ include file="../db/db.jsp" %>

  <div id="container">
  	<%
  	String keyword = request.getParameter("keyword");
  	%>
  
  	<div id="search" >
  		검색어 : <input type="text" id="keyword" value="<%= keyword !=null ? keyword : "" %>" >  		
  		<button onclick="fnSearch()">검색</button>
  	</div>
  	
  	<div>
  		<select id="number" onchange="fnNumber(this.value)">
  			<%
  				int arr[] = {3,8,15,20,30};
  				for(int i=0; i<arr.length; i++){
  			%>
  					<option value="<%= arr[i] %>"><%= arr[i] + "개씩" %></option>
  			<%		
  				}  			
  			%> 	  	
  		</select> 
  	</div> 	
  
  	<table>
  		<tr>
  			<th>번호</th>
  			<th>제목</th>
  			<th>작성자</th>
  			<th>
  			<%
  				String orderKind = request.getParameter("orderKind");
  				if(orderKind == null){
  			%>
  				<a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수</a>
  			<%		
  				} else if(orderKind.equals("DESC")){
  			%>
  				<a href="javascript:;" onclick="fnList('CNT', 'ASC')">조회수▼</a>	
  			<%		
  				} else {
  			%>
  				<a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수▲</a>
  			<%  					
  				}
  			%>
  			</th>
  			  				
  			<th>작성일</th> 		
  		</tr>
 	
	<%
		ResultSet rs = null;
		/* String keyword = request.getParameter("keyword"); */
		out.println(keyword);
				
		String keywordQuery = "";
		if(keyword != null){
			keywordQuery = "WHERE TITLE LIKE '%" + keyword + "%' ";
		}
		
		String column = request.getParameter("column");
		/* String orderKind = request.getParameter("orderKind"); */
		String orderQuery = "";
		if(column != null){
			orderQuery = "ORDER BY " + column + " " + orderKind;
		}
		
		/* 페이징 변수*/
		int pageSize = 5; // page당 몇 페이지 보여줘
		int currentPage = 1;
		if(request.getParameter("size") != null){
			pageSize = Integer.parseInt(request.getParameter("size"));
		}
		
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		/* 페이지당 5개씩. 현재 페이지 위치에 따라서 가져올 값을 정하기 위해 offset 구하기*/
		int offset = (currentPage - 1) * pageSize;
		
		
		String cntQuery = "SELECT COUNT(*) TOTAL FROM TBL_BOARD " + keywordQuery;
		ResultSet rsCnt = stmt.executeQuery(cntQuery);
		
		rsCnt.next();
		
		int total = rsCnt.getInt("TOTAL");
		out.println(total);
		
		int pageList = (int) Math.ceil((double) total / pageSize); 
		out.println(pageSize);
		out.println(pageList);
		
		String query = "SELECT B.*, TO_CHAR(CDATETIME,'YYYY-MM-DD') CTIME "
				      + "FROM TBL_BOARD B " + keywordQuery + orderQuery
				      + " OFFSET " + offset + " ROWS FETCH NEXT " + pageSize
				      + " ROWS ONLY";
		               
		/* System.out.println(query); */
		rs = stmt.executeQuery(query);
		  // 각변수값 = rs.getString("각변수명");
		  
		while(rs.next()){			
	%>		
			<tr>
				<td> <%= rs.getString("BOARDNO") %> </td>
				<td>
					<%-- <a href="Board-View.jsp?boardNo=<%= rs.getString("BOARDNO") %>">
					   <%= rs.getString("TITLE") %></a> --%>
					<a href="javascript:;" onclick="fnBoard(<%= rs.getString("BOARDNO") %>)">
					   <%= rs.getString("TITLE") %></a>   
				</td>
				<td> <%= rs.getString("USERID") %> </td>
				<td> <%= rs.getString("CNT") %> </td>
				<td> <%= rs.getString("CTIME") %> </td>
			</tr>		
	<%	
		}
		
	%>
		
  	</table>
  	
  	<div class="page">
	  	<%
	  		if(!(total < pageSize)){
		  		for(int i=1; i<=pageList; i++){
		  			if(i == currentPage){
		  				out.println("<a href='?page=" + i + "&size=" + pageSize + "&keyword=" + keyword + "' class='active'>" + i + "</a>");
		  			} else {
		  				out.println("<a href='?page=" + i + "&size=" + pageSize + "&keyword=" + keyword + "'>" + i + "</a>");
		  			}
		  		}
	  		} 
	  	
	  	%>
  	</div>
  	
  	
  	
  	<div>
  		<a href="Board-Add.jsp">
  			<input type="button" value="글쓰기">
  		</a>
  	</div>
	
	</div>
	
	<input id="pageSize" value="<%= pageSize %>" hidden>
		

</body>
</html>

<script>

	let size = document.querySelector("#pageSize").value;	
	let selectList = document.querySelector("#number");
	
	for(let i=0; i<selectList.length; i++){
		if(selectList[i].value == size ){
			selectList[i].selected = true;
		}		
	}		

	
	function fnBoard(boardNo){
		location.href = "Board-View.jsp?boardNo=" + boardNo;
	}
	
	
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href = "Board-List.jsp?keyword=" + keyword
						+ "&size=" + size ;		
	}
	
	
	function fnList(column, orderKind){
		location.href="?column=" + column  //자신페이지로 가는 경우 파일이름 생략 가능 
	                  + "&orderKind=" + orderKind; 
	}
	
	
	function fnNumber(number){
		location.href="?size=" + number;
	}

</script>