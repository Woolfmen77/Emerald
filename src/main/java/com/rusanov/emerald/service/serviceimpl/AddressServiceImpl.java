package com.rusanov.emerald.service.serviceimpl;

import com.rusanov.emerald.entity.Address;
import com.rusanov.emerald.repository.AddressRepository;
import com.rusanov.emerald.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    @Qualifier("addressRepository")
    private AddressRepository addressRepository;

    @Override
    public List<Address> getAddressAll() {
        return addressRepository.findAll();
    }

    @Override
    public List<Address> getAddressFilter(String filter) {
        return addressRepository.getAddressFilter(filter);
    }

    @Override
    public void addAddress(Address address) {
        addressRepository.save(address);
    }

    @Override
    public Address editAddress(Long theId) {
        return addressRepository.findById(theId).orElseThrow(EntityNotFoundException::new);
    }

    @Override
    public void deleteAddress(Long theId) {
        addressRepository.deleteById(theId);
    }
}