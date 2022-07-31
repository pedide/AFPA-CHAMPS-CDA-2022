package com.xprod.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.Order;
import com.xprod.rest.repository.IOrderProduitRepository;

@Service
public class OrderProduitServiceImpl {
	@Autowired
	private IOrderProduitRepository OrderProduitRepository;
	
	public Order getOrderProduitById(Long uid) {
		return OrderProduitRepository.findById(uid).get();
	}
	
	public List<Order> getOrderProduit(){
		return OrderProduitRepository.findAll();
	}
	
	public Order saveOrderProduit(Order commande) {
		return OrderProduitRepository.save(commande);
	}
	
	public Order updateOrderProduit(@Valid Order order) {
		return OrderProduitRepository.saveAndFlush(order);
	}
	
	public void deleteOrderProduit(Order order) {
		OrderProduitRepository.delete(order);
	}
}
