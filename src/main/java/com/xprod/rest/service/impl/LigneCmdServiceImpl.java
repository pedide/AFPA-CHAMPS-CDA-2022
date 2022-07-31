package com.xprod.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xprod.rest.entity.LigneCmd;
import com.xprod.rest.repository.ILigneCmdRepository;

@Service
public class LigneCmdServiceImpl {
	@Autowired
	private ILigneCmdRepository ligneCmdRepository;
	
	public LigneCmd getLigneCmdById(Long numCmd) {
		return ligneCmdRepository.findById(numCmd).get();
	}
	
	public List<LigneCmd> getLigneCmd(){
		return ligneCmdRepository.findAll();
	}
	
	public LigneCmd saveLigneCmd(LigneCmd ligneCmd) {
		return ligneCmdRepository.save(ligneCmd);
	}
	
	public LigneCmd updateLigneCmd(LigneCmd ligneCmd) {
		return ligneCmdRepository.saveAndFlush(ligneCmd);
	}
	
	public void deleteLigneCmd(LigneCmd ligneCmd) {
		ligneCmdRepository.delete(ligneCmd);
	}
}
