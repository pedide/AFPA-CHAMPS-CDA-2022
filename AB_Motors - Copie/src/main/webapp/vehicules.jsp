<%@page import="com.ab_motors.dao.vehiculeDAO"%>
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
vehiculeDAO pd = new vehiculeDAO(dbCon.getConnection());
List<vehicule> vehicule = pd.getAllVehicule();

ArrayList<cartVehicule> cart_list = (ArrayList<cartVehicule>)session.getAttribute("cart-listV");
List<cartVehicule> cartVehicule = null;

if (cart_list != null) {
	cartVehicule=pd.getCardVehicule(cart_list);
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
				de nos véhicules</div>
		</h4>
		<div class="row">

			<%
			if (!vehicule.isEmpty()) {

				for (vehicule v : vehicule) {
			%>
			<div class="col-md-4">


				<div class="lineaire-simple">
					<img class="card-img-top" src="product-image/<%=v.getIMG1()%>"
						align="center" ; style="height: 200px;">
					<div class="card-body">
						<h5 class="card-title"><%=v.getMODELE()%></h5>
						<h6 class="price"><%=v.getPRIX()%></h6>
						<h6 class="category"><%=v.getCATEGORIE()%></h6>
						<div class="mt-3 d-flex justify content between"></div>
						<a href="get-info-vehicule?idvehicule=<%=v.getIDVEHICULE() %>"
							class="btn btn-dark">Voir plus d'info</a> <br>
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