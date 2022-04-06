package com.rusanov.emerald.dao;

import java.util.List;

import com.rusanov.emerald.entity.Customer;

public interface CustomerDAO {

    public List < Customer > getCustomers();

    public void saveCustomer(Customer theCustomer);

    public Customer getCustomer(int theId);

    public void deleteCustomer(int theId);
}
