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
	<body class="bg-light">
			<table  class="bg-light mx-auto" style="border-style: inset; width: 80%; height: 100%">	
				<tbody id="div-table">
					
				</tbody>
			</table>

		<script>
			
		$(document).ready(function() {
			
			var albumsList;
			var photosList;
			
			function loadList(list) {
				var html = "";
				for ( var i = 1 ; i < list.length/6 ; i++ ) {	
					html += "<tr>";
					for( var j = 1; j < 6; j ++){			
						html +=	"<td><a class='text-decoration-none' href='./photos.jsp?id="+list[i*j].userId+"'style='color:#13bb00;'>";
						html +=	"<div style='display: block; text-align: center;  height:100px; border: 1px solid #BDBDBD; background-color: #CEF6EC'>"
									+ list[i*j].title
									+ list[i*j].id
									+ "</div>";
						html += "</a></td>";
						
					}
					html +="</tr>";
				}
				$("#div-table").append(html);
			}
			
			
			$.ajax({
				url: "https://jsonplaceholder.typicode.com/albums", 
				type: "GET", 
				success: function(result) {
					albumsList = result;
					
					$.ajax({
						url: "https://jsonplaceholder.typicode.com/photos", 
						type: "GET", 
						success: function(result) {
							loadList(albumsList);
						}
					});
						
				}
			});
			
			
			
			
			
			
		});
		</script>
	</body>
</html>