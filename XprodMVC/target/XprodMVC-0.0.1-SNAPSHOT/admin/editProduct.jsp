
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
<title>Editer Produits</title>
<style>
.back {
	color: whit;
	margin-left: 2.5%;
}
</style>
<%-- <%@include file="/includes/navbar.jsp"%> --%>
<%@include file="adminHeader.jsp"%>
</head>
<body>
	<h2>
		<a class="back" href="AllProductEditProduct.jsp"><i
			class="fas fa-arrow-circle-left">Retour</i></a>
	</h2>
	<%
	String id = request.getParameter("id");
	try{
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from products where id='"+id+"'");
		
		while(rs.next()){
				
	%>
	<form action="../edit-product" method="post">
	<input type="hidden" name="id" value="<%out.println(id);%>">

	<div class="left-div">
		<h3>Entrer Nom</h3>
		<input class="input-style" type="text" name="nom" value="<%=rs.getString(2)%>"required>
		<hr>
	</div>

	<div class="right-div">
		<h3>Entrer Categorie</h3>
		<input class="input-style" type="text" name="categorie" value="<%=rs.getString(4)%>"required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Entrer Prix</h3>
		<input class="input-style" type="text" name="prix" value="<%=rs.getString(5)%>"required>
		<hr>
	</div>

	<div class="right-div">
		<h3>Entrer Image</h3>
		<input class="input-style" type="text" name="image" value="<%=rs.getString(6)%>"required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Active</h3>
		<select class="input-style" name="active">
		<option value="Yes">Oui</option>
		<option value="No">Non</option>
		
		</select>
		<hr>
	</div>
  <button class="button">Save<i class="far fa-arrow-alt-circle-right"></i></button>
  </form>
  <%}
			}catch(Exception e){
				System.out.println(e);
			}
			%>
</body>
<br><br><br>
<%@include file="/includes/footer.jsp"%>
</html>