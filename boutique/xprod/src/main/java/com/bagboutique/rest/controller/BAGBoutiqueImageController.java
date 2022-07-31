package com.bagboutique.rest.controller;

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

import com.bagboutique.rest.entity.BAGBoutiqueImage;
import com.bagboutique.rest.service.impl.BAGBoutiqueImageServiceImpl;


@RestController // permet de generer le JSON
@RequestMapping //
@CrossOrigin("*")
public class BAGBoutiqueImageController {
	

	@Autowired//injection de dependences
	BAGBoutiqueImageServiceImpl bAGBoutiqueImageServiceImpl;
	
	
@GetMapping("/bAGBoutiqueImage")//va nous donner le chemain pour aller chercher nos produits 
public List<BAGBoutiqueImage> getAllImage(@Validated @RequestBody(required=false) BAGBoutiqueImage bAGBoutiqueImage){
return bAGBoutiqueImageServiceImpl.getAllImage();

}
@PostMapping("/bAGBoutiqueImage")
public BAGBoutiqueImage CreateImage(@Validated @RequestBody(required=false) BAGBoutiqueImage bAGBoutiqueImage) {
	return bAGBoutiqueImageServiceImpl.saveImage(bAGBoutiqueImage);
	
	
}

	

@PutMapping ("/bAGBoutiqueImage")
public BAGBoutiqueImage updateImage(@Validated @RequestBody(required=false)BAGBoutiqueImage bAGBoutiqueImage) {
	return	bAGBoutiqueImageServiceImpl.saveImage(bAGBoutiqueImage);
}



@GetMapping ("/bAGBoutiqueImage/{id}")
public ResponseEntity findImage( @PathVariable(name="id")Long idImage) {
	
	if(idImage==null) {
		return ResponseEntity.badRequest().body("cannot retrieve Image with null id!");
	}
	BAGBoutiqueImage bAGBoutiqueImage = bAGBoutiqueImageServiceImpl.getImageById(idImage);
		if(bAGBoutiqueImage==null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(bAGBoutiqueImage);
	}

	
	

@DeleteMapping ("/bAGBoutiqueImage/{id}")
public ResponseEntity deleteImage( @PathVariable(name="id")Long idImage) {
	
	BAGBoutiqueImage bAGBoutiqueImage = bAGBoutiqueImageServiceImpl.getImageById(idImage);
		if(bAGBoutiqueImage==null) {
			return ResponseEntity.notFound().build();
		}
		bAGBoutiqueImageServiceImpl.deleteImage(bAGBoutiqueImage );
		
		return ResponseEntity.ok().body(bAGBoutiqueImage);
	}

	

}
