<%@page import="com.xprodmvc.model.DataEncryption"%>
<%@page import="com.xprodmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String email = request.getParameter("email");
String passwordSHA1 = request.getParameter("password");


if("admin@gmail.com".equals(email) && "123456".equals(passwordSHA1)){//si email et mdp st identiques à celui admin
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}else{
	int z=0;//compteur
	try{
		String password;
		password = DataEncryption.getSHA1(passwordSHA1);
		Connection con = DbCon.getConnection();//on recupere la connection
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from user where email='"+email+"'and password='"+password+"'");
		
		while(rs.next()){
			response.sendRedirect("index.jsp");
		}
		
		if(z==0){
			response.sendRedirect("login.jsp?msg=notexist");
		}
	}catch(Exception e){
		System.out.println(e);
		//response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>
