package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.Fournisseur;
import com.bagboutique.rest.entity.ProduitAppro;
import com.bagboutique.rest.repository.IFournisseurRepository;
import com.bagboutique.rest.repository.IProduitApproRepository;

@Service
public class FournisseurImpl {
	
	
	@Autowired  //j'injecte les données dans ma base de donnée
	
	IFournisseurRepository iFournisseurRepository;
	
	
	
	   public Fournisseur getFourById(Long idFour) {
	        return iFournisseurRepository.findById(idFour).get();
	    }

	    public List<Fournisseur> getAllFour(){
	        return iFournisseurRepository.findAll();
	    }
	    
	    
	    public Fournisseur saveFour(Fournisseur fournisseur) {
	        return iFournisseurRepository.save(fournisseur);
	    }
	    
	    
	    public Fournisseur updateFour(@Valid Fournisseur fournisseur) {
	        return iFournisseurRepository.saveAndFlush(fournisseur);
	    }
	    
		public void deleteFour(Fournisseur fournisseur) {
			iFournisseurRepository.delete(fournisseur);
			
		}

		/*
		 * public void updateFour(Fournisseur entity) {
		 * 
		 * }
		 */
		public void remove (Long id) {}
			
		
}
