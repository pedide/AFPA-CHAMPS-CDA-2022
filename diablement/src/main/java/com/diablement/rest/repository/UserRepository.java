package com.diablement.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.diablement.rest.entity.User;

public interface UserRepository extends JpaRepository<User,Long>{
	//signature des méthodes
	User findUserByUsername(String username);
	
	User findUserByEmail(String email);
}
