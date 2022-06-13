<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.gaiaconsulting.model.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.dao.ProductsDao"%>
<%@page import="com.gaiaconsulting.model.User"%>
<%@page import="com.gaiaconsulting.connection.DbCon"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1) !=null)
	window.history.forward(1);

</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString(); //je récucpère l'email via la session 
int total=0;//j'initialise a 0
int sno=0;// je créé une variable
try{                                        //ensuite je met mon try (meme quand la card qui récupere le total)
	Connection con = DbCon.getConnection(); //je me connect a ma session
	Statement st = con.createStatement();   //je créé une statement
	ResultSet rs1 = st.executeQuery("select sum(total)from oders where email='"+email+"'and address is NULL");     // j'ai besoin de mon resultSet, j'ai besoin de ma somme total (sum)que je récupère de orders
while(rs1.next()) //je vais récuperer ma table de résultat dans une boucle
{
total=rs1.getInt(1);
}

%>

          <tr>
          <th scope="col"><a href=""><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
    /*     je récupère tout les produits  */
        ResultSet rs2 = st.executeQuery("select * from produits inner join orders on produits.IDPRODUIT = orders.idOrders");
        while(rs2.next()){
        	
        
        %> 
          <tr>
<%sno=sno+1; %>   <!-- je récupère le compteur  -->
       
           <td><%out.println(sno); %></td><%-- je récupère le compteur   --%>
            <td><%=rs2.getString(2) %></td><%-- je récupère l'élement d'index 2   --%>
            <td><%=rs2.getString(3) %></td><%-- je récupère l'élement d'index 3   --%>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(4) %></td>
            <td> <%=rs2.getString(8) %></td>
            <td><i class="fa fa-inr"></i><%=rs2.getString(10) %></td>
            </tr>
         <%} %>
        </tbody>
      </table>
      
<hr style="width: 100%">

 <div class="left-div">
 <h3>Enter Address</h3>

 </div>

<div class="right-div">
<h3>Enter city</h3>

</div> 

<div class="left-div">
<h3>Enter State</h3>

</div>

<div class="right-div">
<h3>Enter country</h3>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 
</div>

<div class="right-div">
<h3>Pay online on this btechdays@pay.com</h3>

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<i class='far fa-arrow-alt-circle-right'></i>
<h3 style="color: red">*Fill form correctly</h3>
</div>
<%}catch(Exception e){
	System.out.println(e);
}
%>

      <br>
      <br>
      <br>

</body>
<footer><%@include file="includes/footer.jsp"%></footer>
</html>