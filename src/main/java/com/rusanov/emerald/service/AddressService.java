package com.rusanov.emerald.service;

import com.rusanov.emerald.entity.Address;

import java.util.List;

public interface AddressService {
    Address editAddress(Long theId);

    List<Address> getAddressAll();

    List<Address> getAddressFilter(String filter);

    void addAddress(Address address);

    void deleteAddress(Long theId);
}