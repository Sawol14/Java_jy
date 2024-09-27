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
		<!-- modal -->
		
	</head>
	
	<body>
		
		
		<table  class="bg-light mx-auto" style="border-style: inset; width: 80%; height: 100%">	
				<tbody id="div-table">
					
				</tbody>
			</table>
		
		
		
		<script>
			var albumIdr = <%=request.getParameter("id")%>;
			var photosList;
			var html = "";
			
			$(document).ready(function(){
				$.ajax({
					url: "https://jsonplaceholder.typicode.com/photos",
					type: "GET", 
					success: function(result) {
						photosList = result;
						for(var j=0 ; j < photosList.length/5; j++){
							for(var i = 0 ; i < 5; i++){	
								if(photosList[i].albumId == albumIdr){
								html += "<div class=\"card\" style=\"width: 18rem;\">";
								html +=	"  <img src=\"" + photosList[j*i].thumbnailUrl + "\" class= \"card-img-top\" />";
								html +=	"  <div class=\"card-body\">";
								html +=	"    <h5 class=\"card-title\">"+photosList[j*i].title+"</h5>";
								html +=	"    <p class=\"card-text\"></p>";
								html += "<a href=\""+photosList[j*i].url+"\" class=\"btn btn-primary\">원본 보기</a>";
								html += "</div>";
								html += "</div>";	
								}
							}
						}
						$("#div-table").append(html);
					}
					
					
				});
			});
			
		</script>
	</body>
</html>