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

import com.xprod.rest.entity.Order;
import com.xprod.rest.service.impl.OrderProduitServiceImpl;

@RestController
@RequestMapping
@CrossOrigin("*") 
public class OrderProduitController {
	@Autowired
	OrderProduitServiceImpl orderProduitServiceImpl;
	
	@PostMapping("/order")
	public Order createOrder(@Validated @RequestBody(required=false)Order order) {
		return orderProduitServiceImpl.saveOrderProduit(order);
	}

	@GetMapping("/order")
	public List<Order> getAllOrder(@Validated @RequestBody(required=false)Order order) {
		return orderProduitServiceImpl.getOrderProduit();
	}
	
	@PutMapping("/order")
	public Order updateOrder(@Validated @RequestBody(required=false)Order order) {
		return orderProduitServiceImpl.updateOrderProduit(order);
	}
	
	@GetMapping("/order/{idOrder}")
	public ResponseEntity  findOrderProduitById(@PathVariable(name="idOrder")Long idOrder) {
		if(idOrder==null) {
			return ResponseEntity.badRequest().body("Cannot retrieve Order with null Id!");
		}
		Order order = orderProduitServiceImpl.getOrderProduitById(idOrder);
		if(idOrder==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(order);
	}
	
	@DeleteMapping("/order/{id}")
	public ResponseEntity deleteOrder( @PathVariable(name="id")Long idOrder) {
		Order order = orderProduitServiceImpl.getOrderProduitById(idOrder);
		if(idOrder==null) {
			return ResponseEntity.notFound().build();
		}
		orderProduitServiceImpl.deleteOrderProduit(order);
		return ResponseEntity.ok().body(order);
	}
}
