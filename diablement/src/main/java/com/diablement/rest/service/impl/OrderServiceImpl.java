package com.diablement.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.Order;
import com.diablement.rest.repository.IOrderRepository;

@Service
public class OrderServiceImpl {
	@Autowired
	private IOrderRepository orderRepository;
	
	
	//recupere 1 cmde en fonction de son id
		public Order getOrderById(Long idOrder) {
			return orderRepository.findById(idOrder).get();
			
		}
		
		//liste des order
		public List<Order> getAllOrder(){
			return orderRepository.findAll();
			
		}
		
		//save
		public Order saveOrder(Order order) {
			return orderRepository.save(order);
			
		}
		
		//update
		public Order updateOrder(@Valid Order order) { 
			return orderRepository.saveAndFlush(order);
		}
		 
		
		//delete
		public void deleteOrder(Order order) {
			orderRepository.delete(order);
		}
}
