package com.searchroom.service;

import com.searchroom.model.entities.Account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AccountService {

    void saveAccount(Account account);

    // return account's role, return empty string if login fail
    String login(Account account, HttpServletRequest request, HttpServletResponse response);

}
