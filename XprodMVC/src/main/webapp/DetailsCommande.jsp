<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.xprodmvc.connection.DBCon"%>
   <%@page import="java.sql.Connection"%>
     <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="includes/navbar.jsp"%>


<%
try{
String id = request.getParameter("id");
if(id !=null) {
	
	 Connection con = DBCon.getConnection();
	
	Statement st = con.createStatement();
 ResultSet rs2 = st.executeQuery("select * from orderitem inner join products on orderitem.idProduct=products.id where idOrder='"+id+"'");
       

	   while(rs2.next()){

%>

                   
 <div class="col-md-8">
                        <div class="card border-0 ">
                            <div class="card-header card-2">
                                <p class="card-text text-muted mt-md-4  mb-2 space">Datails de Commande <span class=" small text-muted ml-2 cursor-pointer">N°<%=rs2.getInt(2)%></span> </p>
                                <hr class="my-2">
                            </div>
                            <div class="card-body pt-0">
                                <div class="row  justify-content-between">
                                    <div class="col-auto col-md-7">
                                        <div class="media flex-column flex-sm-row">
                                        <img class="card-img-top " src="product-image/<%=rs2.getString(10)%>" alt="Card image cap" width="5" height="150">
                                           
                                            <div class="media-body  my-auto">
                                                <div class="row ">
                                                    <div class="col-auto"><p class="mb-0"><b><%=rs2.getString(6)%></b></p><small class="text-muted"><%=rs2.getString(8)%></small></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> <p class="boxed-1"><%=rs2.getInt(4)%></p></div>
                                    <div class=" pl-0 flex-sm-col col-auto  my-auto "><p><b><%=rs2.getDouble(9)%> €</b></p></div>
                                </div>
                 
                            </div>
                        </div>
                    </div>
<%}}}catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} 
 %>
<%@include file="includes/footer.jsp"%>
</body>
</html>