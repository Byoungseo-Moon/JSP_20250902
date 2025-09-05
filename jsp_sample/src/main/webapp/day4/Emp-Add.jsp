<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input[readonly]{
		backgound-color: #eee;
		border : 2px solid #eee;
	}

</style>
</head>
<body>

	<%@ include file="../db/db.jsp" %> 
	<form name="form" action="Emp-Add-Result.jsp">
	
		<div>
			사번 : <input name="empNo">
			<input type="button" value="중복체크" onclick="fnCheck(); return false">
		</div>
		<div>
			이름 : <input name="empName">
		</div>
		<div>
			급여 : <input name="sal">
		</div>
		<div>부서 : 
			<label><input name="deptNo" type="radio" value="10" checked> ACCOUNTING</label>
			<label><input name="deptNo" type="radio" value="20"> RESEARCH</label>
			<label><input name="deptNo" type="radio" value="30"> SALES</label>
			<label><input name="deptNo" type="radio" value="40"> OPERATIONS</label>
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>

	</form>


</body>
</html>

<script>

	let addFlg = false;
	function fnAdd(){
		let form = document.form;
		if(addFlg){
			form.submit();
		} else{
			alert("중복체크 확인 후 제출해 주세요.")
		}
	}
	
	function fnCheck(){
		let form = document.form;
		let empNo = form.empNo.value;
		window.open(`Emp-Check.jsp?empNo=\${empNo}`, "check", "width=300, height=300");
	}
	
	function fnReturn(flg){
		let form = document.form;
		if(flg =="N"){
			let obj = form.empNo;
			obj.readOnly = true;
			addFlg = true;
		}
		/* 
		if(flg =="N"){
			let form = document.form;
			form.empNo.disabled = true;
			addFlg = true;
		}	 */	
	}

	
</script>




