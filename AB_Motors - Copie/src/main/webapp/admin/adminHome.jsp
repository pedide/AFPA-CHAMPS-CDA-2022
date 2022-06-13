<%@page import="com.ab_motors.model.products"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.ab_motors.model.Users"%>
<%@ page import="com.ab_motors.model.cart"%>
<%@ page import="com.ab_motors.dao.productsDAO"%>
<%@ page import="com.ab_motors.connection.dbCon"%>
<%@ page import="java.util.*"%>
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
<link rel="stylesheet" href="../css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<title>AdminHome</title>



<%@ include file="/admin/adminHeader.jsp"%>
</head>

<body>

	<div class="container">




		<h4>
			<div class="card-header my-3 lineaire-simple" align="center">Liste des produits</div>
		</h4>
		<div class="row">

			<%
			if (!products.isEmpty()) {

				for (products p : products) {
			%>
			<div class="col-md-4">


				<div class="lineaire-simple">
					<img class="card-img-top" src="../product-image/<%=p.getIMAGE()%>"
						align="center" ; style="height: 200px;">
					<div class="card-body">
						<h5 class="card-title"><%=p.getNOM()%></h5>
						<h5 class="price"><%=p.getPRIX()%>€
						</h5>
						<h5 class="category"><%=p.getCATEGORIE()%></h5>
						<div class="mt-3 d-flex justify content between"></div>
						<%--<a href="add-to-cart-servlet?idproducts=<%=p.getIDPROD() %>" class="btn btn-dark">Add to card</a> 
						<a href="order-now?quantity=1&idproducts=<%=p.getIDPROD() %>" class="btn btn-primary">Buy now</a> --%>
						<a href="editproducts.jsp?idproducts=<%=p.getIDPROD() %>"
							class="btn btn-edit">Edit </a> <a
							href="../delete-products?idproducts=<%=p.getIDPROD() %>"
							class="btn btn-red">Delete </a>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>
		</div>
	</div>
	<div class="footer_page">
		<%@include file="../incloudes/footer.jsp"%>
	</div>

</body>
</html>