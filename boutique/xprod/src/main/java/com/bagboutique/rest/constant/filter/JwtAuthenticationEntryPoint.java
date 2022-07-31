package com.bagboutique.rest.constant.filter;

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

import com.bagboutique.rest.constant.SecurityConstant;
import com.bagboutique.rest.entity.HttpResponse;
import com.fasterxml.jackson.databind.ObjectMapper;


@Component
public class JwtAuthenticationEntryPoint extends Http403ForbiddenEntryPoint {

	public void commence(HttpServletRequest request, HttpServletResponse response,AuthenticationException exception)
{
		try {
		HttpResponse httpResponse = new HttpResponse(
		HttpStatus.FORBIDDEN.value(),
		HttpStatus.FORBIDDEN,
		HttpStatus.FORBIDDEN.getReasonPhrase().toUpperCase(),
		SecurityConstant.FORBIDDEN_MESSAGE
		);
		response.setContentType(APPLICATION_JSON_VALUE);
		response.setStatus(FORBIDDEN.value());
	
		OutputStream outputStream;
	
			outputStream = response.getOutputStream();

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(outputStream, httpResponse);
		outputStream.flush();
		
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();

}	
	}
}
