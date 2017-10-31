package com.searchroom.repository;

import com.searchroom.model.entities.Address;

public interface AddressRepository {

    int addAddress(Address address);
    void updateAddress(Address address);
    void deleteAddress(int addressId);

}
