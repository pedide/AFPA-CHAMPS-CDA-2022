<%@page import="com.gaiaconsulting.connection.DbCon" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.List"%>
<%@page import="com.gaiaconsulting.model.Cart"%>
<%@page import="java.text.DecimalFormat"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.dao.ProductsDao"%>
<%@page import="com.gaiaconsulting.model.User"%>
<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute ("dcf",dcf);
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	//response.sendRedirect("index.jsp");
	request.setAttribute("auth", auth);
	String email = request.getParameter("email"); //je récupère l'email de user
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {

	ProductsDao pDao = new ProductsDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);

}
%>

</head>
<body>

<!-- Navbar -->
<%@include file="includes/navbar.jsp"%>


<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  

  <!-- The Band Section -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
   <div style="text-align:center">
        <a href="Home2.jsp"><img id="logo" src="images/logo_noir.png"/></a></div><br>
    <h2 class="w3-wide">Gaia Consulting</h2>
    
    <p class="w3-opacity"><i>À vos côtés</i></p>
    <p class="w3-justify">Fort de plus de 10 ans de missions au cœur des entreprises, et des collectivités, Gaia-Consulting vous assure la confidentialité et l’efficacité dont vous avez besoin pour piloter la gestion de vos risques professionnels. Notre équipe de spécialistes en hygiène et sécurité des conditions de travail vous accompagnera du diagnostic à la mise en place de solutions qui vous conviennent.</p>
    <div class="w3-row w3-padding-32">
      <div class="w3-third">
        <p>Site internet et langages de programmation</p>
        <img src="images/devweb.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:60%">
      </div>
      <div class="w3-third">
        <p>Windows 10 & Pack Office</p>
        <img src="images/bureautique.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:60%">
      </div>
      <div class="w3-third">
        <p>Stockage</p>
        <img src="images/ssd.jpg" class="w3-round" alt="Random Name" style="width:60%">
      </div>
    </div>
  </div>

  <!-- Les dates des prochaines formations -->
  <div class="w3-black" id="tour">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h2 class="w3-wide w3-center">Dates des prochaines formations</h2>
      <p class="w3-opacity w3-center"><i>Inscrivez-vous dès maintenant !</i></p><br>

      <ul class="w3-ul w3-border w3-white w3-text-grey">
        <li class="w3-padding">Mai <span class="w3-tag w3-red w3-margin-left">Complet</span></li>
        <li class="w3-padding">Juin <span class="w3-tag w3-red w3-margin-left">Complet</span></li>
        <li class="w3-padding">Juillet <span class="w3-badge w3-right w3-margin-right">places disponibles</span></li>
      </ul>

      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <img src="images/devweb.jpg" alt="New York" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>Site internet et langages de programmation</b></p>
            <p class="w3-opacity">Jeudi 5 Mai 2022</p>
            <p>Vous souhaitez optimiser la création de votre site internet ? Ce parcours de formation, composé d’un tronc commun de 3 modules et d’un module personnalisé est fait pour vous !</p>
            <button class="w3-button w3-black w3-margin-bottom"  onclick="document.getElementById('ticketModal').style.display='block'">S'inscrire</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="images/office_win.jpg" alt="Paris" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>Windows 10 & Pack Office</b></p>
            <p class="w3-opacity">Lundi 16 Mai 2022</p>
            <p>Vous souhaitez savoir utiliser les outils et logiciels de Microsoft office pour travailler efficacement ? Ce parcours de formation, composé d’un tronc commun de 5 modules et d’un module personnalisé est fait pour vous !</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'" >S'inscrire</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="images/devweb.jpg" alt="Stockage" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>Développement web – Certification ICDL®</b></p>
            <p class="w3-opacity">Mardi 17 Mai 2022</p>
            <p>Développer son site internet avec Wordpress et utiliser différents langages de programmation.</p>
            <button class="w3-button w3-black w3-margin-bottom"  onclick="document.getElementById('ticketModal').style.display='block'" >S'inscrire</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Ticket Modal -->
  <div id="ticketModal" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('ticketModal').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">×</span>
        <h2 class="w3-wide"><i class="fa fa-suitcase w3-margin-right"></i>Formations</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-shopping-cart"></i>Veuillez indiquer le nombre de participant</label></p>
     
        <input class="w3-input w3-border" type="text" placeholder="Combien?">
        <p><label><i class="fa fa-user"></i> Entrez votre adresse Email</label></p>
        <input class="w3-input w3-border" type="text" placeholder="Entrer votre email">
        <button class="w3-button w3-block w3-teal w3-padding-16 w3-section w3-right"  >PAY <i class="fa fa-check"></i></button>
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('ticketModal').style.display='none'">Fermer <i class="fa fa-remove"></i></button>
        <p class="w3-right">Besoin <a href="messageUs2" class="w3-text-blue">d'aide?</a></p>
      </div>
    </div>
  </div>

  <!-- The Contact Section -->
  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h2 class="w3-wide w3-center">CONTACT</h2>
    <p class="w3-opacity w3-center"><i>A la recherche d'une formation ?</i></p>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i>101 Rue de Paris, 77200 TORCY,France<br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: + 33 (0)1 60 17 05 29<br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: contact@gaia-consulting.com<br>
         <p class="w3-medium"> <a href="https://www.gaia-consulting.fr/" target="_blank">https://www.gaia-consulting.fr</a></p>
       
       
        
      </div>
      <div class="w3-col m6">
        <form action="messageUs2.jsp" target="_blank">
          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
            </div>
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Email" required name="Email">
            </div>
          </div>
          <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message">
          <button class="w3-button w3-black w3-section w3-right" type="submit" >SEND</button>
        </form>
      </div>
    </div>
  </div>
  
<!-- End Page Content -->
</div>

<!-- Image of location/map -->
<img src="/w3images/map.jpg" class="w3-image w3-greyscale-min" style="width:100%">

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
</footer>

<script>
// Automatic Slideshow - change image every 4 seconds


// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('ticketModal');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>
