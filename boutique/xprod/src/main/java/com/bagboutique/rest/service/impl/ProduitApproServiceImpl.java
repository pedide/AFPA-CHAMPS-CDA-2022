package com.bagboutique.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.ProduitAppro;
import com.bagboutique.rest.repository.IProduitApproRepository;




@Service
public class ProduitApproServiceImpl {
	
	@Autowired  //j'injecte les données dans ma base de donnée
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


	public void deleteProduitAppro(ProduitAppro produitAppro) {
		produitApproRepository.delete(produitAppro);
		
	}

	
}
