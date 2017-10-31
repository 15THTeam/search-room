package com.searchroom.repository;

import com.searchroom.model.entities.Customer;

public interface CustomerRepository {

    void addCustomer(Customer customer);
    Customer getCustomerByUsername(String username);
    void updateCustomer(Customer customer);

}
