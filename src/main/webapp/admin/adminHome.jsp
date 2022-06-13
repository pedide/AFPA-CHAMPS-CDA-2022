<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.pokepok.connection.DbCon"%>
<%@ page import="com.pokepok.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.pokepok.dao.ProductDao"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
	//double total = pDao.getTotalCartPrice(cart_list);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>POKEPOK Admin Panier</title>
<link rel="stylesheet" href="css/admin-style.css">
<style type="text/css">

.btn-supp{
background-color : red;
color : black;
margin-right : 5px;
}

.btn-ed{
background-color : aquamarine;
color : black;
margin-right : 5px;
}
.btn-ed:hover{
background-color : turquoise;
color : white;
}

.btn-supp:hover{
background-color : darkred;
color : white;
}

.fa-pen-fancy{
color:red;
}
.card{
width:15%;
margin:10px;
}

</style>
<%@include file="/includes/head.jsp"%>
</head>
<body>
	<%-- 	<%@include file="../includes/navbar.jsp"%> --%>
	<%@include file="/admin/admin-header.jsp"%>


	<div style="color: black; text-align: center; font-size: 30px">
		<h1 class="titre">
			Bienvenue sur la page Admin<i class="fas fa-home"
				style="font-size: unset;"></i>
		</h1>
		<%
			String msg = request.getParameter("msg");
			if("done".equals(msg)){ %>
				<h3 class="alert">Le produit a bien été supprimé!</h3>
			<%}
			if("wrong".equals(msg)){%>
				<h3 class="alert">Erreur, essayer de nouveau</h3>
		<%}%>
		<!-- <h3 class="alert">Produit bien ajouté</h3>
		<h3 class="alert">Le produit existe déja dans votre panier, +1</h3>
		<h3 class="alert">Le mot de pass a bien été modifié</h3> -->
	</div>

	<div class="row" style="margin: 15px;"">

		<%
		if (!products.isEmpty()) {
			for (Product p : products) {
		%>
		
			<%-- code copier sur https://getbootstrap.com/docs/4.0/components/card/ --%>
			<div class="card" >
				<div class "containerimg">
					<img class="card-img-top" src="../product-image/<%=p.getImage()%>"
						alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title"><%=p.getName()%></h5>
					<h6 class="price">
						Prix :
						<%=p.getPrix()%>
						€
					</h6>
					<h6 class="categorie">
						Catégorie :
						<%=p.getCategorie()%></h6>
					
					<div>
						<a href = "editProduct.jsp?id=<%=p.getId()%>" class="btn btn-sm btn-ed">Editer <i class="fas fa-pen-fancy" style="color:black;"></i></a>
						
						<a href = "../delete?id=<%=p.getId()%>" class="btn btn-sm btn-supp">Supprimer <i class="fas fa-trash" style="color:black;"></i></a>
						
					</div>
				</div>
			</div>
		
		<%
		}
		}
		%>
	
	
	</div>
</body>
<footer>
<%@include file="/includes/footer.jsp" %>
</footer>
</html>