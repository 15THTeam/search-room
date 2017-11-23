package com.searchroom.mapper;

import com.searchroom.model.join.AccountAndPost;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountAndPostMapper implements RowMapper<AccountAndPost> {

    @Override
    public AccountAndPost mapRow(ResultSet resultSet, int i) throws SQLException {
        String username = resultSet.getString("username");
        String role = resultSet.getString("role");
        int postAmount = resultSet.getInt("posts");
        return new AccountAndPost(username, role, postAmount);
    }

}
