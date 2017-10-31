package com.searchroom.interceptor;

import com.searchroom.model.entities.Account;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Account account = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        if (account == null) {
            response.sendRedirect("/admin/login");
            return false;
        }

        if (request.getRequestURI().endsWith("/admin")) {
            if (account.getRole().equals("CUSTOMER")) {
                response.sendRedirect("permissionError");
                return false;
            }
        }

        return true;
    }

}
