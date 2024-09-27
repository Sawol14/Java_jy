<%@page import="myJSP.HelloWorld.HelloWorld"%>
<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비동기식 통신방식 - Ajax</title>
		
		<!--  // jquery v.3.7.1 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		
		<!--  // bootstrap v5.3.3 cdn -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	</head>
	
	<body>
		<%
		HelloWorld hello = new HelloWorld();
		String helloStr = hello.getWord();
		%>
		<%=helloStr%>
		
		<div id="div-table" class="bg-light mx-auto" style="border-style: inset; width: 900px; line-height: 300%;" >

			<h1 id="div-subject" style="color:red; font-weight: bold;"> 제목 </h1>
			<br>
			<h3 id="div-userId"> 작성자 </h3>
			<br>
			<div id="div-body"> 본문 </div>
			
		</div>
		<script>
			var postId = <%=request.getParameter("id")%>;
			var totalList;
			
			
			$(document).ready(function(){
				$.ajax({
					url: "https://jsonplaceholder.typicode.com/posts/" + postId, 
					type: "GET", 
					success: function(result) {
						$("#div-subject").html(result.title);
						$("#div-userId").html(result.userId);
						$("#div-body").html(result.body);
					}
				});
			});
			
		</script>
	</body>
</html>