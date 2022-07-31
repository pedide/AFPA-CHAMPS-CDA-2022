<%@page errorPage="error.jsp" %>
<%@page import="com.pokepok.model.DataEncryption"%>
<%@ page import="com.pokepok.connection.DbCon"%>
<%@ page import="java.sql.*"%>

<%
	
	String name = request.getParameter("USERNAME");
	String email = request.getParameter("EMAIL");
	String password = request.getParameter("PASSWORD");
	String mobileNumber = request.getParameter("mobileNumber");
	String securityQuestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String adress = "";
	String city = "";
	String cp = "";
	String state = "";
	String country = "";
	String auth = "client";
	
	try{
		Connection con = DbCon.getConnection();
		PreparedStatement ps = con.prepareStatement("insert into user (USERNAME,EMAIL,PASSWORD,AUTHORIZATION,mobileNumber,securityQuestion,answer,adress,city,cp,state,country) values (?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,DataEncryption.getSHA1(password));
		ps.setString(4,auth);
		ps.setString(5,mobileNumber);
		ps.setString(6,securityQuestion);
		ps.setString(7,answer);
		ps.setString(8,adress);
		ps.setString(9,city);
		ps.setString(10,cp);
		ps.setString(11,state);
		ps.setString(12,country);
		ps.executeUpdate();
		
		response.sendRedirect("signup.jsp?msg=valid");

		
	}catch(Exception e){
		System.out.println(e.getMessage());
		response.sendRedirect("signup.jsp?msg=invalid");	
	}
%>