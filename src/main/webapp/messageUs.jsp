<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.projetafpa.connection.DbCon"%>
<%@page import="java.sql.Connection"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Message Us</title>
<%@include file="includes/head.jsp"%>
</head>
<body>

<div style="color: white; text-align: center; font-size: 30px;">
Message Us <i class='fas fa-comment-alt'></i></div>

<h3 style="text-align: center; color: yellow;">Message
successfully sent. Our team will contact you soon!</h3>

<h3 style="text-align: center;">Some thing Went Wrong! Try Again!</h3>
	
<%
String id = request.getParameter("idMessage");
String name = request.getParameter("username");

try {
	Connection con = DbCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from messages where idMessage='"+id+"'"); 
	while(rs.next()){
	
%>
			<div class="form-group">
				<label>Nom</label> <input
					type ="text" data-selector=nom
					class="form-control" type=text name=nom
					placeholder="entrer votre nom" required>
			</div>

				<div
					class="form-item js-form-item form-type-textfield js-form-type-textfield form-item-firstname js-form-item-firstname form-group">
					<label for=edit-firstname
						class="control-label js-form-required form-required">Prénom</label>
					<input id=contact__name data-selector=edit-firstname
						class="form-text required form-control" type=text name=firstname
						value="" size=60 maxlength=128 value="<%=rs.getString(3)%>" required=required
						aria-required=true />
				</div>

					<div
						class="form-group">
						<label for=edit-mail
							class="control-label js-form-required form-required">Votre
							adresse e-mail</label> <input id=contact__mail
							data-drupal-selector=edit-mail
							class="form-email required form-control" type=email name=mail
							value="" size=60 maxlength=100 required=required
							aria-required=true />
					</div>

				
						<div
							class="form-inline form-item js-form-item form-type-tel js-form-type-tel form-item-phone js-form-item-phone form-group">
							<label for=edit-phone
								class="control-label js-form-required form-required">Numéro
								de téléphone </label> <input id=contact__number
								data-drupal-selector=edit-phone
								class="form-tel required form-control" type=tel name=phone
								value="" size=15 maxlength=10 required=required
								aria-required=true />
						</div>
						

						<span class=error-reservation_1></span> <span id=err-docnumber2
							class=error-text>Veuillez saisir un numéro de commande </span> <input
							id=contact__name data-drupal-selector=edit-firstname
							class="form-text required form-control" type=text name=firstname
							value="" size=60 maxlength=128 required=required
							aria-required=true />
					


					<div class=contact__message>
						<div class=grid>
							<div class=one>
								<div class="grid-item one">
									<div
										class="form-item js-form-item form-type-textarea js-form-type-textarea form-item-message js-form-item-message form-group">
										<label for=edit-message
											class="control-label js-form-required form-required">Votre
											Message</label>
										<div class=form-textarea-wrapper>
											<textarea data-drupal-selector=edit-message
												class="form-textarea required form-control resize-vertical"
												id=edit-message name=message rows=5 cols=60
												required=required aria-required=true></textarea>
										</div>
									
							</div>
							<div class="desk-one-two lap-one palm-one">
								<div class="grid-item desk-one-two lap-one palm-one">
									<label for=file-upload class=contact__text> Pièce(s)
										jointe(s) au message <span
										class="contact__text contact__text--radiotextsmall"> (2
											Mo maximum par envoi) </span> <span
										class="contact__text contact__text--radiotextsmall">
											(Formats acceptés : PDF, PNG, DOC, DOCX, RTF, JPG, TXT, 
											MPEG, JEPG) </span>
									</label>
								</div>
								<div class="grid-item desk-one-two lap-one palm-one">
									<div
										class="form-item js-form-item form-type-file js-form-type-file form-item-file-1 js-form-item-file-1 form-no-label form-group">
										<input data-drupal-selector=edit-file-1
											class="js-form-file form-file form-control" type=file
											id=edit-file-1 name=file_1 size=60 />
									</div>
									<span class=error-file_1></span>
									<div
										class="form-item js-form-item form-type-file js-form-type-file form-item-file-2 js-form-item-file-2 form-no-label form-group">
										<input data-drupal-selector=edit-file-2
											class="js-form-file form-file form-control" type=file
											id=edit-file-2 name=file_2 size=60 />
									</div>
									<span class=error-file_2></span>
									<div
										class="form-item js-form-item form-type-file js-form-type-file form-item-file-3 js-form-item-file-3 form-no-label form-group">
										<input data-drupal-selector=edit-file-3
											class="js-form-file form-file form-control" type=file
											id=edit-file-3 name=file_3 size=60 />
									</div>
									<span class=error-file_3></span>
								</div>
							</div>
						</div>
					</div>
					<form action="message-us" method="post">
					<div class="grid-item one text-center contact__submit-btn">
						<button id=contact_submit data-drupal-selector=edit-submit
							class="button js-form-submit form-submit btn-default btn"
							type=submit name=op value=Envoyez>Envoyez</button>
					</div>
					</form>
				</div>
			</div>
			
<% }	
		}catch(Exception e){
			System.out.println(e);
		}
%>

<%@include file="includes/footer.jsp"%>	
			
</body>
</html>