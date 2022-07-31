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

import com.bagboutique.rest.entity.Orders;
import com.bagboutique.rest.service.impl.OrdersServiceImpl;

@RestController
@RequestMapping
@CrossOrigin("*")//autoriser les url provennant de mon server
public class OrdersController {

		@Autowired//injection de dependences
		OrdersServiceImpl ordersServiceImpl;
		
		
		@GetMapping("/orders")//va nous donner le chemain pour aller chercher nos produits 
		public List<Orders> getAllOrders(@Validated @RequestBody(required=false) Orders orders){
			return ordersServiceImpl.getOrders();

	}
	@PostMapping("/orders")
	public Orders CreateOrders(@Validated @RequestBody(required=false) Orders orders) {
		return ordersServiceImpl.saveOrders(orders);
		
		
	}
	
		

	@PutMapping ("/orders")
	public Orders updateOrders(@Validated @RequestBody(required=false)Orders orders) {
		return	ordersServiceImpl.saveOrders(orders);
	}
	
	
	
	@GetMapping ("/orders/{idOrders}")
	public ResponseEntity findOrders( @PathVariable(name="idOrders")Long idOrders) {
		
		if(idOrders==null) {
			return ResponseEntity.badRequest().body("cannot retrieve Orders with null id!");
		}
		Orders orders = ordersServiceImpl.getOrdersById(idOrders);
			if(orders==null) {
				return ResponseEntity.notFound().build();
			}
			return ResponseEntity.ok().body(orders);
		}
	
		
		
	
	@DeleteMapping ("/orders/{id}")
	public ResponseEntity deleteOrders( @PathVariable(name="id")Long idOrders) {
		
		Orders orders = ordersServiceImpl.getOrdersById(idOrders);
			if(orders==null) {
				return ResponseEntity.notFound().build();
			}
			ordersServiceImpl.deleteOrders(orders );
			
			return ResponseEntity.ok().body(orders);
		}
	
		
	}



