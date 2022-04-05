package com.rusanov.emerald.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "service")
public class Service {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String name;


    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true, mappedBy = "service")
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
        Service service = (Service) o;
        return Objects.equals(id, service.id) && Objects.equals(name, service.name) && Objects.equals(properties, service.properties);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, properties);
    }

    @Override
    public String toString() {
        return "\nService{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", properties=" + properties +
                '}';
    }
}
