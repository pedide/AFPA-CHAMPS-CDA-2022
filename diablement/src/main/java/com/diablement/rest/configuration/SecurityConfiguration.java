package com.diablement.rest.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.diablement.rest.constant.SecurityConstant;
import com.diablement.rest.constant.filter.JwtAccessDeniedHandler;
import com.diablement.rest.constant.filter.JwtAuthenticationEntryPoint;
import com.diablement.rest.constant.filter.JwtAuthorizationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private JwtAuthorizationFilter jwtAuthorizationFilter;
    private JwtAccessDeniedHandler jwtAccessDeniedHandler;
    private JwtAuthenticationEntryPoint  jwtAuthenticationEntryPoint;
    private UserDetailsService userDetailsService;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
   

	//constructeur
    @Autowired
    public SecurityConfiguration(JwtAuthorizationFilter jwtAuthorizationFilter,
            JwtAccessDeniedHandler jwtAccessDeniedHandler, 
            JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint,
            //@Qualifier("userDetailsService")UserDetailsService userDetailsService, 
            UserDetailsService userDetailsService,
            BCryptPasswordEncoder bCryptPasswordEncoder) {
        super();
        this.jwtAuthorizationFilter = jwtAuthorizationFilter;
        this.jwtAccessDeniedHandler = jwtAccessDeniedHandler;
        this.jwtAuthenticationEntryPoint = jwtAuthenticationEntryPoint;
        this.userDetailsService = userDetailsService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //desactif csrf et fait appel à cors qui gère les interactions entre appli 
    	http.csrf().disable().cors().and()//csrf=systeme de secutiré d'information
    	.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
    	.and().authorizeRequests().antMatchers(SecurityConstant.PUBLIC_URLS).permitAll()
    	.anyRequest().authenticated()
    	.and()
    	.exceptionHandling().accessDeniedHandler(jwtAccessDeniedHandler)
    	.authenticationEntryPoint(jwtAuthenticationEntryPoint)
    	.and()
    	.addFilterBefore(jwtAuthorizationFilter, UsernamePasswordAuthenticationFilter.class);
    }
    
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception{
    	return super.authenticationManagerBean();
    }

}



