<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.model.User"%>
<%@page import="com.xprodmvc.model.*"%>
<%@page import="com.xprodmvc.dao.*"%>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%> 


    
<!DOCTYPE html>
<meta charset="UTF-8">
<title>Payement</title>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script>
if (window.history.forwart(1)!=null)
	window.history.forward(1);

</script>
<%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>




<form action="cart-check-out" method="post">
<div class="row justify-content-around">


<div class="col-md-5">
<div class="card border-0 ">

<div class="left-div">
<h6>Entrer votre adresse de livraison</h6>
        <input class="input-style" type="text" name="adress"
                placeholder required>
        <hr>
</div> 
 


<div class="right-div">
<h6>Enter city</h6>
        <input class="input-style" type="text" name="city"
                placeholder required>
        <hr>
</div> 


<div class="left-div">
<h6>Entrer votre ville</h6>
        <input class="input-style" type="text" name="state"
                placeholder required>
        <hr>
</div> 



<div class="right-div">
<h6>Entrer votre pays</h6>
        <input class="input-style" type="text" name="pays"
                placeholder required>
        <hr>
</div>

 

<hr style="width: 100%">

<div class="center-div">
<h6>Numero de Telephone</h6>
        <input class="input-style" type="text" name="mobileNum"
                placeholder  required>
        <hr>
</div>

<div class="center-div">
<h6>Date de Livraison</h6>
        <input class="input-style" type="text" name="deliveryDate"
                placeholder required>
        <hr>
</div>
<!-- <h6 style="color: red">*This mobile number will also updated to your profile</h6> -->
</div>
</div>



<div class="col-md-5">
<div class="card border-0">
 		  <div class="card-header text-center"><h1>Récapitulatif de Commande</h1></div>

<br>
<table>
<thead>
<%
DecimalFormat dcf=new DecimalFormat("#.##");
request.setAttribute("dcf",dcf);
UserDao udao = new UserDao(DBCon.getConnection());
User user = new User();
String email = request.getParameter("log-mail");
HttpSession session1= request.getSession();
//request.getSession().setAttribute("auth",user);
//session.setAttribute("email",email);
Shoppingsession shopS = (Shoppingsession) request.getSession().getAttribute("shoppingcard");
List<CartItem> newCartList = null;
//session.setAttribute("email",email);
//String email=session1.getAttribute("email").toString();
CartItemDao cDao= new CartItemDao(DBCon.getConnection());
newCartList = cDao.cartDetail(shopS.getId());
double total = 0;


//int sno=0;
try{
	//session.setAttribute("email",email);
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	/* 
	//ResultSet rs1 = st.executeQuery("select sum(total)from oldorders where email='"+email+"' and adress is null") ;
	
	for (CartItem c : newCartList){
		total += c.getQte() * c.getPrix();	
		System.out.println("total: "+total);
	//while (rs1.next())
	//{
		//total=rs1.getInt(1);
	//} 
	} */	
	 
%>		


          <tr>
          <th scope="col"><a href="card.jsp"><i class='fas fa-arrow-circle-left'> Retour </i></a></th>
  <%--           <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i>Total: <%=total%>€</th> --%>
          </tr>
        
        </thead>
        <thead>
          <tr>
          	

                    <th scope "col">Nom</th>
                    <th scope "col">Categorie</th>
                    <th scope "col">Quantité</th>
                    <th scope "col">Prix</th>

           <!--  <th scope="col"><i class="fa fa-inr"></i> price</th> -->
          
       
          </tr>
        </thead>
       
        <tbody>
       
        <%
        System.out.println("ShoppingCardID: " + shopS.getId());
        //ResultSet rs2 = st.executeQuery("select*from products inner join orders on products.id=orders.oid");
        ResultSet rs2 = st.executeQuery("select * from cartitem inner join products on cartitem.idProduct=products.id where idShopping='"+shopS.getId()+"'");
        while(rs2.next()){
        	total += rs2.getInt(4) * rs2.getDouble(11); //qunatity * prix
        
        %>
          <tr>
          <%-- <%sno=sno+1; %> --%>
          
           <td><%=rs2.getString(8) %></td>
            <td><%=rs2.getString(10)%></td>
            <%-- <td><%=rs2.getString(3)%></td> --%>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(4)%></td>
            <td><%=dcf.format(rs2.getInt(4) * rs2.getDouble(11))%>€</td>
           <%--  <td><i class="fa fa-inr"></i> <%=rs2.getString(14)%></td> --%>
            </tr>
         <%} %>
         
		  <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i>Total: <%=total%>€</th>
          </tr>
        
        </tbody>
      </table>

       </div>
        </div>

<%-- <%
        int id = 1;
        ResultSet rs3 = st.executeQuery("select max(idorders) from orders"); //Resultset est une table de resultat

        while (rs3.next()) {
            id = rs3.getInt(1);
            id = id + 1;
        %> --%>


</div>





<%

request.getSession().setAttribute("thetotal",total);
}catch(Exception e){
System.out.println(e);
}
%>

<form action="cart-check-out" method="post">
 <script
src="https://checkout.stripe.com/checkout.js"  
Class="mx-3 stripe-button" 
data-key="pk_test_51KsMNtC2CASgLiYFMWKMzQIMb2qsFpb0Y3Hs1oi7wbfU348UJBYAXeb4XowazinoQZUJeX37Y76EMIZJlYYePTkH00cH0D6uOp"
data-name="BAGS Boutique" 
data-description="Checkout with BAGBoutique payment"
data-image="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxwD0vqrbfQDocT0jGpEY0mQyFB8conm0w2Q&usqp=CAU"
data-amount="${(total>0)?dcf.format(total*100):0}€"
data-local="auto"
data-currency="eur"
data-billing-adress="true"
data-label="Checkout & Pay" >


</script> 



</form>
      <br>
      <br>
      <br>



</body>
</html>

</head>


</body>
<footer>
<%@include file="includes/footer.jsp"%>
</footer>

</html>