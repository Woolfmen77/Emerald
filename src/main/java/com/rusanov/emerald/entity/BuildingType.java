package com.rusanov.emerald.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "building_type")
public class BuildingType {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String name;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "buildingType")
    private Set<Property> properties = new HashSet<Property>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Property> getProperties() {
        return properties;
    }

    public void setProperties(Set<Property> properties) {
        this.properties = properties;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BuildingType that = (BuildingType) o;
        return Objects.equals(id, that.id) && Objects.equals(name, that.name) && Objects.equals(properties, that.properties);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, properties);
    }

    @Override
    public String toString() {
        return "\nBuildingType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", properties=" + properties +
                '}';
    }
}
