package com.bagboutique.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bagboutique.rest.entity.CartItem;

public interface ICartItemRepository extends JpaRepository <CartItem,Long>  {
	
	

}
