<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="com.xprodmvc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
Users auth = (Users) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductsDao pd = new ProductsDao(DbCon.getConnection());
List<Product> produits = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="adminHeader.jsp"%>
<meta charset="UTF-8">
<title>AdminHome</title>
<%@include file="/includes/head.jsp"%>
</head>
<body>

	<div style="color: black; text-align: center; font-size: 30px;">
		Home<i class="fas fa-home"></i>
	</div>
	
	<div class="container">
		<div class="card-header my-3">Liste des produits</div>
		<div class=row>
			<%
			if (!produits.isEmpty()) {
				for (Product p : produits) {
			%>

			<div class="col-md-3" style="width: 18rem;">
				<div class="card">
					<img src="../product-image/<%=p.getImage()%>" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="Prix">
							Prix:<%=p.getPrice()%>€
						</h6>
						<h6 class="Categorie"><%=p.getCategory()%>
						</h6>
						<div class="mt-3 d-flex justify content-between"></div>
						
						<a href="../delete-product?id=<%=p.getIdProd()%>"
							class="btn btn-danger">Supprimer le produit <i
							class="fas fa-trash"></i></a>
						<a href="editproduct.jsp?id=<%=p.getIdProd()%>"
							class="btn btn-primary">Modifier le produit <i
							class="fas fa-pen-fancy"></i></a>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

</body>
</html>
