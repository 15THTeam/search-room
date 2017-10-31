package com.searchroom.mapper;

import com.searchroom.model.entities.Address;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AddressMapper implements RowMapper<Address> {

    public Address mapRow(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt("address_id");
        String lat = resultSet.getString("latitude");
        String lng = resultSet.getString("longitude");
        String address = resultSet.getString("address");
        return new Address(id, lat, lng, address);
    }

}
