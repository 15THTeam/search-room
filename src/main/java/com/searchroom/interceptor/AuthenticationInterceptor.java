package com.searchroom.interceptor;

import com.searchroom.model.entities.Account;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Account account = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        if (account == null) {
            response.sendRedirect("/login");
            return false;
        }

        return true;
    }

}
