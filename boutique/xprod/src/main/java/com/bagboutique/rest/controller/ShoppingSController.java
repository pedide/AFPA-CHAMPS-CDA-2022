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

import com.bagboutique.rest.entity.ShoppingS;
import com.bagboutique.rest.service.impl.ShoppingSServiceImpl;


@RestController
@RequestMapping
@CrossOrigin("*")//autoriser les url provennant de mon server
public class ShoppingSController {
	
	



		@Autowired//injection de dependences
		ShoppingSServiceImpl shoppingSServiceImpl;
		
		
		@GetMapping("/shoppingS")//va nous donner le chemain pour aller chercher nos produits 
		public List<ShoppingS> getAllOrders(@Validated @RequestBody(required=false) ShoppingS shoppingS){
			return shoppingSServiceImpl.getShoppingS();

	}
	@PostMapping("/shoppingS")
	public ShoppingS CreateOrders(@Validated @RequestBody(required=false) ShoppingS shoppingS) {
		return shoppingSServiceImpl.saveShoppingS(shoppingS);
		
		
	}
	
		

	@PutMapping ("/shoppingS")
	public ShoppingS updateShoppingS(@Validated @RequestBody(required=false)ShoppingS shoppingS) {
		return	shoppingSServiceImpl.saveShoppingS(shoppingS);
	}
	
	
	
	@GetMapping ("/shoppingS/{idShopping}")
	public ResponseEntity findShoppingS( @PathVariable(name="idOrders")Long idShopping) {
		
		if(idShopping==null) {
			return ResponseEntity.badRequest().body("cannot retrieve Shopping with null id!");
		}
		ShoppingS shoppingS = shoppingSServiceImpl.getShoppingSById(idShopping);
			if(shoppingS==null) {
				return ResponseEntity.notFound().build();
			}
			return ResponseEntity.ok().body(shoppingS);
		}
	
		
		
	
	@DeleteMapping ("/shoppingS/{id}")
	public ResponseEntity deleteShoppingS( @PathVariable(name="id")Long idShoppingS) {
		
		ShoppingS shoppingS = shoppingSServiceImpl.getShoppingSById(idShoppingS);
			if(shoppingS==null) {
				return ResponseEntity.notFound().build();
			}
			shoppingSServiceImpl.deleteShoppingS(shoppingS );
			
			return ResponseEntity.ok().body(shoppingS);
		}
	
		
	}





