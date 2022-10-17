package com.rusanov.emerald.entity;

import com.rusanov.emerald.entity.enums.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Entity
@Table
public class Property extends Model {

    @Column
    @Enumerated(EnumType.STRING)
    private CategoryEnum category;

    @Column(name = "property_type")
    @Enumerated(EnumType.STRING)
    private PropertyTypeEnum propertyType;

    @Column
    @Enumerated(EnumType.STRING)
    private ApartmentEnum apartment;

    @Column(name = "building_type")
    @Enumerated(EnumType.STRING)
    private BuildingTypeEnum buildingType;

    @Column
    @Enumerated(EnumType.STRING)
    private RepairEnum repair;

    @Column
    @Enumerated(EnumType.STRING)
    private BathroomEnum bathroom;

//    @Column(name = "number_room")
//    private Integer numberRoom;

    @Column
    private BigDecimal price;

    @Column(name = "total_area")
    private BigDecimal totalArea;

    @Column(name = "living_area")
    private BigDecimal livingArea;

    @Column
    private String description;

    @Column
    private Boolean balcony;

    @Column
    private Integer floor;

    @Column
    private Integer floors;

    @Column(name = "modification_date")
    private LocalDate modificationDate;

    @Column(name = "date_added")
    private LocalDate dateAdded;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "property")
    private List<Image> images = new ArrayList<>();

    @Column(name = "preview_image_id")
    private Long previewImageId;

    public void addImageToProperty(Image image) {
        image.setProperty(this);
        images.add(image);
        images = images.stream().distinct().collect(Collectors.toList());
//        HashSet<Image> set = new HashSet<>(images);
//        images.clear();
//        images.addAll(set);
    }

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_id", referencedColumnName = "id")
    private Address address;

    public LocalDate getModificationDate() {
        return modificationDate;
    }

    public void setModificationDate(LocalDate modificationDate) {
        this.modificationDate = modificationDate;
    }

    public LocalDate getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(LocalDate dateAdded) {
        this.dateAdded = dateAdded;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Long getPreviewImageId() {
        return previewImageId;
    }

    public void setPreviewImageId(Long previewImageId) {
        this.previewImageId = previewImageId;
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

    public BuildingTypeEnum getBuildingType() {
        return buildingType;
    }

    public void setBuildingType(BuildingTypeEnum buildingType) {
        this.buildingType = buildingType;
    }

    public RepairEnum getRepair() {
        return repair;
    }

    public void setRepair(RepairEnum repair) {
        this.repair = repair;
    }

    public BathroomEnum getBathroom() {
        return bathroom;
    }

    public void setBathroom(BathroomEnum bathroom) {
        this.bathroom = bathroom;
    }

//    public Integer getNumberRoom() {
//        return numberRoom;
//    }
//
//    public void setNumberRoom(Integer numberRoom) {
//        this.numberRoom = numberRoom;
//    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotalArea() {
        return totalArea;
    }

    public void setTotalArea(BigDecimal totalArea) {
        this.totalArea = totalArea;
    }

    public BigDecimal getLivingArea() {
        return livingArea;
    }

    public void setLivingArea(BigDecimal livingArea) {
        this.livingArea = livingArea;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getBalcony() {
        return balcony;
    }

    public void setBalcony(Boolean balcony) {
        this.balcony = balcony;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getFloors() {
        return floors;
    }

    public void setFloors(Integer floors) {
        this.floors = floors;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}