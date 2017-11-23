package com.searchroom.repository;

import com.searchroom.model.entities.Account;

import java.util.List;

public interface AccountRepository {

    void addAccount(Account account);
    Account getAccountByUsername(String username);
    List<Account> getAllAccounts();
    void editRole(String username, String role);
    void deleteAccount(String username);
    void changePassword(Account account);

}
