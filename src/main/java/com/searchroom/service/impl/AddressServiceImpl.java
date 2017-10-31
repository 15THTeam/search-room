package com.searchroom.service.impl;

import com.searchroom.model.entities.Address;
import com.searchroom.service.AddressService;
import com.searchroom.utils.AddressConverter;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl implements AddressService {

    public Address getLatLngByAddress(String address) {
        Address addr = new Address();
        addr.setAddress(address);
        String[] latlong = new String[2];

        try {
            latlong = AddressConverter.getLatLongPositions(address);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (latlong == null) {
            addr.setLatitude("0");
            addr.setLongitude("0");
        } else {
            addr.setLatitude(latlong[0]);
            addr.setLongitude(latlong[1]);
        }

        return addr;
    }
}
