package com.diablement.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.diablement.rest.entity.DiablementImages;
import com.diablement.rest.service.impl.DiablementImagesImpl;


@RestController //genere des API rest JSON
@RequestMapping
@CrossOrigin("*")
public class DiablementImagesController {

	@Autowired
	DiablementImagesImpl diabelementImagesImpl;
	
	//recuper une image
	@GetMapping("/images")
	public List<DiablementImages> getAllImages(@Validated
			@RequestBody(required=false)DiablementImages diablementImages){
			
		return diabelementImagesImpl.getAllImages();
	}
		
	@PostMapping("/images")
	public DiablementImages createImages(@Validated 
			@RequestBody(required=false)DiablementImages diablementImages) {
			
		return diabelementImagesImpl.saveImages(diablementImages);
	}
		
	//on recupere 1 image en fonction de id
	@GetMapping("/images/{idImages}")
	public ResponseEntity findImagesById(@PathVariable(name="idImages") Long idImages){
		if(idImages==null) {
			return ResponseEntity.badRequest().body("On ne trouve pas d'image avec id null");
		}
			
		DiablementImages diablementImages = diabelementImagesImpl.getImagesById(idImages);
			
		if(diablementImages == null) {
			return ResponseEntity.notFound().build();//pas trouvé cette image
		}
		return ResponseEntity.ok().body(diablementImages);
	}
		
	//mettre à jour mes images
	@PutMapping("/images")
	public DiablementImages updateImages(@Validated @RequestBody(required=false) DiablementImages diablementImages) {
		return diabelementImagesImpl.updateImages(diablementImages);
	}
		
	@DeleteMapping("/images/{id}")
	public ResponseEntity<DiablementImages> deleteImages(@Validated @PathVariable(name="id") Long idImages){
		DiablementImages diablementImages = diabelementImagesImpl.getImagesById(idImages);
			
		if(diablementImages == null) {
			return ResponseEntity.notFound().build();
		}
		diabelementImagesImpl.deleteImages(diablementImages);//on supprime l'image
		return ResponseEntity.ok().body(diablementImages);
	}
		
}
