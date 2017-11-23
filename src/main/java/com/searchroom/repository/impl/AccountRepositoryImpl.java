package com.searchroom.repository.impl;

import com.searchroom.mapper.AccountMapper;
import com.searchroom.model.entities.Account;
import com.searchroom.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class AccountRepositoryImpl implements AccountRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void addAccount(Account account) {
        String sql = "insert into accounts (username, password, role) values (?, ?, ?)";
        jdbcTemplate.update(sql, account.getUsername(), account.getPassword(), account.getRole());
    }

    public Account getAccountByUsername(String username) {
        String sql = "select username, password, role from accounts where username = ?";

        List<Account> result = jdbcTemplate.query(sql, new Object[] { username }, new AccountMapper());

        if (result.size() == 1) {
            return result.get(0);
        }
        return null;
    }

    @Override
    public void editRole(String username, String role) {
        String sql = "update accounts set role = ? where username = ?";
        jdbcTemplate.update(sql, role, username);
    }

    @Override
    public void deleteAccount(String username) {
        String sql = "delete from accounts where username = ?";
        jdbcTemplate.update(sql, username);
    }

    @Override
    public void changePassword(Account account) {
        String sql = "update accounts set password = ? where username = ?";
        jdbcTemplate.update(sql, account.getPassword(), account.getUsername());
    }

}
