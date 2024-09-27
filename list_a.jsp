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
		
		<div id="div-table" class="bg-secondary mx-auto" style="width: 900px;"> 
		
			<table class="table text-center">
				<thead class="table-dark">
					<tr>
						<th> # </th> <!-- id -->
						<th> 제목 </th> <!-- title -->
						<th> 글쓴이 </th> <!-- userid > userName -->
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>
			<button id="btn-more" class="btn btn-primary w-100"> 더보기 </button>
		
		</div>
		
		<script>

			$(document).ready(function() {
				var userList;
				var name="";
				var totalList;
				
				$.ajax({
					url: "https://jsonplaceholder.typicode.com/posts", 
					type: "GET", 
					success: function(result) {
						totalList = result;
						
						$.ajax({
							url: "https://jsonplaceholder.typicode.com/users", 
							type: "GET", 
							success: function(result) {
								userList = result;
								loadList(totalList, 0, 15);
							}
						});
							
					}
				});
				

				function loadName(userID){
					for( var j = 0; j < userList.length; j++){
						if(userList[j].id == userID){
							name = userList[j].name;
							break;
						}else name = "이름없음";
					}
				}
				
				function loadList(list, start, end) {
					var html = "";
					for ( var i = start ; i < end ; i++ ) {	
						loadName(list[i].userId);
						html += "<tr>";
						html += "<td>" + list[i].id + "</td>";
						html += "<td><a class='text-decoration-none' href='./view.jsp?id="+ list[i].id + "'style='color:#13bb00;'>" + list[i].title + "</a></td>";
						html += "<td> " +  name + "</td>";
						html += "</tr>";
					}
					$("#list").append(html);
				}
				
				var clickCount = 1;
				$("#btn-more").on("click", function() {
					var listCount = 15;
					var start = (clickCount*listCount);
					var end = (clickCount+1)*listCount;
					if ( end >= totalList.length ) {
						end = totalList.length;
						$("#btn-more").hide();
					}
					loadList(totalList, start, end);
					clickCount++;
				});
			});
			
		</script>
		
	</body>
</html>









