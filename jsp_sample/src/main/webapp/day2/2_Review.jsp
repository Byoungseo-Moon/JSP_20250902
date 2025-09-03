<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- form 태그  -->
		<!-- submit이 실행됐을 때, action에 있는 page로 이동함  -->
		<!-- action page로 이동시, input tag(select, textarea)의 name이 key역할을 함 -->
		
		<form name="verification" action="3_Review.jsp">
			<div> 이름 : <input name="userName"></div>
			<div> 나이 : <input name="age"></div>
			<div>
				<input type="submit" value="전달"> <!--default는 제출로 되어 있음 -->
				<input type="button" value="검증후 전달" onclick="fnCheck()">
			</div>		
		
		</form>

</body>
</html>

<script>
	function fnCheck(){
		let verification = document.verification;
		if(verification.userName.value.length == 0){
			alert("이름을 입력해 주세요.");
			verification.userName.focus();
			return;
		}
		
		verification.submit();
	}



</script>