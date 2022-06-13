<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/addNewProduct-style.css">

<title>AJOUTER UN NOUVEAU PRODUIT</title>

<%-- <%@include file="/includes/navbar.jsp"%> --%>
<%@include file="adminHeader.jsp"%>

</head>
<body>

<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
	%>
	<h3 class="alert">Produit Ajouter</h3>
<% }%>
<%

if("wrong".equals(msg)){
	%>
	<h3 class="alert">veuillez réessayer s'il vous plait</h3>
	<% }%>
	<%
	int id=1;
	
	try{
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(id) from products");
	
	while(rs.next()){
		
		id=rs.getInt(1);
		id++;
		
	}
	}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	
	%>
	<form action="../add-new-product" method="post">
	
	<h3 style="color: green;">Product ID:<%out.println(id); %></h3>

    <input type="hidden" name="id" value="<%out.println(id); %>">
	<div class="left-div">
		<h3>Entrer Nom</h3>
		<input class="input-style" type="text" name="nom" placeholder="Entrer nom" required>
		<hr>

	</div>

<div class="right-div">
	<h3>Entrer Categorie</h3>
	<input class="input-style" type="text" name="categorie" placeholder="Entrer categorie" required>
	<hr>

</div>
<div class="left-div">
	<h3>Entrer Prix</h3>
	<input class="input-style" type="number" name="prix" placeholder="Entrer prix" required>
	<hr>
	

</div>

<div class="right-div">
	<h3>Entrer Image</h3>
	<input class="input-style" type="text" name="image" placeholder="Entrer Image" required>
	<hr>

</div>
<div class="left-div">
	<h3>Active</h3>
	<select class="input-style" name="active">
	<option value="Oui">Oui</option>
	<option value="Non">Non</option>
	</select>
	<hr>
	
</div>
<i class="far fa-arrov-alt-circle-right"></i>

<button class="button" type="submit" >Enregistrer<i class="far fa-arrow-alt-circle-right"></i></button>
</form>
</body>
<br><br><br>
<%@include file="/includes/footer.jsp"%>
</html>