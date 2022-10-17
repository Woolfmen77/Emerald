package com.rusanov.emerald.repository;

import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.enums.ApartmentEnum;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import com.rusanov.emerald.entity.enums.PropertyTypeEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("propertyRepository")
public interface PropertyRepository extends JpaRepository<Property, Long> {

    @Query("select k from Property k where k.apartment =:apartmentType")
    List<Property> findByApartmentType(@Param("apartmentType") ApartmentEnum apartmentType);

    @Query("select s from Property s where s.category = :category")
    List<Property> findByCategory(@Param("category") CategoryEnum category);

    @Query("select a from Property a where a.propertyType =:propertyType")
    List<Property> findByPropertyType(@Param("propertyType") PropertyTypeEnum propertyType);

    @Query("select  p from Property p where " +
            "CONCAT(p.category, ' ', p.propertyType, ' ', p.apartment, ' ', p.buildingType, ' ', " +
            "p.repair, ' ', p.bathroom, ' ', p.price) " +
            "LIKE %?1%")
    List<Property> getPropertyFilter(@Param("propertyFilter") String filter);

    @Query("select d from Property  d where " +
            "concat(d.address.region, ' ', d.address.city, ' ', d.address.district, ' ', d.address.street, ' ', " +
            "d.address.buildingNumber) " +
            "LIKE %?1%")
    List<Property> findByPropertyAddress(@Param("addressFilter") String addressFilter);
}