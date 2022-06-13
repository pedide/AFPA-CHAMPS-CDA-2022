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


if (auth != null) {
	
	request.setAttribute("auth", auth);
    String email=request.getParameter("email");
   
}
Cart cart = new Cart();
ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if(cart_list !=null){
	ProductDao pDao= new ProductDao(DBCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	
	int product_id= cart.getId();
	
	Cart tuto =pDao.addToCartTotal(product_id,"email");
   double total = pDao.getTotalCartPrice(cart_list);
   request.setAttribute("total",total);
  
  
	request.setAttribute("cart_list", cart_list);
}

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
		<div class="d-flex py-1">
			<h3>total prix :${(total>0)?dcf.format(total):0}€</h3><!-- <i class="fas-fa-plus-square" aria-hidden="true"></i> -->
	
			
			<!-- <a class="mx-3 btn-primary" href="cart-check-out">Valider la Commande</a> -->
<!-- ? peut etre null -->
<!-- //chercher les libreries -->
<form action="adressPayementForOrders.jsp" method="post">
<%if(auth == null){ %>
<p><button class="btn btn-paye btn-sm" style="background-color:blue";margin-left:5px;>Valider les Commandes</button></p>
<%}else{%>
<p><button class="btn btn-paye btn-sm" style="background-color:blue";margin-left:5px;>vérifier et Payer</button></p>


<%-- <script
src="https://checkout.stripe.com/checkout.js"  
Class="mx-3 stripe-button" 
data-key="pk_test_51KsMNtC2CASgLiYFMWKMzQIMb2qsFpb0Y3Hs1oi7wbfU348UJBYAXeb4XowazinoQZUJeX37Y76EMIZJlYYePTkH00cH0D6uOp"
data-name="Xprod sacs" 
data-description="Checkout with xprod payment"
data-image="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxwD0vqrbfQDocT0jGpEY0mQyFB8conm0w2Q&usqp=CAU"
data-amount="${(total>0)?dcf.format(total*100):0}€"
data-local="auto"
data-currency="eur"
data-billing-adress="true"
data-label="Checkout & Pay" >


</script> --%>
</form>
<%} %>
		</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope "col">Nom</th>
                    <th scope "col">Categorie</th>
                    <th scope "col">Prix</th>
                    <th scope "col">Quantité</th>
                    <th scope "col">Acheter</th>
                    <th scope "col">Annuler</th>
                </tr>
			</thead>
			<tbody>
			<%
			if(cart_list !=null){
			for (Cart c : cartProduct){
			%>
				<tr>
					<td><%=c.getNom()%></td>
					<td><%=c.getCategorie()%></td>
					
					<td><%=dcf.format(c.getPrix())%>€</td>
					<td>
						<form action="oreder-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-incre" href="quantite-inc-dec?action=inc&id=<%=c.getId()%>">
								<i class="fas fa-plus-square"></i>
								</a> <input type="text" name="quantite" class="form-control w-50" 
								  value="<%=c.getQuantite() %>" readonly>
								  <div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre" href="quantite-inc-dec?action=dec&id=<%=c.getId()%>"><i
									class="fas fa-minus-square"></i></a>
							</div>
							</div>

						
				
					
					<td>
						<button type="submit" class="btn btn-sm btn-primary">Acheter</button>

					</td>
					</form>
						</td>
					<td>
					
						<a class="btn btn-sm btn-danger" href="remove-from-card?id=<%=c.getId()%>" >Retirer</a>

					</td>
					
					
				</tr>
<% }
}
			%>
			</tbody>

		</table>
	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>