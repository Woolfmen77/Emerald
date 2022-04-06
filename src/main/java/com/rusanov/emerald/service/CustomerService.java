package com.rusanov.emerald.service;

import java.util.List;

import com.rusanov.emerald.entity.Customer;

public interface CustomerService {

    public List < Customer > getCustomers();

    public void saveCustomer(Customer theCustomer);

    public Customer getCustomer(int theId);

    public void deleteCustomer(int theId);

}
