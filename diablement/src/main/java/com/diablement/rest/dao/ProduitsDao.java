package com.diablement.rest.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.Produits;
import com.diablement.rest.repository.IProduitsRepository;

@Service
public class ProduitsDao {

	@Autowired
	IProduitsRepository produitsRepository;
	
	//Liste des produits
	public List<Produits> getProduit(){
		return produitsRepository.findAll();
	}
	
	//save
	public Produits saveProduit (Produits produit) {
		return produitsRepository.save(produit);
	}
	
	//get produit
	public Produits getProduitById(Long idProd) {
		return produitsRepository.findById(idProd).get();//chercher un produit en fonction de son id
	}
	
	//supprimer un produit
	public void deleteProduit(Produits produit) {
		produitsRepository.delete(produit);
	}
}
