<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">

    <title>BigBears</title>
<%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="css/home-style2.css">   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
  </head>
  <body>
    <%@include file="includes/navbar.jsp"%>  
     <header>

      <div id="imagePrincipale">
        <h1>BigBears</h1>
        <div id="premierTrait"></div>
        <h3>Fast-Food</h3>
      </div>

   
    </header>
    <section id="presentation">
      <div id="texteIntro">
        <h2>Un lieu unique, pour un séjour unique</h2>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quaerat ex veniam id quas optio, veritatis quae, ipsum similique ad amet aliquam delectus! Recusandae itaque doloremque quos velit perspiciatis nulla autem voluptatibus qui, eius quod maiores soluta necessitatibus consequatur eligendi, laborum ex eos ipsa aliquid tempora. Sunt non odio laudantium consequatur dolorum, quisquam earum repudiandae ducimus pariatur doloremque modi assumenda culpa, adipisci unde quo! Labore, sit cupiditate a cumque quibusdam, error voluptates quis tempore repudiandae nihil amet sint vel eius libero?</p>
      </div>
      <div id="prestations">
        <div class="imagesPrestations">
          <h4>Nous trouver</h4>
          <a href="https://www.google.com/maps/search/saint+denis+restaurant/@48.9267829,2.3306832,13z/data=!3m1!4b1"><img src="product-image/carteResto.JPG" alt="carte"></a>
        </div>
        <div class="imagesPrestations">
          <h4>Venez nous découvrir</h4>
          <a href="#"><img src="product-image/devantureResto.jpg" alt="devanture"></a>
        </div>
        <div class="imagesPrestations">
          <h4>Coté salle</h4>
          <a href="#"><img src="product-image/interieurResto.jpg" alt="InterieurResto"></a>
        </div>
        <div class="imagesPrestations">
          <h4>Coté cuisine</h4>
          <a href="#"><img src="product-image/interieurCuisine.jpg" alt="InterieurCuisine"></a>
        </div>
      </div>

    </section>
    <section id="tourisme">
      <h2>Et tant à découvrir...</h2>
      <ul>
        <li id="tacosResto"><p>Decouvrez nos nouveaux tacos!</p></li>
        <li id="pizzaResto"><p>Les pizzas à l'italienne</p></li>
        <li id="burgerResto"><p>Le burger du chef !</p></li>
        <li id="burgersResto"><p>Profitez de notre gamme variée !</p></li>
      </ul>
    </section>
  <footer>
 <%@include file="includes/footer2.jsp"%>
  </footer>
  

</body></html>