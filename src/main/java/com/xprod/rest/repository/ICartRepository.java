package com.xprod.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xprod.rest.entity.Cart;

public interface ICartRepository extends JpaRepository<Cart, Long>{

}
