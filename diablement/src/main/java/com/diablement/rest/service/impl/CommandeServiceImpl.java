package com.diablement.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.Commande;
import com.diablement.rest.repository.ICommandeRepository;

@Service
public class CommandeServiceImpl {

	@Autowired
	ICommandeRepository commandeRepository;
	
	//recupere 1 cmde en fonction de son id
	public Commande getCommandeById(Long idCmde) {
		return commandeRepository.findById(idCmde).get();
		
	}
	
	//liste des commandes
	public List<Commande> getAllCommande(){
		return commandeRepository.findAll();
		
	}
	
	//save
	public Commande saveCommande(Commande cmde) {
		return commandeRepository.save(cmde);
		
	}
	
	//update
	public Commande updateCommande(@Valid Commande cmde) { 
		return commandeRepository.saveAndFlush(cmde);
	}
	 
	
	//delete
	public void deleteCommande(Commande cmde) {
		commandeRepository.delete(cmde);
	}
}
