package com.diablement.rest.constant;

public class SecurityConstant {
	
	public static final long EXPIRATION_TIME = 432_000_000; //5jours exprimés en mili seconds
	public static final String TOKEN_PREFIX = "Bearer ";//notre token doit commencer par bearer. pas de vérification
	public static final String JWT_TOKEN_HEADER = "Jwt-Token";
	public static final String TOKEN_CANNOT_BE_VERIFIED = "Token cannot be verified";
	public static final String GET_ARRAYS_LLC = "Get Arrays, XPROD";//xprod est le nom de companie
	public static final String GET_ARRAYS_ADMINISTRATION = "User Management Portal";
	public static final String AUTHORITIES = "authorities";
	public static final String FORBIDDEN_MESSAGE = "Yous need to login to access this page";
	public static final String ACCESS_DENIED_MESSAGE = "Yous do not have the permission to access this page";
	public static final String OPTIONS_HTTP_METHOD = "OPTIONS";
	//public static final String[] PUBLIC_URLS = {"/user/login", "/user/register", "/user/resetpassword/**", "/user/image/**"};//on ne veut pas que ces elements soient bloqués
	public static final String[] PUBLIC_URLS = {"**"};

	
}
