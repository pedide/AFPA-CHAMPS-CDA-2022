package com.xprod.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.ProduitAppro;
import com.xprod.rest.repository.IProduitApproRepository;

@Service
public class ProduitApproServiceImpl {
	@Autowired
	IProduitApproRepository produitApproRepository;
	//récupérer un produit
	public ProduitAppro getProduitApproById(Long idProdAppro) {
		return produitApproRepository.findById(idProdAppro).get();
	}
	
	//Listes des produits Approriqués
	public List<ProduitAppro> getAllProduitAppro(){
		return produitApproRepository.findAll();
	}
	
	//Save
	public ProduitAppro saveProduitAppro(ProduitAppro produitAppro) {
		return produitApproRepository.save(produitAppro);
	}
	
	public ProduitAppro updateProduitAppro(ProduitAppro produitAppro) {
		return produitApproRepository.saveAndFlush(produitAppro);
	}
	
	//delete
	public void deleteProduitAppro(ProduitAppro produitAppro) {
		produitApproRepository.delete(produitAppro);
		
	}
}