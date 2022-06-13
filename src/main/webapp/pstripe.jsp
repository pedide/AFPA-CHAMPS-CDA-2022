<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="pay-stripe" method="post">  
<script src="https://checkout.stripe.com/checkout.js"
		class="mx-3 stripe-button"
		data-key="pk_test_51KsMbGJzzGmAJd7y1hPk0JTNID4ngJhCNcGEhGA06HvBxyTv8wpQUYCCNGepINL9nYN5GgCCYaTwTJ7wX2sLAI4t00iH2bGx7X"
		data-name="Gaiaconsulting E-shopping"
		data-description="Checkout with Gaiaconsulting payement" 
		data-image="images/gaia-formation-couleur-blanc.jpg"
		data-amount="${(total>0)?dcf.format(total):0}"
		data-local="auto"
		data-currency="eur"
		 return_url: 'https://example.com',
		data-billing-adress="true"
		data-label="Checkout & Pay"
		></script>
</form>
</body>
</html>