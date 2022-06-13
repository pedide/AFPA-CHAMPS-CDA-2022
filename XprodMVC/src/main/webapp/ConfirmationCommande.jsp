<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import java.text.DecimalFormat %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation Commande</title>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<%

Order currentOrder = (Order)session.getAttribute("currentOrder");
System.out.println("id order is "+currentOrder.getIdOrder());

%>
<div>
<h1>Confirmation Commande</h1>
<h5>Merci pour vottre commande. nous l'avons reçue et nous la traiterons dans les plus bref délais. </h5>
<h6> Votre Numéro de commande est: <%=currentOrder.getIdOrder() %></h6>
<h6>Adresse de livraison: <%=currentOrder.getAdress() %></h6>
<h6>City: <%=currentOrder.getCity() %></h6>
<h6>Ville: <%=currentOrder.getVille() %></h6>
<h6>mobileNumber: <%=currentOrder.getMobileNumber() %></h6>
<h6>pays: <%=currentOrder.getPays() %></h6>
<h6>Prix totale: <%=currentOrder.getTotal()%>€</h6>



<h6>Vous disposer d'un délais de 14 jours,à compter de la reception de votre commande, pour nous retourner les produits qui ne vous conviennent pas sans indication de motif.</h6>

</div>








<%@include file="includes/footer.jsp"%>
</body>

</html>