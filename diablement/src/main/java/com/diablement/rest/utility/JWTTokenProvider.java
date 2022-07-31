package com.diablement.rest.utility;
import static java.util.Arrays.stream;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;

import static com.auth0.jwt.algorithms.Algorithm.HMAC512;
import static com.diablement.rest.constant.SecurityConstant.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.diablement.rest.entity.UserPrincipal;


@Component
public class JWTTokenProvider {
	
	@Value("${jwt.secret}")//on récupère cette var qui n'est pas ds package JWT.secret vient application.properties
	private String secret;
	
	//création du token
	public String generateJwtToken(UserPrincipal userPrincipal) {
		String[] claims = getClaimsFromUser(userPrincipal);
		return JWT.create().withIssuer(GET_ARRAYS_LLC).withAudience(GET_ARRAYS_ADMINISTRATION)
				.withIssuedAt(new Date()).withSubject(userPrincipal.getUsername())
				.withArrayClaim(AUTHORITIES, claims).withExpiresAt(new Date(System.currentTimeMillis()+EXPIRATION_TIME))
				.sign(HMAC512(secret.getBytes()));
	}

	//ns avons attribué une liste d'authorisation
	public List<GrantedAuthority> getAuthorities(String token){
		String[] claims = getClaimsFromToken(token);
		
		//:: est une mthod qui fait référence à java8
		return stream(claims).map(SimpleGrantedAuthority::new).collect(Collectors.toList());
	}
	
	//il va vérifier si c'est vraiment un token
	private String[] getClaimsFromToken(String token) {
		JWTVerifier verifier = getJWTVerifier();
		return verifier.verify(token).getClaim(AUTHORITIES).asArray(String.class);
	}

	
	private JWTVerifier getJWTVerifier() {
		JWTVerifier verifier;	
		
		try {
			Algorithm algorithm = HMAC512(secret);
			verifier = JWT.require(algorithm).withIssuer(GET_ARRAYS_LLC).build();
			
		}catch(JWTVerificationException exception) {
			throw new JWTVerificationException(TOKEN_CANNOT_BE_VERIFIED);
		}
		return verifier;
	}

	private String[] getClaimsFromUser(UserPrincipal user) {
		List<String> authorities = new ArrayList<>();
		
		//on veut ts les authorisation d'1 user
		for(GrantedAuthority grantedAuthority:user.getAuthorities()) {
			authorities.add(grantedAuthority.getAuthority());
		}
		//on récupère l'authorisation de l'utilisateur.On a crée 1 tab à 1 ligne
		return authorities.toArray(new String[0]);
	}
	
	//Get authentication quand on a vérifié le token
	public Authentication getAutentication(String username, List<GrantedAuthority> authorities, HttpServletRequest request) {
		UsernamePasswordAuthenticationToken userPasswordAuthToken = new
				UsernamePasswordAuthenticationToken(username,null,authorities);
		
		userPasswordAuthToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
		return userPasswordAuthToken;
	}
	
	public boolean isTokenValid(String username, String token) {
		JWTVerifier verifier = getJWTVerifier();
		
		return StringUtils.isNotEmpty(username) && !isTokenValid(verifier,token);
	}

	private boolean isTokenValid(JWTVerifier verifier, String token) {
		Date expiration = verifier.verify(token).getExpiresAt();
		return expiration.before(new Date());
	}
	
	public String getSubject(String token) {
		JWTVerifier verifier = getJWTVerifier();
		return verifier.verify(token).getSubject();
	}
}
