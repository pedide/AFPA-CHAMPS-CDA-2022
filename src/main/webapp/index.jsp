
<%@page import="java.util.ArrayList"%>
<%@ page import="com.pokepok.connection.DbCon"%>
<%@ page import="com.pokepok.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.pokepok.dao.ProductDao"%>
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
<title>Bienvenue sur POKEPOK</title>
<link rel="stylesheet" href="css/signup-style.css">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<style type = "text/css">
h5{
font-size:medium;
}
.btn{
font-size:1rem;
}
.btn-aj{
background-color : #004040;
color : white;
margin-right : 5px;
}
.btn-aj:hover{
background-color : #008080;
color : white;
}
.btn-ach{
background-color : #008080;
color : white;
margin-right : 5px;

}
.btn-ach:hover{
background-color : #004040;
color : white;
}

.col-md-3{
margin-top : 20px;
}

h3{
	padding-left:unset !important;
}
.container{
	text-align:center;
	background-color:#ffffffc4;
}
</style>
<%@include file="includes/head.jsp"%>

</head>
<body>
	
	<%@include file="includes/navbar.jsp"%>
	<div class = "background" ">
	<%-- <%out.print(DbCon.getConnection()); %> --%>
	<div class ="headBG" >
				<a href="index.jsp"><img src= "background/logo.png"/></a>
	</div>

	<div class="container"><%if (auth != null) {%><h3>Bonjour <%out.print(auth1.getName());%></h3><%}%>
		<div class ="card-header my-3" style="padding-left:unset;">
			
			<h3>Liste des produits</h3>
		</div>
		<div class ="row">
	
		<%
		if(!products.isEmpty()){
			for(Product p : products){
		%>
				<div class = "col-md-3">
				<%-- code copier sur https://getbootstrap.com/docs/4.0/components/card/ --%>
				<div class="card w-100" style="width: 18rem;">
					<div class "containerimg">
					<a href="" data-toggle="modal" data-target="#myModal"><img class="card-img-top" src="product-image/<%= p.getImage()%>" alt="Card image cap" ></a></div>
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
					    <h6 class="price">Prix : <%=p.getPrix() %> €</h6>
					    <%-- <h6 class="categorie">Catégorie : <%=p.getCategorie() %></h6> --%>
					    	<div class ="mt-4 d-flex justify-content :space-between">
					    	<a href="addToCard?IDPRODUIT=<%=p.getId()%>&prixU=<%=p.getPrix() %>" class="btn btn-sm btn-aj">Ajouter au panier</a>
				    		<a href="order-now?quantity=1&id=<%=p.getId()%>&prixU=<%=p.getPrix()%>" class="btn btn-sm btn-ach">Acheter</a>
				   
					    </div>
					</div>
				</div>	
			</div>
			<div class="modal fade" id="myModal" role="dialog">
    			<div class="modal-dialog">
					<div class="modal-content">
        				<div class="modal-header">
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
          					
        				</div>
        				<div class="modal-body">
        				<h4 class="modal-title"><%=p.getName() %></h4>
        					<img class="card-img-top" src="product-image/<%= p.getImage()%>">
          					<p><%=p.getCategorie() %></p>
        				</div>
        				<div class ="mt-4 d-flex justify-content :space-between" style="padding:20px; text-align:center";>
					    	<a href="addToCard?IDPRODUIT=<%=p.getId()%>&prixU=<%=p.getPrix() %>" class="btn btn-sm btn-aj">Ajouter au panier</a>
				    		<a href="order-now?quantity=1&id=<%=p.getId()%>&prixU=<%=p.getPrix()%>" class="btn btn-sm btn-primary">Acheter</a>
				   
					    </div>
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
<footer>
<%@include file="includes/footer.jsp"%>
</footer>
</html>