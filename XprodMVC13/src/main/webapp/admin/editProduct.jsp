<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="../css/addNewProduct-style.css">
<meta charset="UTF-8">
<title>Edit Product</title>
<style>
.back {
	color: #FF9999;
	margin-left: 2.5%;
}
button[type=submit]
{
    display: block;
    position: relative;
    margin-left: auto;
    margin-right: auto;
}
</style>

<%@include file="/includes/head.jsp"%>

<body>
<%@ include file="adminNavbar.jsp"%>
	<h2>
		<a class="back" href="adminHome.jsp">
		<i class="fas fa-arrow-circle-left" style="color:#FF9999"></i>Retour</a>
	</h2>
	<%
	String id = request.getParameter("id");
	try{
		Connection con = DbCon.getConnection();//creer la connexion
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from produits where idProduit='"+id+"' "); 

		while (rs.next()) {
	%>
	<form action="../edit-product" method="post">
	<input type="hidden" name="id" value="<%out.println(id);%>">
				
	<div class="left-div">
		<h3 style="color:#000">Entrer la référence</h3>
		<input class="input-style" type="text" name="ref"
				value="<%=rs.getString(2)%>" required>
		<hr>
	</div>
	
	<div class="right-div">
		<h3 style="color:#000">Entrer le nom</h3>
		<input class="input-style" type="text" name="name"
				value="<%=rs.getString(3)%>" required>
		<hr>
	</div>

	<div class="left-div">
		<h3 style="color:#000">Entrer la description</h3>
		<input class="input-style" type="text" name="category"
				value="<%=rs.getString(4)%>" required>
		<hr>
	</div>

	<div class="right-div">
		<h3 style="color:#000">Entrer le prix</h3>
		<input class="input-style" type="number" step="0.1" min="0" max="1000" name="price"
				value="<%=rs.getString(5)%>" required>
		<hr>
	</div>

	<div class="left-div">
		<h3 style="color:#000">Entrer l'image</h3>
		<input class="input-style" type="text" name="image"
				value="<%=rs.getString(8)%>" required>
		<hr>
	</div>
	<div class="right-div">
		<h3 style="color:#000">Entrer status du produit : Active</h3>
		<select class="input-style" name="active">
		<option value="Yes">Yes</option>
		<option value="No">Non</option>
		</select>
		<hr>
	</div>
	<br>
	<br>
	<button class="btn btn" type="submit" style="background:#FF9999">Enregistrer<i class="far fa-arrow-alt-circle-right"></i></button>
	 </form>
	<%
		}
	} catch (Exception e) {
		System.out.println(e);
	}%>
</body>
<footer>
	<%@ include file="adminFooter.jsp"%>
</footer>
</html>