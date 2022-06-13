<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <footer>
      <h2 id="contact">Contactez-nous</h2>
      <div class=footertibo>
      <form class="x" action="messageAction.jsp" method="post">
        <input placeholder="Nom">
        <input placeholder="Email">
        <textarea placeholder="Votre message ici"></textarea>
         </form>
        <%--  <% 
        
         try () {
         out.println(
								"<h3 style='color:crimon ; text-align:center'><a href='cart.jsp'>Ajout d'un nouveau produit</a></h3>");
					}%> --%>
        <input type="button" value="Envoyez" onclick="self.location.href='home.jsp'">
       
      </div>
      <div id="deuxiemeTrait"></div>
      <div id="copyrightEtIcons">
        <div id="copyright">
          <span>© BigBears 2022</span>
        </div>
        <div id="icons">
          <a href="http://www.twitter.fr"><i class="fa fa-twitter"></i></a>
          <a href="http://www.facebook.fr"><i class="fa fa-facebook"></i></a>
          <a href="http://www.instagram.com"><i class="fa fa-instagram"></i></a>

        </div>
      </div>

    </footer>
</body>
</html>