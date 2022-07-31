package com.diablement.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.ProduitAppro;
import com.diablement.rest.entity.ProduitFab;
import com.diablement.rest.repository.IProduitFabRepository;

@Service
public class ProduitFabServiceImpl {
	
	@Autowired
	IProduitFabRepository produitFabRepository;
	
	//recuperer un produit en fonction de son id
	public ProduitFab getProduitFabById(Long idProdFab) {
		return produitFabRepository.findById(idProdFab).get();
	}
	
	//Lists des produits fabriques
	public List<ProduitFab> getAllProduitFab(){
		return produitFabRepository.findAll();
	}
	
	//save
	public ProduitFab saveProduitFab(ProduitFab produitFab) {
		return produitFabRepository.save(produitFab);
	}
	
	//update
			public ProduitFab updateProduitFab(@Valid ProduitFab produitFab) { 
				return produitFabRepository.saveAndFlush(produitFab);
			}
	//delete
	public void deleteProduitFab(ProduitFab produitFab) {
		produitFabRepository.delete(produitFab);
	}
	
	
}
