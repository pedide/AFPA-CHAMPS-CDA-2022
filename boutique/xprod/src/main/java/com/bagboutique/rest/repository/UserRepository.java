package com.bagboutique.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bagboutique.rest.entity.User;

public interface UserRepository extends JpaRepository<User,Long>{
	
	User findUserByUsername(String username);
	User findUserByEmail(String email);
	

}
