package com.rusanov.emerald.service;

public interface ImageService {
    void deleteImage(Long theId);

    void mainPhoto(Long theId, Long propertyId);
}
