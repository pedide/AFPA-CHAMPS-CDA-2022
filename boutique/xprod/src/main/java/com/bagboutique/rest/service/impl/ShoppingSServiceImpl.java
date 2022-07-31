package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.OrderItem;
import com.bagboutique.rest.entity.ShoppingS;
import com.bagboutique.rest.repository.IShoppingSRepository;


@Service
public class ShoppingSServiceImpl {
	

	@Autowired  //j'injecte les données dans ma base de donnée
	
	IShoppingSRepository iShoppingSRepository;
	
	
	
	   public ShoppingS getShoppingSById(Long idShoppingS) {
	        return iShoppingSRepository.findById(idShoppingS).get();
	    }

	    public List<ShoppingS> getAllShoppingS(){
	        return iShoppingSRepository.findAll();
	    }
	    
	    
	    public ShoppingS saveShoppingS(ShoppingS shoppingS) {
	        return iShoppingSRepository.save(shoppingS);
	    }
	    
	    
	    public ShoppingS updateShoppingS(@Valid ShoppingS shoppingS) {
	        return iShoppingSRepository.saveAndFlush(shoppingS);
	    }
	    
		public void deleteShoppingS(ShoppingS shoppingS) {
			iShoppingSRepository.delete(shoppingS);
			
		}

		
		public void remove (Long id) {}

		public List<ShoppingS> getShoppingS() {
		
			return null;
		}


}
