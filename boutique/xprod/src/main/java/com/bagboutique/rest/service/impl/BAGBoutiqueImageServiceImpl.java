package com.bagboutique.rest.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bagboutique.rest.entity.BAGBoutiqueImage;
import com.bagboutique.rest.repository.IBAGBoutiqueImageRepository;

@Service
public class BAGBoutiqueImageServiceImpl {

	@Autowired 
	private IBAGBoutiqueImageRepository iBAGBoutiqueImageRepository ;
	

	   public BAGBoutiqueImage getImageById(Long idImage) {
	        return iBAGBoutiqueImageRepository.findById(idImage).get();
	    }

	    public List<BAGBoutiqueImage> getAllImage(){
	        return iBAGBoutiqueImageRepository.findAll();
	    }
	    
	    
	    public BAGBoutiqueImage saveImage(BAGBoutiqueImage bAGBoutiqueImage) {
	        return iBAGBoutiqueImageRepository.save(bAGBoutiqueImage);
	    }
	    
	    
	    public BAGBoutiqueImage updateImage(@Valid BAGBoutiqueImage bAGBoutiqueImage) {
	        return iBAGBoutiqueImageRepository.saveAndFlush(bAGBoutiqueImage);
	    }
	    
		public void deleteImage(BAGBoutiqueImage bAGBoutiqueImage) {
			iBAGBoutiqueImageRepository.delete(bAGBoutiqueImage);
			
		}

		
		public void remove (Long id) {}

		public List<BAGBoutiqueImage> getImage() {
		
			return null;
		}

	
	
	
}
