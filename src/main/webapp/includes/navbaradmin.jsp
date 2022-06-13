<%@page import="com.gaiaconsulting.model.User" %>

<style>



ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: rgb(255,255, 255);
    
}

li {
  float: left;
  border-right:1px solid #bbb;
    
}

li:last-child {
  border-right: none;
    
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
   
}

li a:hover:not(.active) {
  background-color: #111;
  
}

.active {
 color: white;
 vertical-align: middle;
  background-color: #0d6efd
  ;
  #logo{
   width:100px;
   float:center;
   position:absolute;
}
}


</style>
</head>
<link rel=stylesheet title="Search" href="search.css" >
<body>
<%User auth1 = (User) request.getSession().getAttribute("auth"); %>


<div class="w3-top">

  <div class="w3-bar w3-black w3-card">
  <a href="../Home2.jsp"><img id="logo" src="../images/logo_blanc.png"/></a>
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="adminHome.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
     <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Formation</a>
    <a href="../cart.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Panier<span class="badge badge-danger px-1"> ${cart_list.size()}</span></a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="Orders" >Orders <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
          <a href="../orders.jsp" class="w3-bar-item w3-button">My orders</a>
        <a href="../myOrders2.jsp" class="w3-bar-item w3-button">History</a>
      </div>
    </div>
    <a href="messageUs2.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Contact</a>
 
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">More <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">About us</a>
        <a href="#" class="w3-bar-item w3-button">FAQ</a>
       <a href="../Home2.jsp">Home<i class="fa fa-university"></i></a> <a
		href="../addNewProduct.jsp">Add New Product <i
		class="fas fa-plus-square"></i></a> <a href="AllProductEditProduct.jsp">All
		Product & Edit Product <i class="fas fa-plus-square"></i>
	</a> <a href="../log-out">Logout <i class="fas fa-share-square"> </i>
	</a>
	
      </div>
      
    </div>
    
    <%if(auth1 !=null){
						%>
						<a href="log-out" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Log out</a>
						<% }else{%>
							<a href="../login.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Sign in</a>
							<a href="../signup.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Sign up</a>
			     			<% } %>
  </div>
    
</div>

