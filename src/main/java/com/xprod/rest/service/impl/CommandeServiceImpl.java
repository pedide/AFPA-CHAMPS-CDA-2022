package com.xprod.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.Commande;
import com.xprod.rest.repository.ICommandeRepository;

@Service
public class CommandeServiceImpl {
	@Autowired
	private ICommandeRepository commandeRepository;
	
	public Commande getCommandeById(Long numCmd) {
		return commandeRepository.findById(numCmd).get();
	}
	
	public List<Commande> getCommande(){
		return commandeRepository.findAll();
	}
	
	public Commande saveCommande(Commande commande) {
		return commandeRepository.save(commande);
	}
	
	public Commande updateCommande(@Valid Commande commande) {
		return commandeRepository.saveAndFlush(commande);
	}
	
	public void deleteCommande(Commande commande) {
		commandeRepository.delete(commande);
	}
}
