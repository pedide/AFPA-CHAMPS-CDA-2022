package com.diablement.rest.constant.filter;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;
import org.springframework.stereotype.Component;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.HttpStatus.FORBIDDEN;

import com.diablement.rest.constant.SecurityConstant;
import com.diablement.rest.entity.HttpResponse;
import com.fasterxml.jackson.core.exc.StreamWriteException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class JwtAuthenticationEntryPoint extends Http403ForbiddenEntryPoint{
	
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception ){
		
		
		try {
			//creation de la reponse à partir du constructeur
			HttpResponse httpResponse = new HttpResponse(
					HttpStatus.FORBIDDEN.value(),
					HttpStatus.FORBIDDEN,
					HttpStatus.FORBIDDEN.getReasonPhrase().toUpperCase(),
					SecurityConstant.FORBIDDEN_MESSAGE);
			
			response.setContentType(APPLICATION_JSON_VALUE);
			response.setStatus(FORBIDDEN.value());
			
			OutputStream outputStream = response.getOutputStream();
			ObjectMapper mapper = new ObjectMapper();
			
			
			mapper.writeValue(outputStream, httpResponse);
			
			outputStream.flush();//retourne  la flux de données
			
		} catch (StreamWriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DatabindException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
