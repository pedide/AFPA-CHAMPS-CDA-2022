package com.bagboutique.rest.controller;

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

import com.bagboutique.rest.entity.CartItem;
import com.bagboutique.rest.service.impl.CartItemServiceImpl;


@RestController
@RequestMapping
@CrossOrigin("*")//autoriser les url provennant de mon server


public class CartItemController {

			@Autowired//injection de dependences
			CartItemServiceImpl cartItemServiceImpl;
			
			
			@GetMapping("/cartItem")//va nous donner le chemain pour aller chercher nos produits 
			public List<CartItem> getAllcartItem(@Validated @RequestBody(required=false) CartItem cartItem){
				return cartItemServiceImpl.getCartItem();

		}
		@PostMapping("/cartItem")
		public CartItem CreateCartItem(@Validated @RequestBody(required=false) CartItem cartItem) {
			return cartItemServiceImpl.saveCartItem(cartItem);
			
			
		}
		
			

		@PutMapping ("/cartItem")
		public CartItem updateOrderItem(@Validated @RequestBody(required=false)CartItem cartItem) {
			return	cartItemServiceImpl.saveCartItem(cartItem);
		}
		
		
		
		@GetMapping ("/cartItem/{idcartItem}")
		public ResponseEntity findCartItem( @PathVariable(name="idOrderItem")Long idCartItem) {
			
			if(idCartItem==null) {
				return ResponseEntity.badRequest().body("cannot retrieve CartItem with null id!");
			}
			CartItem cartItem = cartItemServiceImpl.getCartItemById(idCartItem);
				if(cartItem==null) {
					return ResponseEntity.notFound().build();
				}
				return ResponseEntity.ok().body(cartItem);
			}
		
			
			
		
		@DeleteMapping ("/cartItem/{id}")
		public ResponseEntity deleteCartItem( @PathVariable(name="id")Long idCartItem) {
			
			CartItem cartItem = cartItemServiceImpl.getCartItemById(idCartItem);
				if(cartItem==null) {
					return ResponseEntity.notFound().build();
				}
				cartItemServiceImpl.deleteCartItem(cartItem );
				
				return ResponseEntity.ok().body(cartItem);
			}
		
			
		}





