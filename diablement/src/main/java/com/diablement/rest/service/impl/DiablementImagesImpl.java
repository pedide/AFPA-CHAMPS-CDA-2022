package com.diablement.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diablement.rest.entity.Commande;
import com.diablement.rest.entity.DiablementImages;
import com.diablement.rest.repository.IDiablementImagesRepository;


@Service
public class DiablementImagesImpl {
	@Autowired
	IDiablementImagesRepository iDiabelementImagesRepository;

		//recupere 1 images en fonction de son id
		public DiablementImages getImagesById(Long idImage) {
			return iDiabelementImagesRepository.findById(idImage).get();
			
		}
		
		//liste des cimages
		public List<DiablementImages> getAllImages(){
			return iDiabelementImagesRepository.findAll();
			
		}
		
		//save
		public DiablementImages saveImages(DiablementImages diablementImages) {
			return iDiabelementImagesRepository.save(diablementImages);
			
		}
		
		//update
		public DiablementImages updateImages(@Valid DiablementImages diablementImages) { 
			return iDiabelementImagesRepository.saveAndFlush(diablementImages);
		}
		 
		
		//delete
		public void deleteImages(DiablementImages diablementImages) {
			iDiabelementImagesRepository.delete(diablementImages);
		}
}
