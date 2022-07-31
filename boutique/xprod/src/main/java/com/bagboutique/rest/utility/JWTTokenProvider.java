package com.bagboutique.rest.utility;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;

import static java.util.Arrays.stream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import static com.auth0.jwt.algorithms.Algorithm.HMAC512;
import static com.bagboutique.rest.constant.SecurityConstant.*;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.JWTVerifier;
import com.bagboutique.rest.entity.UserPrincipal;

@Component
public class JWTTokenProvider {
	
	@Value("${jwt.secret}")//comes from aplication.properties 
	private String secret;
	//creer un token
	public String generateJwtToken(UserPrincipal userPrincipal) {
		
		String[] claims=getClaimsFromUser( userPrincipal);
		
		return JWT.create().withIssuer(GET_ARRAYS_LLC).withAudience(GET_ARRAYS_ADMINISTRATION)
				.withIssuedAt(new Date()).withSubject(userPrincipal.getUsername())
				.withArrayClaim(AUTHORITIES,claims).withExpiresAt(new Date(System.currentTimeMillis()+EXPIRATION_TIME))
				.sign(HMAC512(secret.getBytes()));
	}//HMAC512 cripte le mot de passe et  donne un token 
	//je cré une methode//::methode qui fait fait reference a java8  espace mémoire
	public List<GrantedAuthority> getAuthorities(String token){
	String[] claims = getClaimsFromToken (token);
	
	return stream (claims).map(SimpleGrantedAuthority::new).collect(Collectors.toList());
	}
	//reclamer un token
	private String[] getClaimsFromToken (String token) {
		JWTVerifier verifier = getJWTVerifier();
		return verifier.verify(token).getClaim(AUTHORITIES).asArray(String.class);
		
	}
	
	private JWTVerifier getJWTVerifier() {
		JWTVerifier verifier;
		try {
			Algorithm algorithm = HMAC512(secret);
			verifier = JWT.require(algorithm).withIssuer(GET_ARRAYS_LLC).build();
			
		
	}catch(JWTVerificationException exeption) {
		throw new JWTVerificationException(TOKEN_CANNOT_BE_VERIFIED) ;
		
	}
		return verifier;
	}
	private String [] getClaimsFromUser(UserPrincipal user) {
		List<String>authorities = new ArrayList<>();
		for(GrantedAuthority grantedAuthority:user.getAuthorities()) {
		authorities.add(grantedAuthority.getAuthority());
		
		}
		
		return authorities.toArray(new String[0]);//je met 0 parceque je cré un tableau d'une seul ligne qui contient les authorisation 
	}
	
	public Authentication getAuthentication(String username, List<GrantedAuthority> authorities,HttpServletRequest request) {

		UsernamePasswordAuthenticationToken userPasswordAuthToken = new
				UsernamePasswordAuthenticationToken (username,null,authorities);
		userPasswordAuthToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));	
		
		//is empty = c'est vide
		return userPasswordAuthToken;
}
	public boolean isTokenValid(String username, String token ) {
		JWTVerifier  verifier= getJWTVerifier();
		return StringUtils.isNotEmpty(username)&& !isTokenExpired(verifier,token);
			
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
