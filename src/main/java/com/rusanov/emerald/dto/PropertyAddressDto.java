package com.rusanov.emerald.dto;

import com.rusanov.emerald.entity.enums.ApartmentEnum;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import com.rusanov.emerald.entity.enums.PropertyTypeEnum;

import java.math.BigDecimal;

public class PropertyAddressDto {

    private Long propertyId;
    private CategoryEnum category;
    private PropertyTypeEnum propertyType;
    private ApartmentEnum apartment;
    private Integer numberRoom;
    private BigDecimal price;
    private String description;
    private String region;
    private String city;
    private String district;
    private String street;

    public Integer getNumberRoom() {
        return numberRoom;
    }

    public void setNumberRoom(Integer numberRoom) {
        this.numberRoom = numberRoom;
    }

    public Long getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Long propertyId) {
        this.propertyId = propertyId;
    }

    public CategoryEnum getCategory() {
        return category;
    }

    public void setCategory(CategoryEnum category) {
        this.category = category;
    }

    public PropertyTypeEnum getPropertyType() {
        return propertyType;
    }

    public void setPropertyType(PropertyTypeEnum propertyType) {
        this.propertyType = propertyType;
    }

    public ApartmentEnum getApartment() {
        return apartment;
    }

    public void setApartment(ApartmentEnum apartment) {
        this.apartment = apartment;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }
}