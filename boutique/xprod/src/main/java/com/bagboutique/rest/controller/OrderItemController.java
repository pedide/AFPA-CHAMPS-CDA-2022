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

import com.bagboutique.rest.entity.OrderItem;
import com.bagboutique.rest.entity.Orders;
import com.bagboutique.rest.service.impl.OrderItemServiceImpl;

@RestController
@RequestMapping
@CrossOrigin("*")//autoriser les url provennant de mon server

public class OrderItemController {
	



		@Autowired//injection de dependences
		OrderItemServiceImpl orderItemServiceImpl;
		
		
		@GetMapping("/orderItem")//va nous donner le chemain pour aller chercher nos produits 
		public List<OrderItem> getAllOrderItem(@Validated @RequestBody(required=false) OrderItem orderItem){
			return orderItemServiceImpl.getOrderItem();

	}
	@PostMapping("/orderItem")
	public OrderItem CreateOrderItem(@Validated @RequestBody(required=false) OrderItem orderItem) {
		return orderItemServiceImpl.saveOrderItem(orderItem);
		
		
	}
	
		

	@PutMapping ("/orderItem")
	public OrderItem updateOrderItem(@Validated @RequestBody(required=false)OrderItem orderItem) {
		return	orderItemServiceImpl.saveOrderItem(orderItem);
	}
	
	
	
	@GetMapping ("/orderItem/{idOrderItem}")
	public ResponseEntity findOrderItem( @PathVariable(name="idOrders")Long idOrderItem) {
		
		if(idOrderItem==null) {
			return ResponseEntity.badRequest().body("cannot retrieve OrderItem with null id!");
		}
		OrderItem orderItem = orderItemServiceImpl.getOrderItemById(idOrderItem);
			if(orderItem==null) {
				return ResponseEntity.notFound().build();
			}
			return ResponseEntity.ok().body(orderItem);
		}
	
		
		
	
	@DeleteMapping ("/orderItem/{id}")
	public ResponseEntity deleteOrderItem( @PathVariable(name="id")Long idOrderItem) {
		
		OrderItem orderItem = orderItemServiceImpl.getOrderItemById(idOrderItem);
			if(orderItem==null) {
				return ResponseEntity.notFound().build();
			}
			orderItemServiceImpl.deleteOrderItem(orderItem );
			
			return ResponseEntity.ok().body(orderItem);
		}
	
		
	}




