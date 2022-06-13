<%@page import="com.projetafpa.connection.DbCon"%>
<%@page import="com.projetafpa.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.projetafpa.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Dashboard</title>
<%@include file="includes/head.jsp"%>		
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/menu-style.css">
</head>
<body>

<input type="checkbox" id="nav-toggle">
<div class="sidebar">
<div class="sidebar-brand">
<h1><span class="fa-solid fa-train"></span> <span>RATP Connect</span>
</h1>
</div>

<div class="sidebar-menu">
<ul>
<li>
	<a href="" class="active"><span class="las la-igloo"></span>
	<span>Tableau de bord</span></a>
</li>
<li >
	<a href="allProductEditProduct.jsp"><span class="fa-solid fa-cart-shopping"></span>
	<span>Ajouter/Modifier un ticket</span></a>
</li>

<li>
	<a href="messageUs.jsp"><span class="fa-brands fa-rocketchat"></span>
	<span>Messages</span></a>
</li>

<!-- <li>
	<a href=""><span class="fa-solid fa-user "></span>
	<span>Compte</span></a>
</li> -->

<li>
	<a href="Logout.jsp"><span><i class="fa-solid fa-right-from-bracket"></i></span>
	<span>Déconnexion</span></a>	
</li>
</ul>
</div>
</div>

<div class="main-content">
<header>
<div class="search-wrapper">
<span class="fa-solid fa-magnifying-glass"></span>
<input type="search" placeholder="Recherche"/>
</div>

<div class="user-wrapper">
<img src="product-image/logo_Barca.png" width="40px" height="40px" alt="">
<div><h4>Administrateur</h4>
<small>Admin</small>
</div>
</div>
<%@include file="includes/navbar.jsp"%>
</header>
<main>
 	<div class="container">
		<div class="card-header my-3">List of products</div>
		<div class="row">
    		<%
		if (!products.isEmpty()){
			for(Product p : products)
			{%>   
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-image/<%=p.getImage()%>" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="prix"><%=p.getPrice()%>€ </h6>
						<h6 class="category"><%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
						<a href="add-to-cart?id=<%=p.getId()%>"class="btn btn-dark">Add to card</a>
						<a href="order-now?quantity=1&id=<%=p.getId()%>"class="btn btn-primary">Buy now</a>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
				
			<%}
		}
		%>    

</div>
</div>

</main>


</body>
</html>