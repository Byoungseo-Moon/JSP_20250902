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
	<!-- insert하기전에 db에 있는지 확인하고 
	     없으면 insert, 있으면 '해당 학번은 이미 사용중입니다.' 출력 -->
	
	<%
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		
		ResultSet rs = null;
		String query = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		rs = stmt.executeQuery(query);
		
		if(rs.next()){		
			out.println("해당 학번은 이미 사용중입니다.");					
		} else {
			String query1 = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) VALUES ("
				      + "'" + stuNo + "',"
				      + "'" + stuName + "',"
				      + "'" + stuDept + "'"
				      + ")";
			// INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT)
			// VALUES('12345679', '홍길동', 'DDDDD');
			//out.println(query1);
			
			int result = stmt.executeUpdate(query1);
			out.println("추가되었습니다.");	
		}
	
	%>
	
	
	
	

</body>
</html>