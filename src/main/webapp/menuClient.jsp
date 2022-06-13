<%@page import="com.projetafpa.connection.DbCon"%>
<%@page import="com.projetafpa.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.projetafpa.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--    <%
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

%> --%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>admin dash</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/Dashboard.css">
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
	<a href="myOrders.jsp"><span class="fa-solid fa-cart-shopping"></span>
	<span>Acheter un ticket</span></a>
</li>
<li>
	<a href="messageUs.jsp"><span class="fa-brands fa-rocketchat"></span>
	<span>Messages</span></a>
</li>
<!-- <li>
	<a href=""><span class="fa-solid fa-gear"></span>
	<span>Paramètres</span></a>
</li> -->
<!-- <li>
	<a href=""><span class="fa-solid fa-user "></span>
	<span>Compte</span></a>
</li> -->
<li>
	<a href="logout.jsp"><span><i class="fa-solid fa-right-from-bracket"></i></span>
	<span>Déconnexion</span></a>	
</li>
</ul>
</div>
</div>

<div class="main-content">
<header>
<h2>
 <label for="nav-toggle">
<span class="fa-solid fa-bars"></span>
</label>
	Dashboard
</h2>

<div class="search-wrapper">
<span class="fa-solid fa-magnifying-glass"></span>
<input type="search" placeholder="Recherche"/>
</div>

<div class="user-wrapper">
<img src="product-image/logo_Barca.png" width="40px" height="40px" alt="">
<div><h4>Username</h4>
<small>username</small>
</div>
</div>
</header>
<main>

<div class="cards">
	<div class="card-single">
		<div> 
			<h1>0</h1>
<span>Contrôle du jour </span>
</div> 
<div>
<span class="fa-solid fa-user-police"></span>
</div>
</div>  

<div class="card-single">
<div>
<h1>0</h1>
<span>Verbalisations</span>
</div>
<div>
<span class="fa-solid fa receipt"></span>
</div>
</div>

<div class="card-single">
<div>
<h1>0</h1>
<span>Nombre de voyage</span>
</div>
<div>
<span class="fa-solid fa-building-colums"></span>
</div>
</div>
</div>

<div class="recent-grid">
<div class="projects">
<div class="card">
<div class="card-header">
<h3>Achat récent</h3>
<button>See All <span class="las la-arrow-right">
</span></button>
</div>
<div class="card-body">
<div class="table-responsive">
</div>
</div>
</div>
<table width="100%" >
<thead>
<tr>
<td>Tickets</td>
<td>Departement</td>
<td>Statut</td>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td></td>
<td> <span class="status purple"></span>
review
</td>
</tr>
<tr>
<td></td>
<td></td>
<td>
<span class="status pink"></span>
in progress
</td>
</tr>
<tr>
<td>Pass Navigo</td>
<td>Ile de France</td>
<td><span class="status orange "></span>
en attente
</td>
</tr>
</tbody>
</table>
</div>


<div class="customers">
<div class="card">
<div class="card-header">
<h3>Messages</h3>
<button>See All <span class="las la-arrow-right">
</span></button>
</div>

<div class="card-body">
<div class="customer">
<div class="info">
<img src="product-image/logo_Barca.png" width="40px" 
height="40px" alt="">
<div>
<h4>Phil</h4>
<small></small>
</div>
</div>
<div class="contact">
<span class="fa-solid fa-comment"></span>
</div>
</div>

<div class="customer">
<div>
<img src="product-image/logo_Barca.png" width="40px" 
height="40px" alt="">
<div>
<h4></h4>
<small></small>
</div>
</div>
<div>
<span class="fa-solid fa-comment"></span>
</div>
</div>

</div>
</div>


</div>
</div>
</div>

</main>

</div>
</body>
</html>