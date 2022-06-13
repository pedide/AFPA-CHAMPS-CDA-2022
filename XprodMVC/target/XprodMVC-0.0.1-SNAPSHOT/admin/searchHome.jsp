<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.xprodmvc.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.xprodmvc.connection.DBCon"%>
<%@page import="com.xprodmvc.model.*"%>
<%@page import="com.xprodmvc.model.Cart"%>
<%@page import="com.xprodmvc.dao.ProductDao"%>
<%@page import="java.util.*" %>
<%@page import="com.xprodmvc.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DecimalFormat dcf=new DecimalFormat("#.##");
    request.setAttribute("dcf",dcf);

    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    
    if (auth != null) {
    	request.setAttribute("person", auth);
    	   OrderDao orderDao = new OrderDao(DBCon.getConnection());
    	    orders = orderDao.userOrders(auth.getId());
    	    
    	    
    	    }else{
    	    	response.sendRedirect("login.jsp"); 
    	    }
    	    ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
    	    /* List<Cart> cartProduct = null; */
    	    
    	    if(cart_list !=null){

    	    	request.setAttribute("cart_list", cart_list);
    	    
    	    
    	    }
    	 
    %>
    
    
    <%
//User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ProductDao pd = new ProductDao(DBCon.getConnection());
List<Product> products = pd.getAllProducts();

//ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if(cart_list !=null){

	request.setAttribute("cart_list", cart_list);
}
if(cart_list !=null){
	ProductDao pDao= new ProductDao(DBCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	
   double total = pDao.getTotalCartPrice(cart_list);
   request.setAttribute("total",total);
  
  
	request.setAttribute("cart_list", cart_list);
}%>
<html>
<head>
<meta charset="UTF-8">

<title>ACCUEIL</title>
<%@include file="/admin/adminHeader.jsp"%>
</head>
<body>


		
		<div style="color:black; text-align:center; font-size:30px;">Rechercher<i class="fa fa-home" ></i></div>
		 <div class="card-header my-3">Liste des produits</div> 
		 	<div class="contenair">
		
		<div class="row">
			<%
		int z=0;
		try{
			String search=request.getParameter("search");
			String query="select * from products where reference like'"+search+"%' or descriptif like '"+search+"%' and active='Yes' ";
			
			Connection con = DBCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()){ //tant qu'il y a des element dans ma liste
				z=1 ; //z pass a 1   z fonctionne com un boolean
				
		
		
		%>
		
	 
			<div class="col-md-3">
				<div class="card w-80" style="width: 15rem;">
					<div class=contenairIMG style="width: 100px, height:100px">
						<img class="card-img-top" src="../product-image/<%=rs.getString(6)%>" alt="Card image cap">
						<%--<img src="product-image/<%=p.getImage()%>" /> --%>
						<div class="card-body">
							<h5 class="card-title"><%=rs.getString(2)%></h5>
							<h5 class="card-title"><%=rs.getString(4)%></h5>
							<h6 class="Prix"><%=rs.getString(5)%></h6>
							<!-- <h6 class="Categorie">Categorie: categorie 1...</h6> -->
							<div =class="mt-3 d-flex justify-content-between"></div>
							<a href="../delete?id=<%=rs.getInt(1)%>" class="btn btn-sm btn-danger"><i class='fas fa-trash style='color: red'></i>Delete</a> 
						<a href="editProduct.jsp?quantite=1&id=<%=rs.getInt(1)%>" class="btn btn-primary"><i class="fas fa-pen-fancy"></i>Modifier</a>
					
								
						</div>
					</div>
				</div>
			
	</div>

<%} }catch (Exception e) {
		System.out.println(e);}
		%>
		
 </div>
 <%
 if (z==0) {%>
 <h1 style="color:black;text-align:center;">Rien à montrer</h1>
	 
 <% }
 %>
 
	</div>

</body>
<%@include file="../includes/footer.jsp"%>
</html>