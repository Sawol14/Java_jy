<%@page import="java.util.ArrayList"%>
<%@page import="util.database.AcConnection"%>
<%@page import="org.apache.tomcat.util.http.parser.AcceptEncoding"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 과정 상세 정보 </title>
		<!--  // jquery v.3.7.1 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		
		<!--  // bootstrap v5.3.3 cdn -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		
	</head>
	<body>
			<% 
				String sql = "select * from class_info ci where class_code = ?";
				AcConnection list = new AcConnection();
				ArrayList<String> params = new ArrayList<>();
				params.add(0, String.valueOf(request.getParameter("classCode")));
				ResultSet rs = list.getResultSet(sql, params);
				if (rs.next()) {
			 %>
				    
				    <H1><%=rs.getString("class_name") %></H1>
				    <button type="button" class="btn btn-light">목록</button>
					<button type="button" class="btn btn-light">수강신청</button>
					<button type="button" class="btn btn-primary">HRD수강신청</button>
				    <H6>교육기간 I <%=rs.getString("class_date") %></H6>
				    <H6>교육시간 I <%=rs.getString("class_time") %></H6>
				    <H6>모집인원 I <%=rs.getString("class_std") %></H6>
					
				    
			<%
				} else {
			 %>	 못불러옴 
			 <%
				}
					list.destroy();
			%>		
			
	
	</body>
</html>	