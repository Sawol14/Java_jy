<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
 		<meta charset="UTF-8">
 		<title>비동기식 통신방식 - Ajax </title>
 		
 		<!-- //jquery v.3.7.1 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		 		
 		<!-- //bootstrap v5.3.3 cdn -->
 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		
	</head>
	<body class="bg-light ">
		
		<div id="div-table" class="bg-secondary mx-auto" style="width: 900px; height: 1200px;">
		
			<table class="table text-center table table-striped">
				<thead class="table-dark">
					<tr>
						<th> #</th>
						<th> 제목 </th>
						<th> 등록일 </th>
						<th> 조회수 </th>
					</tr>
				</thead>
				<tbody id="list">
					
				</tbody>
			</table>
			<button id="btn-more" class="btn btn-primary w-100"> 더보기</button>
		</div>
		<script>
		// json date : 서버에 데이터를 요청하여 받은 값
		/*
		var json = [
			{	
				"no": 1
				,"subject": "빅테이터 전문가 과정"
				,"write_date": "2024-07-22"
				,"read_num" : 105
			},
			{
				"no": 2
				,"subject": "풀스텍 개발자 양성 과정"
				,"write_date": "2024-06-10"
				,"read_num" : 215
			}
		];
		*/
		
	
		$(document).ready(function() {		
			var json;
			var listCount = 15;	
			function loadList(list, start, end) {
				var html = "";
				for (var i = start; i < end; i ++){
					html += "<tr>";
					html += "<td>"+(i+1)+"</td>";
					html += "<td>"+list[i].id+"</td>";
					html += "<td>"+list[i].title+"</td>";
					html += "<td>"+list[i].userId+"</td>";
					html += "</tr>";
				}
				$("#list").append(html);
			}
			
				$.ajax({
					// 요청하게 될 URL
					url: "https://jsonplaceholder.typicode.com/posts",
					// 전송방식 : GET / POST
					type: "GET",
					// 송신하게 될 데이터
					/*
					data: {
						// 객체형 > 문자형 
						"json" : JSON.stringify() 
					},
					*/
					// 통신이 성공하게 되면 실행 될 부분
					success: function(data) {
						json = data;
						// 받을 때, data - 문자형이라면
						//data = JSON.parse(data);//형변환
					
						loadList(json, 0, 15);					
					},
					// 통신이 실패하게 되면 실행될 부분
					error: function( xhr) {
						console.log(xht);
					}
				
					
				});
				
				
				
				
				/*
				var html = "";
				for ( var i = 0 ; i < json.length ; i++ ) {
					html += "<tr>";
					html += "<td>"+json[i].no+"</td>";
					html += "<td>"+json[i].subject+"</td>";
					html += "<td>"+json[i].write_date+"</td>";
					html += "<td>"+json[i].read_num+"</td>";
					html += "</tr>";
					//console.log(json[i].subject);
				}
				$("#list").html("").append( html );
				*/
		
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
		
		<script>
			// jquery
			/*
			태그 선택자, 클래스 선택자, 아이디 선택자, 속성 선택자, 자식 선택자, 하위 선택자
			$({selector: 선택자}).{function_name}(function(){
				
			});
			
			
			*/
			
			$(document).ready(function(){
				
				// 제목을 경고창으로 확인
				// on("{event_name}", fuction() {}) : bind(묶다) - event
				$("#board_subject").on("click", function() {
					// 해당 영역 내의 텍스트를 가져옴.
					var subject = $("#board_subject").text();
					alert( subject );
				});
				
				var clickCount = 0;
				$("#div-table").on("click", function() {
					clickCount++;
					console.log("클릭수 : " + clickCount);
					if(clickCount % 10 == 0){
						alert("그만눌러라잉");
					} 
				});
				
				$(document).on("keypress", function(event){
					//alert( event.keyCode );
					if (event.keyCode == 13){
						alert( "엔터키 왜눌러" );
					}
				});
				
				var json = {
					"first_name" : "Park"
					,"last_name" : "Joo-Young"
					,"age" : "33"
					,"birth_date" : "1991-01-14"
					,"address" : "부산광역시 수영구"
					,"nation" : "Republic of Korea"
				};
				
				
			});
			
		</script>
		<script>
			// 변수
			var number = 1;
			var charStr = "문자";
			var str = "문자열";
			//var arr = { 1, 2, 3, 4 };
			var arr2 = new Array();
			
			//if, switch
			if( number == 1 ) {
				//경고창
				//alert("와우");
				//console 출력
				console.log( number );
			}
			
			switch( number ) {
				case 1: console.log( " run() switch " + number); break;
				default: break;
			}
			// while, for
			for ( var i = 0; i < 10; i++) {
				console.log( i );
			}
			
			// function (cf.metrhod)
			function custom_alert(message) {
				//alert(message);
			}
			
			custom_alert( "경고창을 띄우는 함수를 실행합니다." );
			

		</script>
		
	</body>
</html>