<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="com.xprodmvc.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductsDao pd = new ProductsDao(DbCon.getConnection());
List<Product> produits = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) { 
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Ah oui oui</title>
    <link rel="stylesheet" href="css/home-style2.css"> 
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>
      * {
        box-sizing: border-box;
      }
      body {
        font-family: Roboto, Helvetica, sans-serif;
      }
      /* Fixez le bouton sur le côté gauche de la page the button on the left side of the page */
      .open-btn {
        display: flex;
        justify-content: flex-start;
      }
      /* Stylez et fixez le bouton sur la page */
      .open-button {
        background-color: #1c87c9;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        opacity: 0.8;
        position: fixed;
      }
      /* Positionnez la forme Popup */
      .login-popup {
        position: relative;
        text-align: center;
        width: 100%;
      }
      /* Masquez la forme Popup */
      .form-popup {
        display: none;
        position: fixed;
        left: 45%;
        top: 5%;
        transform: translate(-45%, 5%);
        border: 2px solid #666;
        z-index: 9;
      }
      /* Styles pour le conteneur de la forme */
      .form-container {
        max-width: 300px;
        padding: 20px;
        background-color: #fff;
      }
      /* Largeur complète pour les champs de saisie */
      .form-container input[type="text"],
      .form-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0 22px 0;
        border: none;
        background: #eee;
      }
      /* Quand les entrées sont concentrées, faites quelque chose */
      .form-container input[type="text"]:focus,
      .form-container input[type="password"]:focus {
        background-color: #ddd;
        outline: none;
      }
      /* Stylez le bouton de connexion */
      .form-container .btn {
        background-color: #8ebf42;
        color: #fff;
        padding: 12px 20px;
        border: none;
        cursor: pointer;
        width: 100%;
        margin-bottom: 10px;
        opacity: 0.8;
      }
      /* Stylez le bouton pour annuler */
      .form-container .cancel {
        background-color: #cc0000;
      }
      /* Planez les effets pour les boutons */
      .form-container .btn:hover,
      .open-button:hover {
        opacity: 1;
      }
      
    </style>
  </head>
  <% for(Product p : produits){%>
  <body>
    <div class="open-btn">
      <button class="open-button" onclick="openForm()"><strong>Ouvrir la forme</strong></button>
    </div>
      <div class="form-popup" id="popupForm">
        <form action="/action_page.php" class="form-container">
          <h2>Etes vous sur de vouloir supprimer ce produit</h2>
          <a href="delete-product?id=<%=p.getIdProd() %>" class="btn btn-danger">Supprimer le produit<i class="fas fa-trash"></i></a>
          <button type="button" class="btn cancel" onclick="closeForm()">Fermer</button>    
        </form>
      </div>
    <script>
      function openForm() {
        document.getElementById("popupForm").style.display = "block";
      }

      function closeForm() {
        document.getElementById("popupForm").style.display = "none";
      }
    </script>
  </body>
  <% }%> 
</html>


<!-- <html>
<head>
<meta charset="UTF-8">
<title>Pop Up</title>
</head>
<body>
<a href='#' onclick='javascript:window.open("http://myurl", "_blank", "scrollbars=1,resizable=1,height=300,width=450");' title='Pop Up'>Pop Up</a>
</body>
</html> -->