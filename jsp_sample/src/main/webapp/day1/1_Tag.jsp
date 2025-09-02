<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자동주석 ctrl shift /  -->
	<!-- 선언문  
	     자바문법으로 벼누나 메소드 선언-->
	     <%! 
	     	String name = "홍길동"; // 전역변수
	     	
	     	int sum(int x, int y){ // 메소드
	     		return x+y;
	     	}
	     %> 	    
	     
	<!-- 표현식 -->
	<!-- 선언문이나 스클립틀릿에서 선언된 값(변수 메소드등)을 출력 -->
	<!-- 메소드는 리턴타입이 있는 메소드가 호출가능 -->
	<div style="color:blue;"><%= name %></div>
	<h2><%= sum(1,5) %></h2>
	
	
	<!-- 스크립틀릿 -->
	<!-- 자바의 실행문을 그대로 표현(자바문법들 사용가능  -->
	<!-- 변수선언은 가능하나, 지역변수로 선언됨  -->
	<!-- 메소도 선언은 불가하고, 호출은 가능함 -->
	<%
		System.out.println(name + "입니다."); // 콘솔창에서 출력
		out.println("<h1>" + name + "입니다.</h1>"); // 브라우저에 출력
		
		for(int i=1; i<=10; i++){
			if(i%2 == 0){out.print(i + " ");}		
		}
	%>
	
	
	
	

</body>
</html>