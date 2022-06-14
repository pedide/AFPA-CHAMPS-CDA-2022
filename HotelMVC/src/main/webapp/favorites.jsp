<%@page import="com.hotelmvc.model.*"%>
<%@page import="com.hotelmvc.dao.RoomDAO"%>
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
}
//Je rajoute ma liste de produits
ArrayList<Favorites> fav_list = (ArrayList<Favorites>) session.getAttribute("fav-list");
//Je creer un panier de produits
List<Favorites> favRoom = null;
//Si ma liste est non null

if (fav_list != null) {

	//On recupere notre connection
	RoomDAO rDAO = new RoomDAO(DbCon.getConnection());
	favRoom = rDAO.getFavRooms(fav_list);

	request.setAttribute("fav_list", fav_list);
	System.out.println("Fav Romm liste : " + favRoom + ", " + fav_list);
	System.out.println("Fav Romm name : " + favRoom + ", " + fav_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel Favoris</title>
		<%@include file="includes/navbar.jsp"%>



</head>
<body style="margin-top: 8em">

	<div class="container">
		<div class="card-header my-3">Liste de vos favoris</div>
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
				if (fav_list != null) {
					//cartProduct = mes elements qui sont dans mon panier
					for (Favorites f : favRoom) {
						//System.out.println(c.getId());
						//System.out.println(c.getId());
							System.out.println("Favoites ligne 18 : Arraylist Fav : id : [ " + f.getRoomId());

				%>
				<tr>
					<td><img style="width: 15em"
						src="images/<%=f.getRoomImage()%>"></img></td>

					<td><%=f.getRoomName()%></td>
					<td><%=f.getRoomCategory()%></td>
					<td><%=dcf.format(f.getRoomPrice())%>€</td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=f.getRoomId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">

							</div>
							<button type="submit" class="btn btn-primary btn-sm">Réserver</button>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=f.getRoomId()%>"
						class="btn btn-sm btn-danger"> Remove </a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>

		</table>
	</div>
</body>
</html>