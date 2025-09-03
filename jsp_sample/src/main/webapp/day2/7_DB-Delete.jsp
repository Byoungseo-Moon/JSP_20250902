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
		// 학번 xxxx 삭제
		String stuNo = "12345679";
		String query = "DELETE FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		int result = stmt.executeUpdate(query); // update, delete, insert 는 숫자로 회신

		if(result > 0){
			out.println("삭제되었습니다.");
		} else{
			out.println("없는 학번입니다.");
		}
	%>

</body>
</html>