package com.xprod.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.Fournisseur;
import com.xprod.rest.repository.IFournisseurRepository;

@Service
public class FournisseurServiceImpl {
	@Autowired
	private IFournisseurRepository fournisseurRepository;
	
	public Fournisseur getFournisseurById(Long idFour) {
		return fournisseurRepository.findById(idFour).get();
	}
	
	public List<Fournisseur> getFournisseur(){
		return fournisseurRepository.findAll();
	}
	
	public Fournisseur saveFournisseur(Fournisseur fournisseur) {
		return fournisseurRepository.save(fournisseur);
	}
	
	public Fournisseur updateFournisseur(@Valid Fournisseur fournisseur) {
		return fournisseurRepository.saveAndFlush(fournisseur);
	}
	
	public void deleteFournisseur(Fournisseur fournisseur) {
		fournisseurRepository.delete(fournisseur);
	}
}

