<%@page import="java.util.ArrayList"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.xprodmvc.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

//Appel les produits qui se trouve dans la base DAO
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Bienvenue sur XPROD</title>
<style type = "text/css">
.btn{
font-size:1rem;
}
.btn-aj{
background-color : orange;
color : white;
margin-right : 5px;
}
.btn-aj:hover{
background-color : #fd7e04;
color : white;
}

.col-md-3{
margin-top : 20px;
}
</style>
<%@include file="includes/head.jsp"%>

</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<%-- <%out.print(DbCon.getConnection()); %> --%>
	<div class="container">
		<div class ="card-header my-3">
			Liste des produits
		</div>
		<div class ="row">
	
		<%
		if(!products.isEmpty()){
			for(Product p : products){
		%>
				<div class = "col-md-3">
				<%-- code copier sur https://getbootstrap.com/docs/4.0/components/card/ --%>
				<div class="card w-100" style="width: 18rem;">
					<div class "containerimg" style="width:253px; height : 170px;">
					<img class="card-img-top" src="product-image/<%= p.getImage()%>" alt="Card image cap"></div>
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
					    <h6 class="price">Prix : <%=p.getPrix() %> €</h6>
					    <h6 class="categorie">Catégorie : <%=p.getCategorie() %></h6>
					    	<div class ="mt-4 d-flex justify-content :space-between">
					    	<a href="addToCard?IDPRODUIT=<%=p.getId()%>" class="btn btn-sm btn-aj">Ajouter au panier</a>
				    		<a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-sm btn-primary">Acheter</a>
				   
					    </div>
					</div>
				</div>	
			</div>
			<%	
			}
		}
		%>
			
			
	<%@include file="includes/footer.jsp"%>

</body>

</html>