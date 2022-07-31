package com.xprod.rest.constant.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import static org.springframework.http.HttpHeaders.AUTHORIZATION;
import static org.springframework.http.HttpStatus.OK;

import com.xprod.rest.utility.JWTTokenProvider;
import static com.xprod.rest.constant.SecurityConstant.*;

@Component
public class JwtAuthorizationFilter extends OncePerRequestFilter{
	
	private JWTTokenProvider jwtTokenProvider;
	
	
	public JwtAuthorizationFilter(JWTTokenProvider jwtTokenProvider) {
		super();
		this.jwtTokenProvider = jwtTokenProvider;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase(OPTIONS_HTTP_METHOD)) { //url correspond
			response.setStatus(OK.value());
		}else {
			String authorizationHeader = request.getHeader(AUTHORIZATION);
			if(authorizationHeader == null || !authorizationHeader.startsWith(TOKEN_PREFIX)) {
				filterChain.doFilter(request, response);
				return; //On stop l'exécution de la methode en renvoyant rien
			}
			String token = authorizationHeader.substring(TOKEN_PREFIX.length()); //on retire le prefix du token
			String username = jwtTokenProvider.getSubject(token);
		
				if(jwtTokenProvider.isTokenValid(username, token) && SecurityContextHolder.getContext().getAuthentication() == null) {
					List<GrantedAuthority> authorities = jwtTokenProvider.getAuthorities(token);
					Authentication authentication = jwtTokenProvider.getAuthentication(username, authorities, request);
					SecurityContextHolder.getContext().setAuthentication(authentication);
				}else {
					SecurityContextHolder.clearContext();
				}
		}
		filterChain.doFilter(request, response);
	}

}
