<%@page errorPage="error.jsp" %>
<%@ page import="com.pokepok.connection.DbCon" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
h3{
	color:green;
	text-align:center;
}
</style>
<%@include file="includes/head.jsp" %>
</head>
<body>
	<div style ="color : white; text-align : center; font-size:30px;">
		Home<i class = "fas fa-home"></i>
	</div>
	<h3 class = "alert">Produit bien ajouté</h3>
	<h3 class = "alert">Le produit existe déja dans votre panier, +1</h3>
	<h3 class = "alert">Le mot de pass a bien été modifié</h3>
	
	<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nom</th>
            <th scope="col">Categories</th> 
            <th scope="col">Prix <i class="fa fa-inr"></i></th>
            <th scope="col">Ajouter au panier <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><i class="fa fa-inr"></i> </i></td>
            <td><a href="">Ajouter au panier <i class='fas fa-cart-plus'></i></a></td>
          </tr>

        </tbody>
      </table>
      <br>
      <br>
      <br>
      
</body>
<footer>
<%@include file="includes/footer.jsp" %>
</footer>
</html>