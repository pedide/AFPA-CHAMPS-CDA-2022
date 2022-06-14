<%@page import="com.hotelmvc.model.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
int id = auth.getIduser();
System.out.println("id user get parameter"+id);

ReservationDAO rd = new ReservationDAO(DbCon.getConnection());
List<Reservation> rPending = rd.userReservationPending(id);
List<Reservation> infoUser = rd.getInfoUserCheckOut(id);

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;


if (rPending != null) {
	RoomDAO rDAO = new RoomDAO(DbCon.getConnection());
	double total = rd.getTotalReservationPrice(rPending);
	request.setAttribute("total", total);
}

%>

<!DOCTYPE html>
<html>
<head>
<title>Hotel Favoris</title>
		<%@include file="includes/navbar.jsp"%>



</head>
<body style="margin-top: 8em">

	<div class="container " style="margin-left: 10em; max-width: 70em; float: left">
		<div class="card-header my-3">Finalisez votre réservation Total : ${(total>0)?dcf.format(total):0}€</div>
								<h3>Total Price: ${(total>0)?dcf.format(total):0}€</h3>
		
		<table class="table table-light ">

			<tbody>
			<%
				if (!rPending.isEmpty()) {
					for (Reservation r : rPending) {
			%>
				<tr>
					<td>
						<img style="width: 10em" src="images/<%=r.getRoomImage()%>"></img>
					</td>
					<td><%=r.getRoomName()%></td>
					<td><%=dcf.format(r.getPrice())%>€</td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=r.getRoomName()%>" class="form-input">
							<div class="form-group d-flex justify-content-between w-50">

							</div>
						</form>
					</td>
					<td><a href="remove-from-reservation?id=<%=r.getReservationId()%>"
						class="btn btn-sm btn-danger">Supprimer</a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>

		</table>
	</div>
				<%
				if (!infoUser.isEmpty()) {
					for (Reservation i : infoUser) {
			%>
		<div id="container" style=" margin: auto; border: 1px solid black; padding: 2em; float: right; margin-right: 10em">
		<div id="checkout">
			<div class="card w-50 mx-auto my-50">
				<div class="card-header text-center">Infomations pour le check-in</div>
				
				<div class="card-body">
					<form action="add-user-check-in?id=<%=i.getUid()%>" method="post">
						<div class="form-group">
							<label>Nom</label> 
							<input type="text" class="form-control" name="lastnameCheckIn"  value ="<%=Optional.ofNullable(i.getCheckInLastname()).orElse("")%>" placeholder="Enter name" required>
						</div>
						<div class="form-group">
							<label>Prénom</label> 
							<input type="text" class="form-control" name="firstnameCheckIn" value ="<%=Optional.ofNullable(i.getCheckInFirstname()).orElse("")%>" placeholder="Enter first name" required>
						</div>
						<div class="form-group">
							<label>Adresse email</label> 
							<input type="text" class="form-control" name="emailCheckIn" value ="<%=Optional.ofNullable(i.getCheckInEmail()).orElse("")%>" placeholder="Enter your email" required>
						</div>

						<div class="form-group">
							<label>Numéro de téléphone</label> 
							<input type="text" class="form-control" name="mobileNumberCheckIn"  value ="<%=Optional.ofNullable(i.getcheckInMobileNumber()).orElse("")%>" placeholder="Enter your mobile number" required>
						</div>
						<div class="form-group">
							<label>Numéro de réservation : </label> 
							<label><%=i.getNumReservation()%></label> 
							
						</div>
			
				

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Valider les informations pour le check in</button>
						</div>

					</form>
				</div>
			</div>
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Some thing went wrong</h1>
			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Some thing went wrong</h1>
			<%
			}
			%>
		</div>
				<%
				}
				}
				%>
				
	
		<div id="container" style=" margin: auto; border: 1px solid black; padding: 2em; margin-top: 1em  ">
			<div id="checkout-payment">
				<div class="card w-50 mx-auto my-50">
					<div class="card-header text-center">Prix total : ${(total>0)?dcf.format(total):0}€</div>
						<div class="card-body">
							<div class="form-group">
								<form action="check-out?id=${(total>0)?dcf.format(total):0}" method="post" style="text-align: center; margin-top: 0.3em" >
									<script type="text/javascript" 
									src="https://checkout.stripe.com/checkout.js" 
									class="mx-3 stripe-button stripe-button-el" 
									data-key="pk_test_51KsMPsFviP3FCg2KC7JmkDFdiqgKmXcvXXyqBXctTDBPqYVaEKsftR2vkXhNqSy7yLKBmzigDRf9cQeJUtMnAS1600oRpHcrQp"
									data-name="Barrière Hotel Réservation"
									data-description="Checkout avec Barrière Paiement"
									data-image="images/logo1.png"
									data-amount= "${(total>0)?dcf.format(total*100):0}"
									data-local="auto"
									data-currency="eur"
									data-billing-address= "true"
									data-label="Checkout & Payez">
									</script>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
	
		</div>
	</body>
</html>