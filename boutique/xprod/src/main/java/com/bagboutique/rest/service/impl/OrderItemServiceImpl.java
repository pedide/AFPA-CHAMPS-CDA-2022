package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.CartItem;
import com.bagboutique.rest.entity.OrderItem;
import com.bagboutique.rest.repository.IOrderItemRepository;

@Service
public class OrderItemServiceImpl {

	
	@Autowired  //j'injecte les données dans ma base de donnée
	
	IOrderItemRepository iOrderItemRepository;
	
	
	
	   public OrderItem getOrderItemById(Long idOrderItem) {
	        return iOrderItemRepository.findById(idOrderItem).get();
	    }

	    public List<OrderItem> getAllOrderItem(){
	        return iOrderItemRepository.findAll();
	    }
	    
	    
	    public OrderItem saveOrderItem(OrderItem orderItem) {
	        return iOrderItemRepository.save(orderItem);
	    }
	    
	    
	    public OrderItem updateOrderItem(@Valid OrderItem orderItem) {
	        return iOrderItemRepository.saveAndFlush(orderItem);
	    }
	    
		public void deleteOrderItem(OrderItem orderItem) {
			iOrderItemRepository.delete(orderItem);
			
		}

		
		public void remove (Long id) {}

		public List<OrderItem> getOrderItem() {
		
			return null;
		}


}





