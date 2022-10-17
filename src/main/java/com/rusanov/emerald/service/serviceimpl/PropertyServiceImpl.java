package com.rusanov.emerald.service.serviceimpl;

import com.rusanov.emerald.dto.PropertyAddressDto;
import com.rusanov.emerald.entity.Image;
import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.entity.enums.ApartmentEnum;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import com.rusanov.emerald.entity.enums.PropertyTypeEnum;
import com.rusanov.emerald.repository.PropertyRepository;
import com.rusanov.emerald.repository.UserRepository;
import com.rusanov.emerald.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityNotFoundException;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    @Qualifier("propertyRepository")
    private PropertyRepository propertyRepository;

    @Autowired
    @Qualifier("userRepository")
    private UserRepository userRepository;

    public Optional<Property> getId(Long id) {
        return propertyRepository.findById(id);
    }

    @Override
    public User getPrincipal(Principal principal) {
        if (principal == null) {
            return new User();
        }
        return userRepository.findByUsername(principal.getName());
    }

    @Override
    public List<Property> getRropertyFilter(String filter) {
        return propertyRepository.getPropertyFilter(filter);
    }

    @Override
    public List<Property> findByApartmentType(ApartmentEnum apartmentType) {
        return propertyRepository.findByApartmentType(apartmentType);
    }

    public List<PropertyAddressDto> getAllPropertyAddress() {
        return propertyRepository.findAll()
                .stream()
                .map(this::convertEntityToDto)
                .collect(Collectors.toList());
    }

    private PropertyAddressDto convertEntityToDto(Property property) {
        PropertyAddressDto propertyAddressDto = new PropertyAddressDto();
        propertyAddressDto.setPropertyId(property.getId());
        propertyAddressDto.setCategory(property.getCategory());
        propertyAddressDto.setPropertyType(property.getPropertyType());
        propertyAddressDto.setApartment(property.getApartment());
        propertyAddressDto.setPrice(property.getPrice());
        propertyAddressDto.setDescription(property.getDescription());
        propertyAddressDto.setRegion(property.getAddress().getRegion());
        propertyAddressDto.setCity(property.getAddress().getCity());
        propertyAddressDto.setDistrict(property.getAddress().getDistrict());
        propertyAddressDto.setStreet(property.getAddress().getStreet());
        return propertyAddressDto;
    }

    @Override
    public List<Property> findByCategory(CategoryEnum category) {
        return propertyRepository.findByCategory(category);
    }

    @Override
    public List<Property> findByPropertyType(PropertyTypeEnum propertyType) {
        return propertyRepository.findByPropertyType(propertyType);
    }

    @Override
    public List<Property> getPropertyAddressFilter(String addressFilter) {
        return propertyRepository.findByPropertyAddress(addressFilter);
    }

    @Override
    public List<Property> getPropertyAll() {
        return propertyRepository.findAll();
    }

    @Override
    public List<Property> getPropertyAllPriceAscending() {
        List<Property> priceAscending = propertyRepository.findAll();
        priceAscending.sort(Comparator.comparing(Property::getPrice));
        return priceAscending;
    }

    @Override
    public List<Property> getPropertyAllPriceDescending() {
        List<Property> priceDescending = propertyRepository.findAll();
        Comparator<Property> comparator = Comparator.comparing(Property::getPrice);
        priceDescending.sort(comparator.reversed());
        return priceDescending;
    }

    @Override
    public void addProperty(Principal principal, Property property, MultipartFile[] files) throws IOException {
        property.setUser(getPrincipal(principal));
        Image image;

        if (property.getId() != null) {
            Property propertyNew = propertyRepository.getById(property.getId());
            property.setDateAdded(propertyNew.getDateAdded());
            property.setModificationDate(LocalDate.now());
            for (MultipartFile file : files) {
                if (file.getSize() != 0) {
                    image = toImageEntity(file);
                    property.addImageToProperty(image);
                }
            }

            List<Image> imageList = propertyNew.getImages();
            if (propertyNew.getImages().stream().anyMatch(Image::isPreviewImage)) {
                if (!imageList.isEmpty()) {
                    imageList.stream().findFirst().get().setPreviewImage(true);
                }
            }

            for (Image image1 : propertyNew.getImages()) {
                if (image1.isPreviewImage()) {
                    property.setPreviewImageId(image1.getId());
                }
            }
        } else {
            property.setDateAdded(LocalDate.now());
            for (MultipartFile file : files) {
                image = toImageEntity(file);
                property.addImageToProperty(image);
                String originalName = Arrays.stream(files).findFirst().get().getOriginalFilename();
                if (image.getOriginalFileName().equals(originalName)) {
                    image.setPreviewImage(true);
                }
            }
            Property propertyOne = propertyRepository.save(property);
            propertyOne.setPreviewImageId(property.getImages().get(0).getId());
        }
        propertyRepository.save(property);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    @Override
    public Property editProperty(Long theId) {
        return propertyRepository.findById(theId).orElseThrow(EntityNotFoundException::new);
    }

    @Override
    public void deleteProperty(Long theId) {
        propertyRepository.deleteById(theId);
    }
}