package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.Orderp;
import com.bagboutique.rest.repository.IOrderpRepository;

@Service
public class OrderpServiceImpl {
	
@Autowired  //j'injecte les données dans ma base de donnée
	
	IOrderpRepository iOrderpRepository;
	
	
	
	   public Orderp getOrderpById(Long idOrderp) {
	        return iOrderpRepository.findById(idOrderp).get();
	    }

	    public List<Orderp> getAllOrderp(){
	        return iOrderpRepository.findAll();
	    }
	    
	    
	    public Orderp saveOrderp(Orderp orderp) {
	        return iOrderpRepository.save(orderp);
	    }
	    
	    
	    public Orderp updateOrderp(@Valid Orderp orderp) {
	        return iOrderpRepository.saveAndFlush(orderp);
	    }
	    
		public void deleteOrderp(Orderp orderp) {
			iOrderpRepository.delete(orderp);
			
		}

		
		public void remove (Long id) {}

		public List<Orderp> getOrderp() {
			
			return null;
		}


}



