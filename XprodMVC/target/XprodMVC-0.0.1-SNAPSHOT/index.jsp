<%@page import="com.xprodmvc.connection.DBCon"%>
<%@page import="com.xprodmvc.model.*"%>
<%@page import="com.xprodmvc.model.User"%>
<%@page import="com.xprodmvc.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style><%@include file="../css/index.css"%></style>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ProductDao pd = new ProductDao(DBCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if(cart_list !=null){

	request.setAttribute("cart_list", cart_list);
}

%>
<!DOCTYPE html>
<html>

<head>
<title>Bienvenue sur Bags Boutique</title>
</head>
<bodyi>



	<%@include file="includes/navbar.jsp"%>
	<%-- <%out.print(DBCon.getConnection()); %> --%>
	<!-- <video src="https://ak.picdn.net/shutterstock/videos/1076499071/preview/stock-footage-beautiful-female-customer-using-d-augmented-reality-digital-interface-in-modern-shopping-center.webm" id="video" autoplay loop muted class="video"></video> -->
<video src="https://ak.picdn.net/shutterstock/videos/1052929337/preview/stock-footage-milan-italy-january-very-expensive-luxury-shopping-concept-the-interior-and-shelves-in.webm" id="video" autoplay loop muted class="video"></video>
		<div class="container-fluid mt-5 mb-5">
		<div class="row" margin-top: 2px;>
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>

			<div class="col-md-3">
				<div class="card w-80" style="width: 15rem ;">
					<div class=contenairIMG style="width: 100px, height:100px">
						<img class="card-img-top " src="product-image/<%=p.getImage()%>" alt="Card image cap">
						<%--<img src="product-image/<%=p.getImage()%>" /> --%>
						<div class="card-body">
							<h5 class="card-title"><%=p.getNom()%></h5>
							<h5 class="card-title"><%=p.getCategorie()%></h5>
							<h6 class="Prix"><%=p.getPrix()%></h6>
							<h6 class="Categorie">Categorie: categorie 1...</h6>
							<div =class="mt-3 d-flex justify-content-between"></div>
							<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Ajouter au Panier</a> <a
								href="oreder-now?quantite=1&id=<%=p.getId()%>" class="btn btn-primary">Acheter</a>
								
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
	<%@include file="includes/footer.jsp"%>
</bodyi>
</html>