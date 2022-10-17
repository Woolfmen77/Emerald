package com.rusanov.emerald.repository;

import com.rusanov.emerald.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("addressRepository")
public interface AddressRepository extends JpaRepository<Address, Long> {

    @Query("select a from Address a where " +
            "CONCAT(a.region, ' ', a.city, ' ', a.district, ' ', a.street)" +
            "LIKE %?1%")
    List<Address> getAddressFilter(@Param("filter") String filter);
}