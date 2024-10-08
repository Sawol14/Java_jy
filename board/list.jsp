<%@page import="java.util.ArrayList"%>
<%@page import="util.database.AcConnection"%>
<%@page import="org.apache.tomcat.util.http.parser.AcceptEncoding"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>교육 과정 안내</title>.
		<!--  // jquery v.3.7.1 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		
		<!--  // bootstrap v5.3.3 cdn -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		
	</head>
	<body>
		<% 
			String sql = "select * from class_info ci where class_code >= ?";
			AcConnection list = new AcConnection();
			ArrayList<String> params = new ArrayList<>();
			params.add(0, "1");
			ResultSet rs = list.getResultSet(sql, params);
		%>
		
		
		<div class = "container p-3 border border-dark">
			<div class = " row ">			
				<%while ( rs.next()) { %>
					<ul class = "list-group col-3 border border-dark"><%
						int classCode =Integer.parseInt(rs.getString("class_code"));
						String title = rs.getString("class_name");
						%>
						<a href="./view.jsp?classCode=<%=classCode %>"> 
							<button type="button" class="btn btn-light" >
								<%=rs.getString("class_name") %>
								<hr/>
							    교육기간 <%=rs.getString("class_date") %><BR/>
							    교육시간 <%=rs.getString("class_time") %><BR/>
							    모집인원 <%=rs.getString("class_std") %><BR/>
							</button>	
						</a>				
					</ul>
				<%} 
				list.destroy();
				%>						
				
			</div>
		</div>
	</body>
</html>