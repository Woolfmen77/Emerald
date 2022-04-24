package com.rusanov.emerald.service.serviceimpl;

import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import com.rusanov.emerald.repository.PropertyRepository;
import com.rusanov.emerald.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
@Transactional
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    @Qualifier("propertyRepository")
    private PropertyRepository propertyRepository;

    @Override
    @Transactional
    public List<Property> findByCategory(CategoryEnum category) {
        return propertyRepository.findByCategory(category);
    }

    @Override
    @Transactional
    public List<Property> getPropertyAll() {
        return propertyRepository.findAll();
    }

    @Override
    @Transactional
    public void addProperty(Property property) {
        propertyRepository.save(property);

    }

    @Override
    @Transactional
    public Property editProperty(Long theId) {
        return propertyRepository.findById(theId).orElseThrow(EntityNotFoundException::new);
    }

    @Override
    @Transactional
    public void deleteProperty(Long theId) {
        propertyRepository.deleteById(theId);
    }
}
