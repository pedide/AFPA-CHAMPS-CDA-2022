<%@page import="com.ab_motors.dao.vehiculeDAO"%>
<%@ page import="com.ab_motors.model.*"%>
<%@ page import="com.ab_motors.dao.productsDAO"%>
<%@ page import="com.ab_motors.connection.dbCon"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
    String email = request.getParameter("email");
}
ArrayList<cartVehicule> cartv_list = (ArrayList<cartVehicule>)session.getAttribute("cartv-list");
List<cartVehicule> cartVehicule1 = null;


    vehiculeDAO vDao = new vehiculeDAO(dbCon.getConnection());
   
    cartVehicule1=vDao.getCardVehicule(cartv_list);
    request.setAttribute("cart_list", cartv_list);

    
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
			<div class="card-header my-3 lineaire-simple" align="center">Infos du véhicule</div>
		</h4>
		<div class="row">
			<div class="col-md-12">
<%

            if(cartv_list != null){
               for(cartVehicule v : cartVehicule1){
%>
				<div class="lineaire-simple">
					<img class="card-img-top" src="product-image/<%=v.getIMG1()%>"
						align="center" ; style="height: 450px;"></div>
					<!-- <div class="card-body"> -->
					
						<!-- <h5 class="card-title"> -->
						<div class="left-div">
						<h3><i class="fas fa-solid fa-car"></i> Modèle : <%=v.getMODELE()%> </h3>
						<br><h3><i class="fas fa-solid fa-arrow-down-short-wide"></i> Catégorie : <%=v.getCATEGORIE()%></h3>
						<br><h3><i class="fas fa-solid fa-gas-pump"></i> Carburant : <%=v.getCARBURANT()%></h3>
						<br><h3><i class="fas fa-solid fa-dumbbell"></i> Puissance : <%=v.getPUISSANCE()%> CV</h3>
						<br><h3><i class="fas fa-solid fa-wrench"></i> Boite : <%=v.getBOITE()%></h3>
						</div>
						
						<div class="right-div"> 
						<h3>Marque : <%=v.getMARQUE()%></h3>    
						<br><h3>Prix : <%=v.getPRIX()%>€</h3>
						<br><h3> Kilométrage : <%=v.getKILOMETRAGE()%> KM</h3>
						<br><h3>Année : <%=v.getANNEE()%></h3>
						<br>
						</div> 
                        
						
						<!-- <div class="mt-3 d-flex justify content between"> -->
						
					
			</div></div></div>
<%}}

%>
	<%@include file="incloudes/footer.jsp"%>

</body>
</html>