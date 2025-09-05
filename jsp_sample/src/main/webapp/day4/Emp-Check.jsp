<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <%@ include file="../db/db.jsp" %>
     
  <%  
  	String empNo = request.getParameter("empNo");
  	String query = "SELECT * FROM EMP "
  				  + "WHERE EMPNO = '" + empNo + "'";
  	ResultSet rs = stmt.executeQuery(query);
  	
  	if(rs.next()){  		
  		out.println("이미사용중인 사번!");
  		out.println("<input id='check' value='Y' hidden>");
  %>
  		<div>이미 사용중인 사번입니다.</div>
        <input id="check" name="flg" value="Y" hidden> 
  <%
  	} else {
  		out.println("사용 가능한 사번!");
  		out.println("<input id='check' value='N' hidden>");
  %>
  		<div> 사용가능한 사번입니다.</div> 
  		<input id="check" name="flg" value="N" hidden> 
   <%
  	}
   %>
  
  <div>
  	<input type="button" value="되돌아가기" onclick="fnBack()">
  </div>
  

</body>
</html>

<script>

	function fnBack(){
		let flg = document.querySelector("#check").value;
		window.opener.fnReturn(flg);
		window.close();		
	}

</script>