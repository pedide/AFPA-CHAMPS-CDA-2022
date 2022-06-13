<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@page import="com.gaiaconsulting.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.gaiaconsulting.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
<html>

<head>
<meta charset="UTF-8">
<%@include file="includes/navbar.jsp"%>

<title>Home</title>
</head>
<div style="color: black; text-align: center; font-size: 30px;">
	Home<i class="fa fa-university"></i>
</div>
<body>
	<%
	int z = 0; //z est un entier
	try {

		String search = request.getParameter("search");
		String query = "select * from produits where DESCRIPTIF like '%" +search+ "%' or DESIGNATION like '%" +search+ "%' and ACTIVE='Yes'";
		System.out.println("je suis dans le try search");

		Connection con = DbCon.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		while (rs.next()) {
			System.out.println("je suis dans le while search");
			z = 1;
	%>
	<div class="container">
		<div class="card-header my-3">Liste de formation</div>

		<div class="row">
	
			<div class="col-md-3 mx-1">
				<div class="card w-100 mt-3" style="width: 12rem;">
					<div class="containerIMG mt-3"
						style="width: 150px; height: 150px; margin: auto; display: block">
						<img class="card-img-top" src="images/<%=rs.getString(6)%>"
							alt="Card image cap">
					</div>
					<div class="card-body">
						<h5 class="Cart title"><%=rs.getString(4)%></h5>
						<h5 class="price"><%=rs.getString(5)%></h5>
						<h6 class="category"><%=rs.getString(3)%></h6>

						<div class="mt-3 d-flex justify-content-between">
							<a href="../edit-product?id=<%=rs.getString(1)%>" class="btn btn-danger">Edit product</a> 
							<a href="../delete-product?id=<%=rs.getString(1)%>"
								class="btn btn-success">Delete Product</a>
						</div>
					</div>
				</div>
			</div>



			<%
			

			
			%>
		</div>
	</div>
	<%
	}
	} catch (Exception e) {
	System.out.println();
	}
	%>
	<%if(z==0){ %>
	<h1 style="color:black;text-align:center;">Nothing to show </h1>
	<%} %>

	

</body>
<footer><%@include file="../includes/footer.jsp"%></footer>
</html>