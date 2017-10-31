package com.searchroom.repository.impl;

import com.searchroom.model.entities.Address;
import com.searchroom.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.PreparedStatement;
import java.sql.Statement;

@Repository
@Transactional
public class AddressRepositoryImpl implements AddressRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int addAddress(final Address address) {
        KeyHolder holder = new GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            String sql = "insert into addresses (latitude, longitude, address) values (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, address.getLatitude());
            ps.setString(2, address.getLongitude());
            ps.setString(3, address.getAddress());
            return ps;
        }, holder);

        return holder.getKey().intValue();
    }

    @Override
    public void updateAddress(Address address) {
        String sql = "update addresses set latitude = ?, longitude = ?, address = ? where address_id = ?";
        jdbcTemplate.update(sql, new Object[]{address.getLatitude(), address.getLongitude(),
                address.getAddress(), address.getId()});
    }

    @Override
    public void deleteAddress(int addressId) {
        String sql = "delete from addresses where address_id = ?";
        jdbcTemplate.update(sql, new Object[]{addressId});
    }

}
