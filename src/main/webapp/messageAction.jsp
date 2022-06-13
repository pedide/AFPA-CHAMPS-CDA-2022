<%@page import=" com.xprodmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String nom = request.getParameter("Nom");
String email = request.getParameter("Email");
String message = request.getParameter("Votre message ici");

 

try {
	Connection con = DbCon.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into message (nom,email,message) values (?,?,?)");
	ps.setString(1, nom);
	ps.setString(2, email);
	ps.setString(3, message);

	ps.executeUpdate();	
	response.sendRedirect("home.jsp?mes=valid");
}catch (Exception e) {
	e.printStackTrace();
	System.out.println(e);
	response.sendRedirect("home.jsp?mes=invalid");

}
%>