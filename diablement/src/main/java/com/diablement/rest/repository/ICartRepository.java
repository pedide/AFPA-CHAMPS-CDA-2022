package com.diablement.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.diablement.rest.entity.Cart;


public interface ICartRepository extends JpaRepository<Cart,Long>{

}
