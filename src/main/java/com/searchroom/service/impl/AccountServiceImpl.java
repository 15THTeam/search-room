package com.searchroom.service.impl;

import com.searchroom.model.entities.Account;
import com.searchroom.repository.AccountRepository;
import com.searchroom.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean checkUsernameDuplicate(String username) {
        return accountRepository.getAccountByUsername(username) != null;
    }

    @Override
    public void saveAccount(Account account) {
        account.setPassword(passwordEncoder.encode(account.getPassword()));
        account.setRole("CUSTOMER");
        accountRepository.addAccount(account);
    }

    @Override
    public String login(Account account, HttpServletRequest request, HttpServletResponse response) {
        Account authenticateAccount = accountRepository.getAccountByUsername(account.getUsername());

        if (passwordEncoder.matches(account.getPassword(), authenticateAccount.getPassword())) {
            Account loggedInAccount = new Account(authenticateAccount.getUsername(), authenticateAccount.getRole());
            request.getSession().setAttribute("LOGGED_IN_USER", loggedInAccount);

            boolean isRemember = "Y".equals(request.getParameter("remember-me"));
            if (isRemember) {
                Cookie cookie = new Cookie("USERNAME_IN_COOKIE", loggedInAccount.getUsername());
                cookie.setMaxAge(24 * 60 * 60); // 1 day
                response.addCookie(cookie);
            }
            return loggedInAccount.getRole();
        }
        return "";
    }

    @Override
    public boolean changePassword(HttpServletRequest request) {
        String username = request.getParameter("username");
        String oldPass = request.getParameter("old-pass");
        String newPass = request.getParameter("new-pass");

        Account existedAccount = accountRepository.getAccountByUsername(username);
        if (passwordEncoder.matches(oldPass, existedAccount.getPassword())) {
            Account newAccount = new Account();
            newAccount.setUsername(username);
            newAccount.setPassword(passwordEncoder.encode(newPass));
            accountRepository.changePassword(newAccount);
            return true;
        }
        return false;
    }

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        Cookie cookie = new Cookie("USERNAME_IN_COOKIE", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

}
