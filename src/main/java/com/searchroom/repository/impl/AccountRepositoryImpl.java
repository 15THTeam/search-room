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
    JdbcTemplate jdbcTemplate;

    public void addAccount(Account account) {
        String sql = "insert into accounts (username, password, role) values (?, ?, ?)";
        jdbcTemplate.update(sql, new Object[] { account.getUsername(), account.getPassword(), account.getRole() });
    }

    public Account getAccount(Account account) {
        String sql = "select username, role from accounts where username = ? and password = ?";

        List<Account> result = jdbcTemplate.query(
                sql,
                new Object[] { account.getUsername(), account.getPassword() },
                new AccountMapper());

        if (result.size() == 1) {
            return result.get(0);
        }
        return null;
    }

    public Account getAccountByUsername(String username) {
        String sql = "select username, role from accounts where username = ?";

        List<Account> result = jdbcTemplate.query(sql, new Object[] { username }, new AccountMapper());

        if (result.size() == 1) {
            return result.get(0);
        }
        return null;
    }

    @Override
    public List<Account> getAllAccounts() {
        String sql = "select * from accounts";
        return jdbcTemplate.query(sql, new AccountMapper());
    }

    @Override
    public void editRole(String username, String role) {
        String sql = "update accounts set role = ? where username = ?";
        jdbcTemplate.update(sql, new Object[]{role, username});
    }

    @Override
    public void deleteAccount(String username) {
        String sql = "delete from accounts where username = ?";
        jdbcTemplate.update(sql, new Object[]{username});
    }

}
