package com.searchroom.controller;

import com.searchroom.model.entities.Account;
import com.searchroom.model.entities.Customer;
import com.searchroom.repository.CustomerRepository;
import com.searchroom.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private NewsRepository newsRepository;

    @RequestMapping(value = "/customer-info", method = RequestMethod.GET)
    public ModelAndView showInfo(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("customerInfo");

        Account loggedInUser = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        Customer customer = customerRepository.getCustomerByUsername(loggedInUser.getUsername());
        if (customer == null) {
            customer = new Customer();
            customer.setUsername(loggedInUser.getUsername());
            mav.addObject("notification", "Please complete your information to post news");
        }

        mav.addObject("customer", customer);
        return mav;
    }

    @RequestMapping(value = "/customer-info", method = RequestMethod.POST)
    public ModelAndView addCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult result) {
        ModelAndView mav = new ModelAndView("customerInfo");
        if (result.hasErrors()) {
            mav.addObject("customer", customer);
            return mav;
        }

        if (customer.getId() == 0) {
            customerRepository.addCustomer(customer);
        } else {
            customerRepository.updateCustomer(customer);
        }
        mav.addObject("notification", "Update info successfully");
        return mav;
    }

    @RequestMapping(value = "/customer-posts")
    public ModelAndView getCustomerPosts(@RequestParam String user) {
        ModelAndView mav = new ModelAndView("customerPost");
        if (customerRepository.getCustomerByUsername(user) == null) {
            return mav;
        }

        int customerId = customerRepository.getCustomerByUsername(user).getId();
        mav.addObject("postList", newsRepository.getCustomerPosts(customerId));
        return mav;
    }

}
