package com.searchroom.controller;

import com.searchroom.model.entities.Account;
import com.searchroom.model.entities.Customer;
import com.searchroom.repository.CustomerRepository;
import com.searchroom.repository.NewsRepository;
import com.searchroom.repository.RoomPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomerController {

    @Autowired private CustomerRepository customerRepository;

    @Autowired private NewsRepository newsRepository;

    @Autowired private RoomPostRepository roomPostRepository;

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
    public ModelAndView addCustomer(@ModelAttribute("customer") Customer customer) {
        ModelAndView mav = new ModelAndView("customerInfo");
        if (customer.getId() == 0) {
            customerRepository.addCustomer(customer);
        } else {
            customerRepository.updateCustomer(customer);
        }
        mav.addObject("notification", "Update info successfully");
        return mav;
    }

    @RequestMapping(value = "/customer-posts")
    public ModelAndView getCustomerPosts(@RequestParam String user, @RequestParam("page") int pageNumber) {
        ModelAndView model = new ModelAndView("customerPost");
        if (customerRepository.getCustomerByUsername(user) == null) {
            return model;
        }

        int customerId = customerRepository.getCustomerByUsername(user).getId();
        final int ROOMS_PER_PAGE = 8;

        model.addObject("pageAmount",
                Math.ceil(roomPostRepository.getPostAmountByCustomer(customerId) * 1.0 / ROOMS_PER_PAGE));
        model.addObject("currentPage", pageNumber);
        model.addObject("user", user);
        model.addObject("postList", newsRepository.getCustomerPosts(customerId, pageNumber, ROOMS_PER_PAGE));
        return model;
    }

}
