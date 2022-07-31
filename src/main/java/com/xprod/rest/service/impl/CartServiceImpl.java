package com.xprod.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.Cart;
import com.xprod.rest.repository.ICartRepository;

@Service
public class CartServiceImpl {
	@Autowired
	ICartRepository cartRepository;
	//récupérer un produit
	public Cart getCartById(Long id) {
		return cartRepository.findById(id).get();
	}
	
	//Listes des produits fabriqués
	public List<Cart> getAllCart(){
		return cartRepository.findAll();
	}
	
	//Save
	public Cart saveCart(Cart cart) {
		return cartRepository.save(cart);
	}
	
	public Cart updateCart(Cart cart) {
		return cartRepository.saveAndFlush(cart);
	}
	
	//delete
	public void deleteCart(Cart cart) {
		cartRepository.delete(cart);
		
	}
}
