package com.rusanov.emerald.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String region;

    @Column
    private String city;

    @Column
    private String district;

    @Column
    private String street;

    @Column(name = "building_number")
    private int buildingNumber;

    @OneToOne(cascade = CascadeType.ALL)
    @PrimaryKeyJoinColumn
    private User user;

    @OneToOne(cascade = CascadeType.ALL)
    @PrimaryKeyJoinColumn
    private Property property;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public int getBuildingNumber() {
        return buildingNumber;
    }

    public void setBuildingNumber(int buildingNumber) {
        this.buildingNumber = buildingNumber;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address = (Address) o;
        return buildingNumber == address.buildingNumber && Objects.equals(id, address.id) && Objects.equals(region, address.region) && Objects.equals(city, address.city) && Objects.equals(district, address.district) && Objects.equals(street, address.street) && Objects.equals(user, address.user) && Objects.equals(property, address.property);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, region, city, district, street, buildingNumber, user, property);
    }

    @Override
    public String toString() {
        return "\nAddress{" +
                "id=" + id +
                ", region='" + region + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", street='" + street + '\'' +
                ", buildingNumber=" + buildingNumber +
                ", user=" + user +
                ", property=" + property +
                '}';
    }
}
