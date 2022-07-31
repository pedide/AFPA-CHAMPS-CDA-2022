package com.bagboutique.rest.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.stereotype.Component;

import com.bagboutique.rest.service.LoginAttemptService;



@Component
public class authenticationFailurListener {
     private LoginAttemptService loginAttemptService;

     
     
     @Autowired
	public authenticationFailurListener(LoginAttemptService loginAttemptService) {
		super();
		this.loginAttemptService = loginAttemptService;
	}
     @EventListener
    public void onAuthenticationFailure(AuthenticationFailureBadCredentialsEvent event) {
    	Object principal = event.getAuthentication().getPrincipal();
    	if(principal instanceof String) {
    		String username =(String)event.getAuthentication().getPrincipal();
    		loginAttemptService.addUserToLoginAttemptCache(username);
    		
    		
    	}
    	
    	
    }
     
}
