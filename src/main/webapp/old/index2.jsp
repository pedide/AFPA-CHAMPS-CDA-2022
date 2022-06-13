<%@page import="com.gaiaconsulting.model.Products"%>
<%@page import="com.gaiaconsulting.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@page import="com.gaiaconsulting.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.gaiaconsulting.dao.ProductsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}
ProductsDao pd = new ProductsDao(DbCon.getConnection());
List<Products> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {

	//total = pDao.getTotalCartProducts(cart_list);

	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to XPROD</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<%@include file="includes/navbar.jsp"%>
</head>
<body>
	
	<%--  	<%out.print(DbCon.getConnection()); %>  --%>
	<div class="container">
		<div class="card-header my-3">List of products</div>
			
			<div class="row">
				<%
				if (!products.isEmpty()) {

					for (Products p : products) {
				%>
				<div class="col-md-3 mx-1">
					<div class="card w-100 mt-3" style="width: 12rem;">
						<div class="containerIMG mt-3"
							style="width: 150px; height: 150px; margin: auto; display: block">
							<img class="card-img-top" src="images/<%=p.getImage()%>"
								alt="Card image cap">
						</div>
						<div class="card-body">
							<h5 class="Cart title"><%=p.getName()%></h5>
							<h5 class="price"><%=p.getPrice()%></h5>
							<h6 class="category"><%=p.getCategory()%></h6>
						
							<div class="mt-3 d-flex justify-content-between">
								<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-danger">Add
									to cart</a> <a href="order-now?quantity=1&id=<%=p.getId()%>"
									class="btn btn-success">Buy now</a>
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

<footer><%@include file="../includes/footer.jsp"%></footer>
</body>

</html>