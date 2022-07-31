package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bagboutique.rest.entity.Commande;
import com.bagboutique.rest.entity.Fournisseur;
import com.bagboutique.rest.repository.ICommandeRepository;

@Service
public class CommandeImpl {
	
	
	
	
	
	@Autowired  //j'injecte les données dans ma base de donnée
	ICommandeRepository iCommandeRepository;
	

	
	
	//recuperer un produit en fonction de son id
    public Commande getCommandeById(Long idCmd) {
        return iCommandeRepository.findById(idCmd).get();
    }


    //Lists des produits fabriques
    public List<Commande> getAllCommande(){
        return iCommandeRepository.findAll();
    }

    //save
    public Commande saveCommande(Commande Commande) {
        return iCommandeRepository.save(Commande);
    }

    
    public Commande updateFour(@Valid Commande commande) {
        return iCommandeRepository.saveAndFlush(commande);
    }
    

	public void deleteCommande(Commande Commande) {
		iCommandeRepository.delete(Commande);
		
	}

}
