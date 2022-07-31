package com.bagboutique.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.ProduitFab;
import com.bagboutique.rest.repository.IProduitFabRepository;

@Service
public class ProduitFabServiceImpl {
	
	@Autowired  //j'injecte les données dans ma base de donnée
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


	public void deleteProduitFab(ProduitFab produitFab) {
		produitFabRepository.delete(produitFab);
		
	}

}
