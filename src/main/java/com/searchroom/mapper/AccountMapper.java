package com.searchroom.mapper;

import com.searchroom.model.entities.Account;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountMapper implements RowMapper<Account> {

    public Account mapRow(ResultSet resultSet, int i) throws SQLException {
        String username = resultSet.getString("username");
        String role = resultSet.getString("role");
        return new Account(username, role);
    }

}
