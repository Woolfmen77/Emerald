package com.rusanov.emerald.service;

import com.rusanov.emerald.dto.PropertyAddressDto;
import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.entity.enums.ApartmentEnum;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import com.rusanov.emerald.entity.enums.PropertyTypeEnum;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

public interface PropertyService {

    List<Property> findByCategory(CategoryEnum category);

    List<Property> findByPropertyType(PropertyTypeEnum propertyType);

    List<Property> getPropertyAddressFilter(String addressFilter);

    List<Property> getPropertyAllPriceAscending();

    List<Property> getPropertyAllPriceDescending();

    List<Property> getPropertyAll();

    void addProperty(Principal principal, Property property, MultipartFile[] files) throws IOException;

    Property editProperty(Long theId);

    void deleteProperty(Long theId);

    Optional<Property> getId(Long id);

    List<PropertyAddressDto> getAllPropertyAddress();

    User getPrincipal(Principal principal);

    List<Property> getRropertyFilter(String filter);

    List<Property> findByApartmentType(ApartmentEnum apartmentType);
}