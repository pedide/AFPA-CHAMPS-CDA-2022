package com.xprod.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xprod.rest.entity.Cart;
import com.xprod.rest.service.impl.CartServiceImpl;

@RestController
@RequestMapping
@CrossOrigin("*")
public class CartController {
	@Autowired
	CartServiceImpl cartServiceImpl;
	
	@PostMapping("/cart")
	public Cart createCart(@Validated @RequestBody(required=false)Cart cart) {
		return cartServiceImpl.saveCart(cart);
	}

	@GetMapping("/cart")
	public List<Cart> getAllCart(@Validated @RequestBody(required=false)Cart cart) {
		return cartServiceImpl.getAllCart();
	}
	
	@PutMapping("/cart")
	public Cart updateCart(@Validated @RequestBody(required=false)Cart cart) {
		return cartServiceImpl.updateCart(cart);
	}
	
	@GetMapping("/cart/{id}")
	public ResponseEntity  findCommandeById(@PathVariable(name="id")Long id) {
		if(id==null) {
			return ResponseEntity.badRequest().body("Cannot retrieve Cart with null Id!");
		}
		Cart cart = cartServiceImpl.getCartById(id);
		if(id==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(cart);
	}
	
	@DeleteMapping("/cart/{id}")
	public ResponseEntity deleteCart( @PathVariable(name="id")Long id) {
		Cart cart = cartServiceImpl.getCartById(id);
		if(id==null) {
			return ResponseEntity.notFound().build();
		}
		cartServiceImpl.deleteCart(cart);
		return ResponseEntity.ok().body(cart);
	}
}
