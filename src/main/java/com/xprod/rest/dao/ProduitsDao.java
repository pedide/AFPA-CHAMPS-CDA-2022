package com.xprod.rest.dao;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.Produits;
import com.xprod.rest.repository.IProduitsRepository;

@Service
public class ProduitsDao {

	@Autowired
	IProduitsRepository produitsRepository;
	
	//Liste des produits
	public List<Produits> getProduits(){
		
		return produitsRepository.findAll();
	}
	
	//Enregistrer un produit
	public Produits saveProduits(Produits produit) {
		return produitsRepository.save(produit);
	}
	
	//chercher un produit
	public Produits getProduitById(Long idProd) {
		return produitsRepository.findById(idProd).get();
	}
	
	//Supprimer un produit
	public void deleteProduit(Produits produit) {
		produitsRepository.delete(produit);
	}
	
	public Produits updateProduit(@Valid Produits produit) {
		return produitsRepository.saveAndFlush(produit);
	}

}
