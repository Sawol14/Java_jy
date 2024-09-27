<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
 		<meta charset="UTF-8">
 		<title> USER - Ajax </title>
 		
 		<!-- //jquery v.3.7.1 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		 		
 		<!-- //bootstrap v5.3.3 cdn -->
 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		
	</head>
	<body class="bg-light ">
		
		<div id="div-table" class="bg-secondary mx-auto" style="width: 80%; min-width: 800px;">
		
			<table class="table text-center table table-striped">
				<thead class="table-dark">
					<tr>
						<th> #</th>
						<th> 이름 </th>
						<th> 사용자명 </th>
						<th> 이메일 </th>
						<th> 주소 </th>
						<th> 우편번호 </th>
						<th> 연락처 </th>
						<th> 웹사이트 </th>
						<th>  </th>
					</tr>
				</thead>
				<tbody id="list">				
					
				</tbody>
			</table>
			<button id="btn-more" class="btn btn-primary w-100"> 더보기</button>
		</div>
		<script>
			$(document).ready(function() {		
				var json;
				var listCount = 5;	
				function loadList(list, start, end) {
					var html = "";
					for (var i = start; i < end; i ++){
						html += "<tr>";
						html += "<td>"+list[i].id+"</td>";
						html += "<td>"+list[i].name+"</td>";
						html += "<td>"+list[i].username+"</td>";
						html += "<td>"+list[i].email+"</td>";
						html += "<td>"+
						list[i].address.street+" "+
						list[i].address.suite+" "+
						list[i].address.city+" "+
						"</td>";
						html += "<td>"+list[i].address.zipcode+"</td>";
						html += "<td>"+list[i].phone+"</td>";
						html += "<td>"+list[i].website+"</td>";
						
						html += "</tr>";
					}
					$("#list").append(html);
				}
			
			$.ajax({
				url: "https://jsonplaceholder.typicode.com/users",
				type: "GET",
				success: function(data) {
					json = data;
					loadList(json, 0, 5);					
				},
				
					
			});
		var clickAdd = 1;
			$("#btn-more").on("click", function() {
				var start = listCount*clickAdd;
				var end = listCount*(clickAdd+1);
				if (end >= json.length) { 
					end = json.length;
					$("#btn-more").hide();
				}
				

				loadList(json, start, end );
				clickAdd++;
				
			});
		
		});
		
		</script>
	</body>
</html>