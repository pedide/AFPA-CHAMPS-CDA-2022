<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ab_motors.model.cart"%>
<%@page import="com.ab_motors.model.products"%>
<%@page import="java.util.List"%>
<%@page import="com.ab_motors.connection.dbCon"%>
<%@page import="com.ab_motors.dao.productsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}

ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
List<cart> cartProduct = null;

if (cart_list != null) {

    productsDAO pDao = new productsDAO(dbCon.getConnection());
    cartProduct = pDao.getCardProducts(cart_list);
    double total = pDao.getTotalCartPrice(cart_list);
    request.setAttribute("total", total);
    request.setAttribute("cart_list", cart_list);

}

productsDAO pd = new productsDAO(dbCon.getConnection());
List<products> products = pd.getAllProducts();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<%@ include file="incloudes/navbar.jsp"%>
<title>Search Home</title>
</head>
<body>


	<h1>Résultat recherche</h1>
	<div class="container">

		<div class="row">
			<%try{
        	int cpt=0;
			String search = request.getParameter("search");
			System.out.println(search);
			String query="Select * from products where nom like '%"+search+"%' or categorie like '%"+search+"%' and active='Yes'";
			Connection con = dbCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
		    int z=0;
		    while(rs.next()){
			   cpt++;
				z=1;%>


			<div class="col-md-4">


				<div class="lineaire-simple">
					<img class="card-img-top" src="product-image/<%=rs.getString(5)%>"
						align="center" ; style="width: 250px; height: 200px;">
					<div class="card-body">
						<h5 class="card-title"><%=rs.getString(2)%></h5>
						<h6 class="price"><%=rs.getString(4)%></h6>
						<h6 class="category"><%=rs.getString(3)%></h6>
						<div class="mt-3 d-flex justify content between"></div>
						<%--<a href="add-to-cart-servlet?idproducts=<%=p.getIDPROD() %>" class="btn btn-dark">Add to card</a> 
						<a href="order-now?quantity=1&idproducts=<%=p.getIDPROD() %>" class="btn btn-primary">Buy now</a> --%>
						<a href="editproducts.jsp?idproducts=<%=rs.getString(1) %>"
							class="btn btn-dark">Edit </a> <a
							href="../delete-products?idproducts=<%=rs.getString(1) %>"
							class="btn btn-red">Delete </a>
					</div>
				</div>
			</div>
		</div>
		<%}%>Il y a
		<%out.print(cpt); %>
		résultat(s) pour la recherche: "<%out.print(search); %>"
		<%}catch(Exception e) {
			System.out.println(e);
			
		}
		%>
	</div>
	</div>
</body>
</html>