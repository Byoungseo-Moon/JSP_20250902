<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- form tag의 action을 실행하면(submit)하면 내부에 있는 input박스 값들을 파라미터로 보낸다
	      이때, name 속성이 Key, 입력값은 Value로 됨  -->
	<!-- 메소드속성(전송방식)은 생략이 가능하고, default는 get방식임.
	     get방식은 url에 값을 담아서 보내어 보안에 취약함 
	     사용자 개인정보 및 패스워드등 전송할 때는 사용하면 않됨
	     간단한 정보를 보낼때 사용. 처리속도는 빠름-->
	    <!-- POST방식은 데이터를 숨겨서 보냄  -->
	    <!-- 실습은 데이터확인을 위해 get방식으로 함  -->
	      
	<form action="8_LoginResult.jsp" method="post">
		<div>
			<label>아이디 : <input type="text" name="userId" ></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<input type="submit" value="이동"> <!-- 실행시 form 태그의 action에 있는 page로 옮겨짐  -->
		</div>		
	
	</form>

</body>
</html>