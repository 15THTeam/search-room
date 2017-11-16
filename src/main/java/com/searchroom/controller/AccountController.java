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

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView showRegisterForm() {
        return new ModelAndView("register", "account", new Account());
    }

    @RequestMapping(value = "/check-username-duplicate", method = RequestMethod.GET)
    public @ResponseBody String checkUsernameDuplicate(@RequestParam("username") String username) {
        return accountRepository.getAccountByUsername(username) == null ? "OK" : "duplicate";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView registerSubmit(@ModelAttribute("account")Account account) {
        account.setPassword(accountService.md5Hash(account.getPassword()));
        account.setRole("CUSTOMER");
        accountRepository.addAccount(account);
        ModelAndView mav = new ModelAndView("register");
        mav.addObject("account", new Account());
        mav.addObject("notification", "Create account successfully");
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView showLoginForm() {
        return new ModelAndView("login", "account", new Account());
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@ModelAttribute("account")Account account,
                                    HttpServletRequest request, HttpServletResponse response) {
        ModelAndView model;
        String hashedPassword = accountService.md5Hash(account.getPassword());
        account.setPassword(hashedPassword);
        Account loggedInAccount = accountRepository.getAccount(account);

        if (loggedInAccount != null) {
            request.getSession().setAttribute("LOGGED_IN_USER", loggedInAccount);

            boolean isRemember = "Y".equals(request.getParameter("remember-me"));
            if (isRemember) {
                Cookie cookie = new Cookie("LOGGED_IN_USER", loggedInAccount.getUsername());
                cookie.setMaxAge(24*60*60); // 1 day
                response.addCookie(cookie);
            }

            if (loggedInAccount.getRole().equals("CUSTOMER")) {
                model = new ModelAndView("redirect:/customer-info");
            } else {
                model = new ModelAndView("redirect:/");
            }
        } else {
            model = new ModelAndView("login");
            model.addObject("account", new Account(account.getUsername()));
            model.addObject("message", "Username or Password is incorrect");
        }

        return model;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        Cookie cookie = new Cookie("LOGGED_IN_USER", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return new ModelAndView("redirect:/");
    }

}
