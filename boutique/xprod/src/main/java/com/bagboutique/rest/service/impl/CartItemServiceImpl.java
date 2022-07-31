package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.CartItem;
import com.bagboutique.rest.entity.Orders;
import com.bagboutique.rest.repository.ICartItemRepository;


@Service
public class CartItemServiceImpl {

	@Autowired  //j'injecte les données dans ma base de donnée
	
	ICartItemRepository iCartItemRepository;
	
	
	
	   public CartItem getCartItemById(Long idCartItem) {
	        return iCartItemRepository.findById(idCartItem).get();
	    }

	    public List<CartItem> getAllCartItem(){
	        return iCartItemRepository.findAll();
	    }
	    
	    
	    public CartItem saveCartItem(CartItem cartItem) {
	        return iCartItemRepository.save(cartItem);
	    }
	    
	    
	    public CartItem updateCartItem(@Valid CartItem cartItem) {
	        return iCartItemRepository.saveAndFlush(cartItem);
	    }
	    
		public void deleteCartItem(CartItem cartItem) {
			iCartItemRepository.delete(cartItem);
			
		}

		
		public void remove (Long id) {}

		public List<CartItem> getCartItem() {
		
			return null;
		}


}



