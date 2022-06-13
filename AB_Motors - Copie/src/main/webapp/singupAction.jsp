<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ab_motors.connection.dbCon"%>
<%@page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String adresse = "";
String ville = "";
String departement = "";
String cp = "";
String pays = "";


try{
	Connection con = dbCon.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into user(name,email,password,mobileNumber,securityQuestion,adresse,ville,departement,cp,pays,answer) value(?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(4,password);
	ps.setString(3,mobileNumber);
	ps.setString(5,securityQuestion);
	ps.setString(6,answer);
	ps.setString(7,adresse);
	ps.setString(8,ville);
	ps.setString(9,departement);
	ps.setString(10,cp);
	ps.setString(11,pays);
	
	ps.execute();
	
	response.sendRedirect("signup.jsp");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("singupAction.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>