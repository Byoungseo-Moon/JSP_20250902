<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 아이디는 최소 6글자 -->
<!-- 비밀번호는 특수문자 필수(정규식) -->
<!-- 비밀번호와 비밀번호 확인은 같아야 함 -->
<!-- 비밀번호는 8글자 이상 -->
<!-- 모든값은 빈값을 허용 x, 단 체크박스는 하나도 체크 안되도 됨 -->

	<form name="login" action="Join_Result.jsp" method="get">
	
		<div><label>아이디: <input name="userId"></label></div>
		<div><label>비밀번호: <input type="password" name="pwd"></label></div>
		<div><label>비밀번호확인: <input type="password" name="pwd1"></label></div>
		<div><label>이름: <input type="text" name="userName"></label></div>
		<div><label>핸드폰:
			<select name="phone">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select>
			<input type="text" size="3px"><input type="text" style="margin-left:3px;" size="3px"></label>		
		</div>
		<div>성별: 
			<label><input type="radio" name="gender" value="M" checked>남</label>
			<label><input type="radio" name="gender" value="F">여</label>
		</div>
		<div>취미:
			<label><input type="checkbox" name="hobby" value="운동">운동</label>			
			<label><input type="checkbox" name="hobby" value="독서">독서</label>			
			<label><input type="checkbox" name="hobby" value="영화감상">영화감상</label>			
			<label><input type="checkbox" name="hobby" value="코딩">코딩</label>			
			<label><input type="checkbox" name="hobby" value="게임">게임</label>		
		</div>
		<div>			 	
			<input type="button" value="가입" onclick="fnCheck()">
		</div>
		
	</form>

</body>
</html>

<script>
	
	function fnCheck(){
		
		let login = document.login;
		if(login.userId.value.length < 6){
			alert("아이디는 최소 6글자 입니다.");
			login.userId.focus();
			return;
		}
		
		if(login.pwd.value.length < 8){
			alert("비밀번호는 8글자 이상이어야 합니다.");
			login.pwd.focus();
			return;
		}
				
		// 정규식, 비밀번호 특수문자 포함 판단 정규식		
		let regExp = ^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,24}$;
		if(!regExp.test(login.pwd.value)){
			alert("비밀번호는 특수문자가 포함되어야 합니다.");
			login.pwd.focus();
			return;
		}	
		
		if(login.pwd.value != login.pwd1.value){
			alert("비밀번호를 확인해주세요.");
			login.pwd.focus();
			return;
		}
		
		if(login.userName.value.length == 0){
			alert("아이디를 입력해주세요.");
			login.userName.focus();
			return;
		}
				
		login.submit();
				
	}


</script>




