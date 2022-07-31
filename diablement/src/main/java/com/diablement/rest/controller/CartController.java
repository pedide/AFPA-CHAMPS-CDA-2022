package com.diablement.rest.controller;

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

import com.diablement.rest.entity.Cart;
import com.diablement.rest.entity.Order;
import com.diablement.rest.service.impl.CartServiceImpl;



@RestController //génère des API rest JSON
@RequestMapping
@CrossOrigin("*")
public class CartController {

	@Autowired
	CartServiceImpl cartServiceImpl;
	
	//recuper un panier
		@GetMapping("/cart")
		public List<Cart> getAllCart(@Validated
				@RequestBody(required=false)Cart cart){
			
			return cartServiceImpl.getAllCart();
		}
		
		@PostMapping("/cart")
		public Cart createCart(@Validated 
				@RequestBody(required=false)Cart cart) {
			
			return cartServiceImpl.saveCart(cart);
		}
		
		//on recupere 1 panier en fonction de id
		@GetMapping("/cart/{idCart}")
		public ResponseEntity findCartById(@PathVariable(name="idCart") Long idCart){
			if(idCart==null) {
				return ResponseEntity.badRequest().body("On ne trouve pas de panier du client avec id null");
			}
			
			Cart cart = cartServiceImpl.getCartById(idCart);
			
			if(cart == null) {
				return ResponseEntity.notFound().build();//pas trouvé ce panier
			}
			return ResponseEntity.ok().body(cart);
		}
		
		//mettre à jour mon panier
		@PutMapping("/cart")
		public Cart updateCart(@Validated @RequestBody(required=false) Cart cart) {
			return cartServiceImpl.updateCart(cart);
		}
		
		@DeleteMapping("/cart/{id}")
		public ResponseEntity<Cart> deleteCart(@Validated @PathVariable(name="id") Long idCart){
			Cart cart = cartServiceImpl.getCartById(idCart);
			
			if(cart == null) {
				return ResponseEntity.notFound().build();
			}
			cartServiceImpl.deleteCart(cart);//on supprime le panier
			return ResponseEntity.ok().body(cart);
		}
}
