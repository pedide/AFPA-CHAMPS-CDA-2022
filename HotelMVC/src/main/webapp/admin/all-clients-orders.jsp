<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />	

<title>Clients Orders</title>
	<%@include file="adminHeader.jsp"%>

</head>
<body style="margin-top: 8em">
	<table style="text-align: center; ">
		<thead>
			<th style="background: white; text-align: center" colspan="8">
				<div class="search-container" colspan="9">
					<form action="searchAdminOrders.jsp" method="post">
						<input type="text" placeholder="search" name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</th>
		</thead>
		<thead style="position: sticky; top: 99px;">
			<tr>
				<th scope="col">Id Reservation</th>
				<th scope="col">Id User</th>
				<th scope="col">Id Room</th>
				<th scope="col">Quantity <i class="fas fa-euro-sign"></i></th>
				<th scope="col">Price TTC</th>			
				<th scope="col">Email Client</th>
				<th scope="col">Nom</th>
				<th scope="col">Prénom</th>



			</tr>
		</thead>
		<tbody>
			<%
			try {
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				/* 			Besoin de strocker la requete dans un resort set
				 */
				ResultSet rs = st.executeQuery("SELECT * FROM reservation_order");

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(10)%><i class="fa fa-euro-sign"></i></td>
				<td><%=rs.getString(11)%></td>				
				<td><%=rs.getString(12)%></td>
				<td><%=rs.getString(13)%></td>




			</tr>
			<%
			}

			} catch (Exception e) {
			System.out.println(e);
			}
			%>
		</tbody>

	</table>

</body>
</html>