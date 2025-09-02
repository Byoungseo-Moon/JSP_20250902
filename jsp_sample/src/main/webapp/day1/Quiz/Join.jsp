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


		<div><label>아이디: <input type="text"></label></div>
		<div><label>비밀번호: <input type="password"></label></div>
		<div><label>비밀번호확인: <input type="password"></label></div>
		<div><label>이름: <input type="text"></label></div>
		<div>핸드폰:
			<select>
				<option>010</option>
				<option>011</option>
				<option>017</option>
				<option>019</option>
			</select>		
		</div>
		<div>성별: 
			<input type="radio" name="gender" checked><label>남</label>
			<input type="radio" name="gender"><label>여</label>
		</div>
		<div>취미:
			<label><input type="checkbox" name="hobby" value="운동">운동</label>			
			<label><input type="checkbox" name="hobby" value="코딩">독서</label>			
			<label><input type="checkbox" name="hobby" value="독서">영화감상</label>			
			<label><input type="checkbox" name="hobby" value="영화감상">코딩</label>			
			<label><input type="checkbox" name="hobby" value="게임">게임</label>		
		</div>
		<div>
			<button>가입</button> 	
		</div>





</body>
</html>