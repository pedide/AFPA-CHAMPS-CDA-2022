package com.diablement.rest.enumeration;

import static com.diablement.rest.constant.Authority.*;


//enum c'est comme une list
public enum Role {
	ROLE_USER(USER_AUTHORITIES),
	ROLE_HR(HR_AUTHORITIES),
	ROLE_MANAGER(MANAGER_AUTHORITIES),
	ROLE_ADMIN(ADMIN_AUTHORITIES),
	ROLE_SUPER_ADMIN(SUPER_ADMIN_AUTHORITIES);
	
	private String [] authorities;
	
	Role(String ...authorities){//les 3 points signifie authorities en une liste d'objet
		this.authorities = authorities;
	}
	
	public String [] getAuthorities() {
		return authorities;
	}

	
	
	
	
}
