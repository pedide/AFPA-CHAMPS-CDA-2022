package com.diablement.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.Commande;
import com.diablement.rest.entity.ProduitAppro;
import com.diablement.rest.repository.IProduitApproRepository;


@Service
public class ProduitApproServiceImpl {

	@Autowired
	IProduitApproRepository produitApproRepository;
	
	//recuperer un produit en fonction de son id
	public ProduitAppro getProduitApproById(Long idProdAppro) {
		return produitApproRepository.findById(idProdAppro).get();
	}
		
	//Lists des produits fabriques
	public List<ProduitAppro> getAllProduitAppro(){
		return produitApproRepository.findAll();
	}
		
	//save
	public ProduitAppro saveProduitAppro(ProduitAppro produitAppro) {
		return produitApproRepository.save(produitAppro);
	}
	
	//update
		public ProduitAppro updateProduitAppro(@Valid ProduitAppro produitAppro) { 
			return produitApproRepository.saveAndFlush(produitAppro);
		}
	//delete
	public void deleteProduitAppro(ProduitAppro produitAppro) {
		produitApproRepository.delete(produitAppro);
	}
}
