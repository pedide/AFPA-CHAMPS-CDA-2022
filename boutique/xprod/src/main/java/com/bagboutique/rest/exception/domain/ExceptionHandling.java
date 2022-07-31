package com.bagboutique.rest.exception.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import static org.springframework.http.HttpStatus.*;

import java.io.IOException;
import java.util.Objects;

import org.springframework.boot.web.servlet.error.*;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.security.access.AccessDeniedException;





import javax.persistence.NoResultException;

import com.auth0.jwt.exceptions.TokenExpiredException;
import com.bagboutique.rest.entity.HttpResponse;

@RestControllerAdvice
public class ExceptionHandling implements ErrorController {
	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
    private static final String ACCOUNT_LOCKED = "Your account has been locked. Please contact administration";
    private static final String METHOD_IS_NOT_ALLOWED = "This request method is not allowed on this endpoint. Please send a '%s' request ";//appeler toute les method supported
    private static final String INTERNAL_SERVER_ERROR_MSG = "An error occured while processing the request";
    private static final String INCORRECT_CREDENTIALS = "Username/ password incorect.Please try again";
    private static final String ACCOUNT_DISABLED = "Your account has been disabled. If this is an error,please contact ";
    private static final String ERROR_PROCESSING_FILE = "Error occurred while processing file";
    private static final String NOT_ENOUGH_PERMISSION = "You do not have enough permission";
    public static final String ERROR_PATH = "/error";
    
    
    @ExceptionHandler(DisabledException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse>  accountDisableException() {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
    return createHttpResponse(BAD_REQUEST,ACCOUNT_DISABLED);
    }
    
    
    @ExceptionHandler(BadCredentialsException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse> badCredentialsException() {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
    return createHttpResponse(BAD_REQUEST,INCORRECT_CREDENTIALS);
    }
    
    
    @ExceptionHandler(AccessDeniedException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse>  accessDeniedException() {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
    return createHttpResponse(FORBIDDEN,NOT_ENOUGH_PERMISSION);
    }
    
    
    @ExceptionHandler(LockedException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse>  LockedException() {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
    return createHttpResponse(UNAUTHORIZED,ACCOUNT_DISABLED);
    }
    
    @ExceptionHandler(TokenExpiredException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse>  TokenExpiredException(TokenExpiredException exception) {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
    return createHttpResponse(HttpStatus.UNAUTHORIZED,exception.getMessage().toUpperCase());
    }
    
    @ExceptionHandler(EmailExisteException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse>  emailExisteException(EmailExisteException  exception) {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
    return createHttpResponse(BAD_REQUEST,exception.getMessage());
    }
    
    
    @ExceptionHandler(UsernameExistException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse>  usernameExistException(UsernameExistException exception) {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
    return createHttpResponse(BAD_REQUEST,exception.getMessage());
    }
    
    
    @ExceptionHandler(EmailNotFoundException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse>  emailNotFoundException(EmailNotFoundException exception) {
    return createHttpResponse(BAD_REQUEST,exception.getMessage());
    }
    
    
    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<HttpResponse>  userNotFoundException(UserNotFoundException exception) {
    return createHttpResponse(BAD_REQUEST,exception.getMessage());
    }
    
    
    @ExceptionHandler(NoHandlerFoundException.class)
    public ResponseEntity<HttpResponse>  methodNotSupportedException(NoHandlerFoundException exception) {
   
   
    	return createHttpResponse(BAD_REQUEST,"This page not found");
    }
    
    @ExceptionHandler(Exception.class)
    public ResponseEntity<HttpResponse>  internalServerErrorException(Exception exception) {
   LOGGER.error(exception.getMessage());
   
    	return createHttpResponse(HttpStatus.INTERNAL_SERVER_ERROR,INTERNAL_SERVER_ERROR_MSG);
    }
    
    
    @ExceptionHandler(NoResultException.class)
    public ResponseEntity<HttpResponse> notFoundException(NoResultException exception) {
   
    	 LOGGER.error(exception.getMessage());
    	return createHttpResponse(HttpStatus.NOT_FOUND,exception.getMessage());
    }
    
    private ResponseEntity<HttpResponse> createHttpResponse(HttpStatus httpStatus, String message) {
    	return new ResponseEntity<>( new HttpResponse(
    		httpStatus.value(),
    		httpStatus,
    		httpStatus.getReasonPhrase().toUpperCase(),
    		message.toUpperCase()),httpStatus
    
    		
    		);
	
    	
    }
    
    @ExceptionHandler(IOException.class)//notation pour faire apel a mon accountDisableException
    public ResponseEntity<HttpResponse> iOException(IOException exception) {//method accountDisableException qui fait apel a une list ResponseEntity de type HttpResponse
   
    	 LOGGER.error(exception.getMessage());
    	return createHttpResponse(INTERNAL_SERVER_ERROR,ERROR_PROCESSING_FILE);
    }
    @RequestMapping(ERROR_PATH)
    public ResponseEntity <HttpResponse>notFound404(HttpStatus httpStatus,String message){
    	return createHttpResponse(NOT_FOUND,"there no is mapping for this URL");
    	
    }
    
    
    
    public String getErrorPath() {
		return ERROR_PATH;
    	
    	
    }
    
    

}
