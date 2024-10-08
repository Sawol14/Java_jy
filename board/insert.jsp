<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
		<!--  // 데이터를 입력받는 페이지 -->
		<!--
		// *** 필수 입력 사항
		// form:(Attribute-name,method,action)
		// input:입력태그(Attribute-name,value)
		-->
		<form id="frm" name="frm" method="POST" action="./process.jsp"> 
			과정명 : <input type="text" name="class_title" value="">
			<hr/>
			교육기간 : <input type="text" name="class_date" value="">
			<hr/>
			교육시간 : <input type="text" name="class_time" value="">
			<hr/>
			모집정원 : <input type="text" name="class_std" value="">
			<hr/>
			
			<button type="submit">저장</button> 
		</form>
	
	</body>
</html>