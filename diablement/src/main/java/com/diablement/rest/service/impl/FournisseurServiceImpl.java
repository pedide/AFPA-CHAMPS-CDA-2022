package com.diablement.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.Fournisseur;
import com.diablement.rest.repository.IFournisseurRepository;

@Service
public class FournisseurServiceImpl {

	@Autowired
	IFournisseurRepository fournisseurRepository;
	
	//recupere 1 four en fonction de son id
	public Fournisseur getFournisseurById(Long idFour) {
		return fournisseurRepository.findById(idFour).get();
			
	}
		
	//liste des fournisseur
	public List<Fournisseur> getAllFournisseur(){
		return fournisseurRepository.findAll();
			
	}
		
	//save
	public Fournisseur saveFournisseur(Fournisseur fournisseur) {
		return fournisseurRepository.save(fournisseur);
			
	}
	//update	
	public Fournisseur updateFournisseur(Fournisseur fournisseur) {
		return fournisseurRepository.saveAndFlush(fournisseur);
	}
	
	//delete
	public void deleteFournisseur(Fournisseur four) {
		fournisseurRepository.delete(four);
	}
	
	
}
