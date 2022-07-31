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

import com.bagboutique.rest.entity.Orderp;
import com.bagboutique.rest.entity.Orders;
import com.bagboutique.rest.service.impl.OrderpServiceImpl;


@RestController
@RequestMapping
@CrossOrigin("*")//autoriser les url provennant de mon server

public class OrderpController {



		@Autowired//injection de dependences
		OrderpServiceImpl orderpServiceImpl;
		
		
		@GetMapping("/orderp")//va nous donner le chemain pour aller chercher nos produits 
		public List<Orderp> getAllOrderp(@Validated @RequestBody(required=false) Orderp orderp){
			return orderpServiceImpl.getAllOrderp();

	}
	@PostMapping("/orderp")
	public Orderp CreateOrderp(@Validated @RequestBody(required=false) Orderp orderp) {
		return orderpServiceImpl.saveOrderp(orderp);
		
		
	}
	
		

	@PutMapping ("/orderp")
	public Orderp updateOrderp(@Validated @RequestBody(required=false)Orderp orderp) {
		return	orderpServiceImpl.saveOrderp(orderp);
	}
	
	
	
	@GetMapping ("/orderp/{idOrderp}")
	public ResponseEntity findOrderp( @PathVariable(name="idOrderp")Long idOrderp) {
		
		if(idOrderp==null) {
			return ResponseEntity.badRequest().body("cannot retrieve Orderp with null id!");
		}
		Orderp orderp = orderpServiceImpl.getOrderpById(idOrderp);
			if(orderp==null) {
				return ResponseEntity.notFound().build();
			}
			return ResponseEntity.ok().body(orderp);
		}
	
		
		
	
	@DeleteMapping ("/orderp/{id}")
	public ResponseEntity deleteOrderp( @PathVariable(name="id")Long idOrderp) {
		
		Orderp orderp = orderpServiceImpl.getOrderpById(idOrderp);
			if(orderp==null) {
				return ResponseEntity.notFound().build();
			}
			orderpServiceImpl.deleteOrderp(orderp );
			
			return ResponseEntity.ok().body(orderp);
		}
	
		
	}





