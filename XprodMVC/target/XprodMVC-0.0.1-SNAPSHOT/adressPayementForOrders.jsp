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
<div class="left-div>">
<div class="container"  float: right >
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center"><h1>Récapitulatif de Commande</h1></div>
			<div class="card-body ">
<br>
<table>
<thead>
<%
UserDao udao = new UserDao(DBCon.getConnection());
User user = new User();
String email = request.getParameter("log-mail");
HttpSession session1= request.getSession();
request.getSession().setAttribute("auth",user);
session.setAttribute("email",email);

//session.setAttribute("email",email);
//String email=session1.getAttribute("email").toString();
int total=0;
int sno=0;
try{
	//session.setAttribute("email",email);
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total)from orders where email='"+email+"' and adress is null") ;
	while (rs1.next())
	{
		total=rs1.getInt(1);
	}
			

%>

          <tr>
          <th scope="col"><a href=""><i class='fas fa-arrow-circle-left'> Retour </i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Nom Produit</th>
            <!-- <th scope="col">Category</th> -->
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <!-- <th scope="col">Sub Total</th> -->
          </tr>
        </thead>
       
        <tbody>
       
        <%
        ResultSet rs2 = st.executeQuery("select*from products inner join orders on products.id=orders.oid");
        while(rs2.next()){
        %>
          <tr>
          <%sno=sno+1; %>
          
           <td><%out.println(sno); %></td>
            <td><%=rs2.getString(2)%></td>
            <%-- <td><%=rs2.getString(3)%></td> --%>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(5)%></td>
            <td><%=rs2.getString(11)%></td>
           <%--  <td><i class="fa fa-inr"></i> <%=rs2.getString(14)%></td> --%>
            </tr>
         <%} %>
        
        </tbody>
      </table>
      </div>
      </div>
      </div>
      </div>
<hr style="width: 100%">


<div class="left-div">
<h6>Entrer votre adresse de livraison</h6>
        <input class="input-style" type="text" name="adress"
                placeholder="Merci de saisir votre adresse de livraison" required>
        <hr>
</div> 
 


<div class="right-div">
<h6>Enter city</h6>
        <input class="input-style" type="text" name="city"
                placeholder="Merci de saisir votre adresse de livraison" required>
        <hr>
</div> 


<div class="left-div">
<h6>Entrer votre ville</h6>
        <input class="input-style" type="text" name="state"
                placeholder="Merci de saisir votre adresse de livraison" required>
        <hr>
</div> 



<div class="right-div">
<h6>Entrer votre pays</h6>
        <input class="input-style" type="text" name="country"
                placeholder="Merci de saisir votre adresse de livraison" required>
        <hr>
</div>

 
<!-- <h6 style="color: red">*If there is no address its mean that you did not set you address!</h6>
<h6 style="color: red">*This address will also updated to your profile</h6>
<hr style="width: 100%">
<div class="left-div">
<h6>Select way of Payment</h6>
 
</div> -->

<!-- <div class="right-div">
<h6>Pay online on this btechdays@pay.com</h6>
 -->
<!-- <h6 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h6> -->

<hr style="width: 100%">

<div class="center-div">
<h6>Numero de Telephone</h6>
        <input class="input-style" type="text" name="mobileNum"
                placeholder="Merci de saisir votre adresse de livraison" required>
        <hr>
</div>

<div class="center-div">
<h6>Date de Livraison</h6>
        <input class="input-style" type="text" name="deliveryDate"
                placeholder="Merci de saisir votre adresse de livraison" required>
        <hr>
</div>
<!-- <h6 style="color: red">*This mobile number will also updated to your profile</h6> -->
</div>
<div class="right-div">
<!-- <h6 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h6> -->
<!-- <i class='far fa-arrow-alt-circle-right'></i>
<h6 style="color: red">*Fill form correctly</h6>
</div> -->
<%
}catch(Exception e){
System.out.println(e);
}
%>

<div class="right-div">
 <script
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


</script> 
</div>
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