package com.rusanov.emerald.service;

import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.enums.CategoryEnum;

import java.util.List;

public interface PropertyService {

    public List<Property> findByCategory(CategoryEnum category);

    public List<Property> getPropertyAll();

    public void addProperty(Property property);

    public Property editProperty(Long theId);

    public void deleteProperty(Long theId);

}
