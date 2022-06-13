<%@page import=" com.xprodmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String nom = request.getParameter("nom");
String email = request.getParameter("email");
String numerotel = request.getParameter("numerotel");
String motdepasse = request.getParameter("mot_de_passe");
String questionsecrete = request.getParameter("questionsecrete");
String reponsesecrete = request.getParameter("reponsesecrete");
String situation = request.getParameter("situation");
String codepostal ="";
String ville = "";
String adresse = "";
String region = "";
String pays = "";
 

try {
	Connection con = DbCon.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into users (nom,email,numerotel,mot_de_passe,questionsecrete,reponsesecrete,authorizations,codepostal,ville,adresse,region,pays) values (?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1, nom);
	ps.setString(2, email);
	ps.setString(3, numerotel);
	ps.setString(4, motdepasse);
	ps.setString(5, questionsecrete);
	ps.setString(6, reponsesecrete);
	ps.setString(7, situation);
	ps.setString(8, codepostal);
	ps.setString(9, ville);
	ps.setString(10, adresse);
	ps.setString(11, region);
	ps.setString(12, pays );

	ps.executeUpdate();
	
	response.sendRedirect("signup.jsp?mes=valid");

}catch (Exception e) {
	e.printStackTrace();
	System.out.println(e);
	response.sendRedirect("signup.jsp?mes=invalid");

}
%>