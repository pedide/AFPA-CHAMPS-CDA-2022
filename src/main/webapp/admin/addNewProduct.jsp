<%@page errorPage="error.jsp" %>
<%@ page import="com.pokepok.connection.DbCon"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/admin-style.css">

<title>Ajouter un nouveau produit</title>

<%@include file="admin-header.jsp"%>

</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){ %>
	<h3 class="alert">Produit bien Ajouté</h3>
<%}
if("wrong".equals(msg)){%>
	<h3 class="alert">Erreur, essayer de nouveau</h3>
<%}%>
	
	

	<%
	int id = 1;
	
	try{
		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select max(IDPRODUIT) from produits");
		
		while(rs.next()){
			id = rs.getInt(1);
			id++;
		}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	%>
	<form action = "../add-new-product" method = "post">
	<div class="titre1" style= "margin:10px";>
		<h3 style="color: green;">ID Produit : <%out.println(id); %></h3>
	</div>
	<input type="hidden" name = "id" value = "<%out.println(id); %>">
	<div class="left-div">
		<h3>Entrer le nom</h3>
		<input class = "input-style" type="text" name = "name" placeholder = "Entrer le nom" required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Entrer la catégorie</h3>
		<input class = "input-style" type="text" name = "category" placeholder = "Entrer la categorie" required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Entrer le prix</h3>
		<input class = "input-style" type="number" name = "price" placeholder = "Entrer le prix" required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Entrer l'image</h3>
		<input class = "input-style" type="text" name = "image" placeholder = "Entrer l'image" required>
		<hr>
	</div>
	
	<div class="left-div">
		<h3>Actif</h3>
		<select class = "input-style" name ="active">
		<option value = "Yes">Oui</option>
		<option value = "No">Non</option>
		</select>
		<hr>
	</div>
	<div >
		<button class ="button" type = "submit">Enregistrer <i class = "far fa-arrow-alt-circle-right"></i></button>
	</div>
	</form>
</body>
<br><br><br>
<footer>
<%@include file="/includes/footer.jsp"%>
</footer>
</html>