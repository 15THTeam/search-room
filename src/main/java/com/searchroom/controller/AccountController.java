package com.searchroom.controller;

import com.searchroom.model.entities.Account;
import com.searchroom.repository.AccountRepository;
import com.searchroom.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/register")
    public ModelAndView showRegisterForm() {
        return new ModelAndView("register", "account", new Account());
    }

    @GetMapping("/check-username-duplicate")
    public @ResponseBody String checkUsernameDuplicate(@RequestParam("username") String username) {
        return accountRepository.getAccountByUsername(username) == null ? "OK" : "duplicate";
    }

    @PostMapping("/register")
    public ModelAndView registerSubmit(@ModelAttribute("account")Account account) {
        accountService.saveAccount(account);
        ModelAndView mav = new ModelAndView("register");
        mav.addObject("account", new Account());
        mav.addObject("notification", "Create account successfully");
        return mav;
    }

    @GetMapping("/login")
    public ModelAndView showLoginForm() {
        return new ModelAndView("login", "account", new Account());
    }

    @PostMapping("/login")
    public ModelAndView loginSubmit(@ModelAttribute("account")Account account,
                                    HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model;
        String role = accountService.login(account, request, response);
        if ("".equals(role)) {
            model = new ModelAndView("login");
            model.addObject("account", new Account(account.getUsername()));
            model.addObject("message", "Username or Password is incorrect");
        } else {
            if (role.equals("CUSTOMER")) {
                model = new ModelAndView("redirect:/customer-info");
            } else {
                model = new ModelAndView("redirect:/");
            }
        }
        return model;
    }

    @GetMapping("/change-password")
    public String changePassword() {
        return "changePassword";
    }

    @PostMapping("/change-password")
    public ModelAndView changePasswordSubmit(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("changePassword");
        if (accountService.changePassword(request)) {
            model.addObject("success", "Password has been changed");
        } else {
            model.addObject("fail", "Invalid old password");
        }
        return model;
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        Cookie cookie = new Cookie("LOGGED_IN_USER", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return new ModelAndView("redirect:/");
    }

}
