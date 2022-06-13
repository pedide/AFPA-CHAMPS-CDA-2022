<%@ page import="com.xprodmvc.dao.*"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	UserDao udao = new UserDao(DbCon.getConnection());
	User user = new User();
	String email1 = request.getParameter("login-mail");
	HttpSession session1 = request.getSession();
	//request.getSession().setAttribute("auth", user);
	//session.setAttribute("email", email);

	User auth = (User) request.getSession().getAttribute("auth");

	if (auth != null) {
		request.setAttribute("auth", auth);
		//String email = request.getParameter("email");
	}
%>  
<html>

<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Adress payement for order</title>
<%@include file="includes/head.jsp"%>

<script>
	if (window.history.forward(1) != null) {
		window.history.forward();
	}
</script>

<body>
<%@include file="includes/navbar.jsp"%>
<%-- <%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Votre message a bien été ajouté !</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Il y a une erreur ! Merci d'assayer à nouveau !</h3>
	<%
	}
%> --%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">
				<h3>Récapitulatif de votre commande</h3>
			</div>
			<div class="card-body">
				<br>
				<table>
					<thead>
						<%
						//String email = session.getAttribute("email").toString();
						int total = 0;
						int sno = 0;
						int id = 1;
						try {
							Connection con = DbCon.getConnection();
							Statement st = con.createStatement();
							ResultSet rs1 = st.executeQuery("select sum(total) from orders where email='"+email1+"' and adresse is null");

							while (rs1.next()) {
								total = rs1.getInt(1);

							}
						%>
						<tr>
							<th scope="col"><a href=""><i class='fas fa-arrow-circle-left'> Retour</i></a></th>
							<th scope="col" style="background-color:#FF9999;">Total: <i class="fa fa-inr"></i>
							<%out.println(total);%>
							</th>
						</tr>
					</thead>
					<thead>
						<tr>
							<th scope="col">S.No</th>
							<th scope="col">Nom produit</th>
							<!-- <th scope="col">Category</th> -->
							<th scope="col"><i class="fa fa-inr"></i> Prix</th>
							<th scope="col">Quantité</th>
							<!-- <th scope="col">Sub Total</th> -->
						</tr>
					</thead>
					<tbody>
						<%
        				/* ResultSet rs2 = st.executeQuery("select * from produits inner join orders on produits.idProduit = orders.idorders");
						ResultSet rs2 = st.executeQuery("select * from produits inner join orders on produits.IDPRODUIT = orders.idProduct where idOrders = '" + id + "'"); */
						ResultSet rs2 = st.executeQuery("select * from produits inner join orders on produits.idProduit = orders.idproducts where idorders = '" + id + "'");

						while (rs2.next()){
        				%>
						<tr>
							<%sno = sno+1;%>
							<td><%out.println(sno); %></td>
							<td><%=rs2.getString(3) %></td>
							<%-- <td><%=rs2.getString(3) %></td> --%>
							<td><i class="fa fa-inr"></i><%=rs2.getString(5) %></td>
							<td><%=rs2.getString(14) %></td>
							<%-- <td><i class="fa fa-inr"></i><%=rs2.getString(10) %> </td> --%>
						</tr>
						<%}%>
					</tbody>
				</table>

			</div>
		</div>
	</div>

	<%-- 	<%
	int id = 1;
	try {
		Connection con = DbCon.getConnection();//creer la connexion
		Statement st = con.createStatement();
--%>
	<%	
		//int id = 1;
		ResultSet rs3 = st.executeQuery("select max(idorders) from orders"); //Resultset est une table de resultat

		while (rs3.next()) {
			id = rs3.getInt(1);
			id = id + 1;
		%>
<%--
	} catch (Exception e) {
		e.getStackTrace();
		System.out.println(e.getMessage());
	}
 
--%>
	
	<hr style="width: 100%">
	<div class="left-div">
		<h3>Entrer votre nom</h3>
		<input class="input-style" type="text" name="name"
				placeholder="Merci de saisir votre nom" required>
		<hr>
	</div>
	<div class="right-div">
		<h3>Entrer votre prénom</h3>
		<input class="input-style" type="text" name="prenom"
				placeholder="Merci de saisir votre prénom" required>
		<hr>
	</div>
	<div class="left-div">
		<h3>Entrer votre adresse de livraison</h3>
		<input class="input-style" type="text" name="adresse"
				placeholder="Merci de saisir votre adresse de livraison" required>
		<hr>
	</div>
	<div class="right-div">
		<h3>Entrer votre code postale</h3>
		<input class="input-style" type="text" name="cp"
				placeholder="Merci de saisir votre code postale" required>
		<hr>
	</div>
	<div class="left-div">
		<h3>Entrer le nom de votre ville</h3>
		<input class="input-style" type="text" name="ville"
				placeholder="Merci de saisir votre ville" required>
		<hr>
	</div>
	<div class="right-div">
		<h3>Entrer votre pays</h3>
		<input class="input-style" type="text" name="pays"
				placeholder="Merci de saisir votre pays" required>
		<hr>
	</div>
	
<!-- 	<h3 style="color: red">*If there is no address its mean that you -->
<!-- 		did not set you address!</h3> -->
<!-- 	<h3 style="color: red">*This address will also updated to your -->
<!-- 		profile</h3> -->
	<div class="left-div">
		<h3>Votre numéro de téléphone</h3>
		<input class="input-style" type="text" name="nomberMobile"
				placeholder="Merci de saisir votre numéro de téléphone portable" required>
		
<!-- 		<h6 style="color: black" style="text-align: center">*This mobile number will also updated to -->
<!-- 			your profile</h6> -->
		<hr>
	</div>	
	<%}  %>

<!-- On n'utilisera pas		 -->
<!-- 	<hr style="width: 100%"> -->
<!-- 	<div class="left-div"> -->
<!-- 		<h3>Select way of Payment</h3> -->
<!-- 	</div> -->
<!-- 	<div class="right-div"> -->
<!-- 		<h3>Pay online on this btechdays@pay.com</h3> -->
<!-- 		<h3 style="color: red">*If you select online Payment then enter -->
<!-- 			you transaction ID here otherwise leave this blank</h3> -->
<!-- 	</div> -->
<!-- 	<hr style="width: 100%"> -->

	<div class="text-center">
		<button type="submit" class="btn btn-primary">
			<a href="cart.jsp"><i class='far fa-arrow-alt-circle-left'></i></a>
		</button>
	</div>
	<%
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
	
<!-- 	<div class="right-div"> -->
<!-- 		<h3 style="color: red">*If you enter wrong transaction id then -->
<!-- 			your order will we can cancel!</h3> -->
		
<!-- 		<h3 style="color: red">*Fill form correctly</h3> -->
<!-- 	</div> -->

	<form action="cart-check-out" method="post"> 
		<div class="right-div">	
 			<script 
 				src="https://checkout.stripe.com/checkout.js" 
 				class="mx-3 stripe-button"
 				data-key="pk_test_51KsMNVLKYS2bssV2pv0ZUc8PvK4ziQKAAnSPwoh05b5uAaOslrAeO2AipLfOfzn1TALWgWeCZW1TbRlX9I409bdB00CJ0QpuNZ"
 				data-name="Diablement Bon E-shopping" 
 				data-description="Checkout et Diablement Bon paiement" 
				data-image="images/toqueIcon.png" 				data-amount="${(total>0)?dcf.format(total*100):0}" 				
 				data-local = "auto" 
 				data-currency="eur" 
 				data-billing-adress="false" 
 				data-label="Valider votre paiement">
 			</script> 
  		</div>	
 	</form> 
 	
 	
	<br>
	<br>
	<br>

</body>
<%-- <footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer> --%>
</html>