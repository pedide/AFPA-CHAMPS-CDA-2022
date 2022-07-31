package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bagboutique.rest.entity.Orders;
import com.bagboutique.rest.repository.IOrderRepository;

@Service
public class OrdersServiceImpl {
	
	
	@Autowired  //j'injecte les données dans ma base de donnée
	
	IOrderRepository iOrderRepository;
	
	
	
	   public Orders getOrdersById(Long idOrder) {
	        return iOrderRepository.findById(idOrder).get();
	    }

	    public List<Orders> getAllOrders(){
	        return iOrderRepository.findAll();
	    }
	    
	    
	    public Orders saveOrders(Orders orders) {
	        return iOrderRepository.save(orders);
	    }
	    
	    
	    public Orders updateOrders(@Valid Orders orders) {
	        return iOrderRepository.saveAndFlush(orders);
	    }
	    
		public void deleteOrders(Orders orders) {
			iOrderRepository.delete(orders);
			
		}

		
		public void remove (Long id) {}

		public List<Orders> getOrders() {
			// TODO Auto-generated method stub
			return null;
		}


}
