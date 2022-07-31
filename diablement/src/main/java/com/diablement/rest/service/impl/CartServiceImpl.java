package com.diablement.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.Cart;
import com.diablement.rest.repository.ICartRepository;



@Service
public class CartServiceImpl {

	@Autowired
	private ICartRepository cartRepository;
	
	//recupere 1 panier en fonction de son id
	public Cart getCartById(Long idCart) {
		return cartRepository.findById(idCart).get();
				
	}
			
	//liste des panier
	public List<Cart> getAllCart(){
		return cartRepository.findAll();
				
	}
			
	//save
	public Cart saveCart(Cart cart) {
		return cartRepository.save(cart);
				
	}
			
	//update
	public Cart updateCart(@Valid Cart cart) { 
		return cartRepository.saveAndFlush(cart);
	}
			 
			
	//delete
	public void deleteCart(Cart cart) {
		cartRepository.delete(cart);
	}
	
}
