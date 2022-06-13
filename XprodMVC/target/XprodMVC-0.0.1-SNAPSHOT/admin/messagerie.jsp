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


<% 
ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MESSAGERIE</title>
<%@include file="adminHeader.jsp"%>
</head>
<body>

<div class="container"  float: right >
		<div class="card w-300 mx-auto my-5">
			<div class="card-header text-center"><h1>MESSAGE REÇU</h1></div>
			<div class="card-body ">
			
			<br>
<table>
<thead>
<%

UserDao udao = new UserDao(DBCon.getConnection());
User user = new User();
//String email = request.getParameter("log-mail");
HttpSession session1= request.getSession();
request.getSession().setAttribute("auth",user);
session.setAttribute("email",email);


int idm;

try{
	
	Connection con = DBCon.getConnection();
	Statement st = con.createStatement();

			

%>


          <tr>
          <th scope="col"><a href="adminHome.jsp"><i class='fas fa-arrow-circle-left'> RETOUR</i></a></th>
            <%-- <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th> --%>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">Nom</th>
            <th scope="col">email</th>
             <th scope="col">mobilNum</th>
            <th scope="col"><i class="fa fa-inr"></i> Objet Message</th>
            <th scope="col">Message</th>
            <th scope="col">Date</th>
         <th scoope="col">ouvrir <i class="far fa-envelope-open"></i></th>
          </tr>
        </thead>
       
        <tbody>
       
        <%
     
   /*      ResultSet rs1 = st.executeQuery("select count(*) from messageu where idm is not null");
        
       out.println(rs1.getInt(1)); */
        ResultSet rs = st.executeQuery("select * from messageu where idm is not null");
        while(rs.next()){
        %>
          <tr>
          
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td> 
            <td><i class="fa fa-inr"></i> <%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
             <td><i class="fa fa-inr"></i> <%=rs.getString(7)%></td> 
             <td><a href="repondreMessage.jsp?idm=<%=rs.getString(1)%>">Ouvrir<i class="far fa-envelope-open"></i></a></td>
            </tr>
         <%} %>
        
        </tbody>
      </table>
      </div>
       
       
<%
}catch(Exception e){
System.out.println(e);
}
%>
			
			
			
			
			
</div>
</div>
</div>







</body>
<%@include file="/includes/footer.jsp"%>
</html>