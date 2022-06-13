<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@page import="com.gaiaconsulting.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.gaiaconsulting.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.model.User"%>

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
<meta charset="UTF-8">
<%@include file="clientHeader.jsp"%>
<!-- <link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="../css/home-style.css"> -->
<title>Welcome to admin page</title>
<style>
h1 {
	color: white;
	text-align: center;
	font-size: 100px
}
</style>
</head>
<body>
	<div style="color: black; text-align: center; font-size: 30px;">
		Home<i class="fa fa-university"></i>
	</div>
	<h4 class="alert">Product added successfully</h4>
	<h4 class="alert">Product already exist in your cart ! Quantity
		increased</h4>
	<h4 class="alert">Password change successfully</h4>

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
						<img class="card-img-top" src="../images/<%=p.getImage()%>"
							alt="Card image cap">
					</div>
					<div class="card-body">
						<h5 class="Cart title"><%=p.getName()%></h5>
						<h5 class="price"><%=p.getPrice()%></h5>
						<h6 class="category"><%=p.getCategory()%></h6>

						<div class="mt-3 d-flex justify-content-between">
							<a href="../edit-product?id=<%=p.getId()%>" class="btn btn-danger">Edit product</a> 
							<a href="../delete-product?id=<%=p.getId()%>"
								class="btn btn-success">Delete Product</a>
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

	<%--  <%@include file="/includes/navbar.jsp"%>  --%>

</body>
<footer><%@include file="../includes/footer.jsp"%></footer>
</html>