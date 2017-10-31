package com.searchroom.interceptor;

import com.searchroom.model.entities.Account;
import com.searchroom.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
* This class read cookie and auto login
*/

@Component
public class CookieInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private AccountRepository accountRepository;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Account loggedInUser = (Account) session.getAttribute("LOGGED_IN_USER");
        if (loggedInUser != null)
            return true;

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("LOGGED_IN_USER".equals(cookie.getName())) {
                    String loggedInUsername = cookie.getValue();
                    Account account = accountRepository.getAccountByUsername(loggedInUsername);
                    session.setAttribute("LOGGED_IN_USER", account);
                    return true;
                }
            }
        }
        return true;
    }

}
