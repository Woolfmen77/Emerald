package com.rusanov.emerald.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

@Entity
@Table
public class Property {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "number_room")
    private int numberRoom;

    @Column
    private BigDecimal price;

    @Column
    private String bathroom;

    @Column(name = "total_area")
    private BigDecimal totalArea;

    @Column(name = "living_area")
    private BigDecimal livingArea;

    @Column
    private String description;

    @Column
    private Date date;

    @Column
    private int balcony;

    @Column
    private int floor;

    @Column(name = "construction_year")
    private int constructionYear;

    @ManyToOne
    @JoinColumn (name = "building_type_id")
    private BuildingType buildingType;

    @ManyToOne
    @JoinColumn (name = "property_type_id")
    private PropertyType propertyType;

    @ManyToOne
    @JoinColumn (name = "repair_id")
    private Repair repair;

    @ManyToOne
    @JoinColumn (name = "service_id")
    private Service service;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private  User user;

    @OneToOne(mappedBy = "property",cascade = CascadeType.ALL)
    @PrimaryKeyJoinColumn
    private Address address;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getNumberRoom() {
        return numberRoom;
    }

    public void setNumberRoom(int numberRoom) {
        this.numberRoom = numberRoom;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getBathroom() {
        return bathroom;
    }

    public void setBathroom(String bathroom) {
        this.bathroom = bathroom;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getBalcony() {
        return balcony;
    }

    public void setBalcony(int balcony) {
        this.balcony = balcony;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public int getConstructionYear() {
        return constructionYear;
    }

    public void setConstructionYear(int constructionYear) {
        this.constructionYear = constructionYear;
    }

    public BuildingType getBuildingType() {
        return buildingType;
    }

    public void setBuildingType(BuildingType buildingType) {
        this.buildingType = buildingType;
    }

    public PropertyType getPropertyType() {
        return propertyType;
    }

    public void setPropertyType(PropertyType propertyType) {
        this.propertyType = propertyType;
    }

    public Repair getRepair() {
        return repair;
    }

    public void setRepair(Repair repair) {
        this.repair = repair;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Property property = (Property) o;
        return numberRoom == property.numberRoom && balcony == property.balcony && floor == property.floor && constructionYear == property.constructionYear && Objects.equals(id, property.id) && Objects.equals(price, property.price) && Objects.equals(bathroom, property.bathroom) && Objects.equals(totalArea, property.totalArea) && Objects.equals(livingArea, property.livingArea) && Objects.equals(description, property.description) && Objects.equals(date, property.date) && Objects.equals(buildingType, property.buildingType) && Objects.equals(propertyType, property.propertyType) && Objects.equals(repair, property.repair) && Objects.equals(service, property.service) && Objects.equals(user, property.user) && Objects.equals(address, property.address);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, numberRoom, price, bathroom, totalArea, livingArea, description, date, balcony, floor, constructionYear, buildingType, propertyType, repair, service, user, address);
    }

    @Override
    public String toString() {
        return "\nProperty{" +
                "id=" + id +
                ", numberRoom=" + numberRoom +
                ", price=" + price +
                ", bathroom='" + bathroom + '\'' +
                ", totalArea=" + totalArea +
                ", livingArea=" + livingArea +
                ", description='" + description + '\'' +
                ", date=" + date +
                ", balcony=" + balcony +
                ", floor=" + floor +
                ", constructionYear=" + constructionYear +
                ", buildingType=" + buildingType +
                ", propertyType=" + propertyType +
                ", repair=" + repair +
                ", service=" + service +
                ", user=" + user +
                ", address=" + address +
                '}';
    }
}
