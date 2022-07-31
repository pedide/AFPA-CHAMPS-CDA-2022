package com.xprod.rest.utility;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;

import static com.xprod.rest.constant.SecurityConstant.*;
import static com.auth0.jwt.algorithms.Algorithm.HMAC512;
import static java.util.Arrays.stream;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.xprod.rest.entity.UserPrincipal;

@Component
public class JWTTokenProvider {
	
	@Value("${jwt.secret}") // viens de la page application.properties
	private String secret;
	
	public String generateJwtToken(UserPrincipal userPrincipal) { //génère le token avec ses attirbuts
		String[] claims = getClaimsFromUser(userPrincipal);
		return JWT.create().withIssuer(GET_ARRAYS_LLC).withAudience(GET_ARRAYS_ADMINISTRATION)
				.withIssuedAt(new Date()).withSubject(userPrincipal.getUsername())
				.withArrayClaim(AUTHORITIES,claims).withExpiresAt(new Date(System.currentTimeMillis()+EXPIRATION_TIME))
				.sign(HMAC512(secret.getBytes()));
	}
	public List<GrantedAuthority> getAuthorities(String token){ //demande l'autorisation token pour pouvoir passer
		String[] claims = getClaimsFromToken(token);
		return stream(claims).map(SimpleGrantedAuthority::new).collect(Collectors.toList()); // :: methode qui fait reference à Java 8 en utilisant Collections
	}
	
	private String[] getClaimsFromToken(String token) { //récupere le token
		JWTVerifier verifier = getJWTVerifier();
		return verifier.verify(token).getClaim(AUTHORITIES).asArray(String.class);
	}
	
	private JWTVerifier getJWTVerifier() { //condition de validiter du token
		JWTVerifier verifier;
		try {
			Algorithm algorithm = HMAC512(secret);
			verifier = JWT.require(algorithm).withIssuer(GET_ARRAYS_LLC).build();
		}catch(JWTVerificationException exception) {
			throw new JWTVerificationException(TOKEN_CANNOT_BE_VERIFIED);
		}
		return verifier;
	}
	private String[] getClaimsFromUser(UserPrincipal user) { //créer un tableau qui récupère toutes les autorisations
		List<String> authorities = new ArrayList<>();
		for(GrantedAuthority grantedAuthority:user.getAuthorities()) {
			authorities.add(grantedAuthority.getAuthority());
		}
		return authorities.toArray(new String[0]);
	}
	
	//Get authentification quand il vérifie le token
	public Authentication getAuthentication(String username,List<GrantedAuthority> authorities, HttpServletRequest request) {
		UsernamePasswordAuthenticationToken userPasswordAuthToken = new UsernamePasswordAuthenticationToken(username,null,authorities);
		userPasswordAuthToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
		return userPasswordAuthToken;
	}
	
	public boolean isTokenValid(String username, String token) {
		JWTVerifier verifier = getJWTVerifier();
		return StringUtils.isNotEmpty(username) && !isTokenExpired(verifier,token);
		
	}
	
	private boolean isTokenExpired(JWTVerifier verifier, String token) {
		Date expiration = verifier.verify(token).getExpiresAt();
		return expiration.before(new Date());
	}
	
	public String getSubject(String token) {
		JWTVerifier verifier = getJWTVerifier();
		return verifier.verify(token).getSubject();
	}
	
}
