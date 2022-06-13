
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<meta charset="UTF-8">
<title>Répondre Message</title>
<style>
.back {
	color: whit;
	margin-left: 2.5%;
}
</style>


<%@include file="adminHeader.jsp"%>
</head>



<body>
	<%
	String idm = request.getParameter("idm");
	
	
	try{
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from messageu where idm='"+idm+"'");
	System.out.println("valeur idm " + idm);
	
	while(rs.next()){
		
	
		
		
%>
	<h2>
		<a class="back" href="AllProductEditProduct.jsp"><i
			class="fas fa-arrow-circle-left">Retour</i></a>
	</h2>
	<% out.println("ça marche");%>
	<% System.out.println("ça marche");%>


	<form action="../message-us-admin" method="post">
	<input type="hidden" name="id" value="">

	<div class="left-div">
		<h3>Nom</h3>
		<input class="input-style" type="text" name="nom" value="<%=rs.getString(2)%>"required>
		<hr>
	</div>

	<div class="right-div">
		<h3>Email</h3>
		<input class="input-style" type="text" name="categorie" value="<%=rs.getString(3)%>"required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Objet Message</h3>
		<input class="input-style" type="text" name="prix" value="<%=rs.getString(5)%>"required>
		<hr>   
	</div>



	<div class="right-div">
		<h3>Message</h3>
		<input class="input-style" type="text" name="image" value="<%=rs.getString(6)%>"required>
		<hr>
	</div>
	
	<form action="../message-us-admin" method="post">
	<div class="center-div">
            <h3>Répondre :</h3>
            <textarea id="story" name="messageAdmin" class="center" rows="5" cols="200"></textarea>
            <hr>
        </div>
  <button class="button" type="submit" idm=<%=rs.getString(1)%>>Envoyer<i class="far fa-arrow-alt-circle-right"></i></button>
  </form>
  <% 	}
	}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	
	%>

</body>
<br><br><br>
<%@include file="/includes/footer.jsp"%>
</html>