<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

// 데이터를 처리하는 페이지
String[] params ={
	 request.getParameter("class_title")
	,request.getParameter("class_date")
	,request.getParameter("class_time")
	,request.getParameter("class_std")
};

String dbUser = "root"; 
String dbPass = "1111";
String dbUrl = "jdbc:mysql://localhost:3306/ac";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = " insert into class_info ( class_name, class_date, class_time, class_std)";
sql += " values ( ?, ?, ?, ?) ";
PreparedStatement pstmt = con.prepareStatement(sql);
for (int i = 0; i < params.length; i++){
	pstmt.setString(i+1, params[i]);
}
pstmt.executeUpdate();

//페이지이동 1 : 그냥 다른 jsp파일로 이동
response.sendRedirect("./list.jsp");
%>
<!-- //페이지이동 2 : 히스토리에 쌓아가며 이동-->
<!--<script>
	location.href = "./list.jsp";
</script>

//페이지이동 3 : 히스토리에 안쌓이고 이동 ( 뒤로가기시 처음화면으로)
<script>
	location.replace = "./list.jsp";
</script>
-->