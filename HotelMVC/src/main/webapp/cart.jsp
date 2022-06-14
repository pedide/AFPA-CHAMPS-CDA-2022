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
if (auth != null) {
	//response.sendRedirect("index.jsp");
	request.setAttribute("auth", auth);
}else {
	response.sendRedirect("login.jsp?msg=ErrorPlsLogin");
}
//Je rajoute ma liste de produits
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//Je creer un panier de produits
List<Cart> cartRoom = null;
//Si ma liste est non null


if (cart_list != null) {
	ReservationDAO rd = new ReservationDAO(DbCon.getConnection());

	RoomDAO rDAO = new RoomDAO(DbCon.getConnection());
	cartRoom = rDAO.getCartRooms(cart_list);
	request.setAttribute("cart_list", cart_list);	
	double total = rd.getTotalCartPrice(cart_list);;

	request.setAttribute("total", total);

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
	<%@include file="includes/navbar.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, btn-decre {
	box-shadow: none;
	font-size: 25px;
}
.stripe-button-el span {
  background: #5e366a !important;
  background-image:none !important;
  background-color: #5e366a !important;
}
</style>
</head>
<body style="margin-top: 8em">
	<div class="container">
		<div class="card-header my-3">Liste cart</div>
					<h3>Total Price: ${(total>0)?dcf.format(total):0}€ <a href="info-check-out.jsp?id=<%=auth.getIduser()%>" class="btn btn-primary btn-sm">Réserver toutes les chambres</a>
					</h3>
					
		<table class="table table-light ">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Nom</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartRoom) {
				%>
				<tr>
					<td><img style="width: 15em"
						src="images/<%=c.getRoomImage()%>"></img></td>

					<td><%=c.getRoomName()%></td>
					<td><%=c.getRoomCategory()%></td>
					<td><%=dcf.format(c.getRoomPrice())%>€</td>
					<td>
						<form action="reservation-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getRoomId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">

							</div>
							<a href="info-check-out.jsp?id=<%=c.getRoomId()%>" class="btn btn-primary btn-sm">Réserver</a>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getRoomId()%>"
						class="btn btn-sm btn-danger"> Remove </a></td>
				</tr>
				<%
				//System.out.println(c.getId());
				}
				}
				%>

			</tbody>

		</table>
	</div>
</body>
</html>