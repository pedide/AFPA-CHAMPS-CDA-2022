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

import com.diablement.rest.entity.Order;
import com.diablement.rest.service.impl.OrderServiceImpl;

@RestController //genere des API rest JSON
@RequestMapping
@CrossOrigin("*")
public class OrderController {

	@Autowired
	OrderServiceImpl orderServiceImpl;
	
	//recuper une cmde
	@GetMapping("/order")
	public List<Order> getAllOrder(@Validated
			@RequestBody(required=false)Order order){
		
		return orderServiceImpl.getAllOrder();
	}
	
	@PostMapping("/order")
	public Order createOrder(@Validated 
			@RequestBody(required=false)Order order) {
		
		return orderServiceImpl.saveOrder(order);
	}
	
	//on recupere 1 cmde en fonction de id
	@GetMapping("/order/{idOrder}")
	public ResponseEntity findOrderById(@PathVariable(name="idOrder") Long idOrder){
		if(idOrder==null) {
			return ResponseEntity.badRequest().body("On ne trouve pas de commande de client avec id null");
		}
		
		Order order = orderServiceImpl.getOrderById(idOrder);
		
		if(order == null) {
			return ResponseEntity.notFound().build();//pas trouvé ce cmde
		}
		return ResponseEntity.ok().body(order);
	}
	
	//mettre à jour ma cmde
	@PutMapping("/order")
	public Order updateOrder(@Validated @RequestBody(required=false) Order order) {
		return orderServiceImpl.updateOrder(order);
	}
	
	@DeleteMapping("/order/{id}")
	public ResponseEntity<Order> deleteOrder(@Validated @PathVariable(name="id") Long idOrder){
		Order order = orderServiceImpl.getOrderById(idOrder);
		
		if(order == null) {
			return ResponseEntity.notFound().build();
		}
		orderServiceImpl.deleteOrder(order);//on supprime la cmde
		return ResponseEntity.ok().body(order);
	}
	
}
