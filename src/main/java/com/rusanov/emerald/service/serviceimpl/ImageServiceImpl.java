package com.rusanov.emerald.service.serviceimpl;

import com.rusanov.emerald.entity.Image;
import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.repository.ImageRepository;
import com.rusanov.emerald.repository.PropertyRepository;
import com.rusanov.emerald.service.ImageService;
import com.rusanov.emerald.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private PropertyService propertyService;

    @Autowired
    @Qualifier("propertyRepository")
    private PropertyRepository propertyRepository;

    @Override
    public void deleteImage(Long theId) {
        imageRepository.deleteById(theId);
    }

    @Override
    public void mainPhoto(Long theId, Long propertyId) {
//        Image image = imageRepository.findById(theId).orElse(null);
//        assert image != null;
        Property property = propertyService.editProperty(propertyId);
        for (Image image : property.getImages()) {
            image.setPreviewImage(false);
            if (image.getId().equals(theId)) {
                image.setPreviewImage(true);
                property.setPreviewImageId(image.getId());
            }
//            else {
//                image.setPreviewImage(false);
//            }
        }
        propertyRepository.save(property);
    }
}