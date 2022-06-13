<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.model.User"%>
<%@page import="com.xprodmvc.model.*"%>
<%@page import="com.xprodmvc.dao.*"%>
<%@page import="com.xprodmvc.connection.*"%>


<%
DecimalFormat dcf=new DecimalFormat("#.##");
request.setAttribute("dcf",dcf);

User auth = (User) request.getSession().getAttribute("auth");
Shoppingsession shopS = (Shoppingsession) request.getSession().getAttribute("shoppingcard");
List<CartItem> newCartList = null;

if (auth != null) {
	
	request.setAttribute("auth", auth);
    String email=request.getParameter("email");
   
}



CartItemDao cDao= new CartItemDao(DBCon.getConnection());
newCartList = cDao.cartDetail(shopS.getId());
double total = 0;
%>
<!DOCTYPE html>
<html>
<head>
<title>PANIER</title>
<style type="test/css">
.table tbody{
vertical-align:middle
btn-incre,btn-decre{
box-shadow: none;
font-size:25px; 
}</style>
<%@include file="includes/head.jsp"%>
</head>

<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">


		<table class="table table-light">
			<thead>
				<tr>
<!-- 					<th scope "col">Idcart</th>
                    <th scope "col">idshopping</th> -->
                    <th scope "col">Nom</th>
                    <th scope "col">Categorie</th>
                    <th scope "col">Quantité</th>
                    <th scope "col">Prix</th>

<!-- 
                    <th scope "col">Acheter</th>
                    <th scope "col">Annuler</th> -->
                </tr>
			</thead>
			<tbody>
			<%
			
			
			if(newCartList !=null){
			for (CartItem c : newCartList){
				total += c.getQte() * c.getPrix();	
				//System.out.println("total: "+total);
				request.getSession().setAttribute("total",total);
			%>
				<tr>
					<td><%=c.getNom()%></td>
					<td><%=c.getDesignation()%></td>
					
					<td>
					<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-incre" href="quantite-inc-dec?action=inc&id=<%=c.getIdProduct()%>&qte=<%=c.getQte()%>">
								<i class="fas fa-plus-square"></i>
								</a> <input type="text" name="quantite" class="form-control w-50 center top" 
								  value="<%=c.getQte()%>" readonly>
								  <div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre" href="quantite-inc-dec?action=dec&id=<%=c.getIdProduct()%>&qte=<%=c.getQte()%>"><i
									class="fas fa-minus-square"></i></a>
								</div>
					</div>
					
					</td>
					<td><%=dcf.format(c.getQte() * c.getPrix())%>€</td>
		
				</tr>

<% }
}
			%>
			
			<tr><td style="font-weight:bold">Total: <%=total%>€</td></tr>
				
			</tbody>

		</table>

		<div class="d-flex py-1">
<%-- 			<h3>total prix :${(total>0)?dcf.format(total):0}€</h3> --%>
			<!-- <i class="fas-fa-plus-square" aria-hidden="true"></i> -->


			<!-- <a class="mx-3 btn-primary" href="cart-check-out">Valider la Commande</a> -->
			<!-- ? peut etre null -->
			<!-- //chercher les libreries -->
			<form action="adressPayementForOrders.jsp" method="post">
				<%
				if (auth == null) {
				%>
				<p>
					<button class="btn btn-paye btn-sm" style="background-color: blue";margin-left:5px;>
					
						les Commandes</button>
				</p>
				<%
				} else {
				%>
				<p>
					<button class="btn btn-paye btn-sm" style="background-color: blue";margin-left:5px;>
					vérifier
						et Payer</a></button>
				</p>



			</form>
			<%} %>
		</div>

	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>