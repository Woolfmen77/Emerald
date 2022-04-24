package com.rusanov.emerald.repository;

import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("propertyRepository")
public interface PropertyRepository extends JpaRepository<Property, Long> {

    @Query("select s from Property s where s.category = :category")
    List<Property> findByCategory(@Param("category") CategoryEnum category);

}
