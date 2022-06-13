<%@ page import="com.ab_motors.connection.dbCon"%>
<%@ page import="com.ab_motors.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ab_motors.dao.productsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}
productsDAO pd = new productsDAO(dbCon.getConnection());
List<products> products = pd.getAllProducts();

ArrayList<cart> cart_list = (ArrayList<cart>)session.getAttribute("cart-list");
List<cart> cartProduct = null;

if (cart_list != null) {
    cartProduct=pd.getCardProducts(cart_list);
    request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<title>AB motors</title>

<link rel="stylesheet" href="css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<%@include file="incloudes/navbar.jsp"%>
</head>

<body>


	<div class="container">
		<h4>
			<div class="card-header my-3 lineaire-simple" align="center">Liste
				de nos produits</div>
		</h4>
		<div class="row">

			<%
			if (!products.isEmpty()) {

				for (products p : products) {
			%>
			<div class="col-md-4">


				<div class="lineaire-simple">
					<img class="card-img-top" src="product-image/<%=p.getIMAGE()%>"
						align="center" ; style="height: 200px;">
					<div class="card-body">
						<h5 class="card-title"><%=p.getNOM()%></h5>
						<h6 class="price"><%=p.getPRIX()%></h6>
						<h6 class="category"><%=p.getCATEGORIE()%></h6>
						<div class="mt-3 d-flex justify content between"></div>
						<a href="add-to-cart-servlet?idproducts=<%=p.getIDPROD() %>"
							class="btn btn-dark">Ajouter au panier</a> <br> <a
							href="order-now?quantity=1&idproducts=<%=p.getIDPROD() %>"
							class="btn btn-primary">Acheter maintenant</a>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

	<%@include file="incloudes/footer.jsp"%>
</body>
</html>