package com.searchroom.controller;

import com.searchroom.model.entities.Account;
import com.searchroom.model.entities.RoomType;
import com.searchroom.repository.*;
import com.searchroom.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private PostForApproveRepository postForApproveRepository;

    @Autowired
    private RoomPostRepository roomPostRepository;

    @RequestMapping(value = "/login")
    public ModelAndView showLoginPage() {
        return new ModelAndView("adminLogin", "account", new Account());
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@Valid @ModelAttribute("account") Account account,
                                    BindingResult result, HttpServletRequest request, HttpServletResponse response) {
        if (result.hasErrors()) {
            return new ModelAndView("adminLogin");
        }

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
                model = new ModelAndView("redirect:/");
            } else {
                model = new ModelAndView("redirect:/admin/room-type");
            }
        } else {
            model = new ModelAndView("login",
                    "message", "Username or Password is incorrect");
        }

        return model;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String showAdminPage() {
        return "redirect:/admin/room-type";
    }

    // Controllers for add room types
    @RequestMapping(value = "/room-type", method = RequestMethod.GET)
    public String showRoomTypeList(Model model) {
        model.addAttribute("roomType", new RoomType());
        model.addAttribute("roomTypeList", roomTypeRepository.getRoomTypeList());
        return "roomTypes";
    }

    @RequestMapping(value = "/room-type/update", method = RequestMethod.POST)
    public ModelAndView addRoomType(@Valid @ModelAttribute("roomType")RoomType roomType, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("roomType",
                    "roomTypeList", roomTypeRepository.getRoomTypeList());
        }

        if (roomType.getId() == 0) {
            roomTypeRepository.addRoomType(roomType.getDescription());
        } else {
            roomTypeRepository.updateRoomType(roomType);
        }
        return new ModelAndView("redirect:/admin/room-type");
    }

    @RequestMapping(value = "/room-type/edit")
    public ModelAndView editRoomType(@RequestParam("id") int id) {
        ModelAndView model = new ModelAndView("roomTypes");
        model.addObject("roomType", roomTypeRepository.getRoomTypeById(id));
        model.addObject("roomTypeList", roomTypeRepository.getRoomTypeList());
        return model;
    }

    @RequestMapping(value = "/room-type/delete")
    public String removeRoomType(@RequestParam("id") int id) {
        roomTypeRepository.deleteRoomType(id);
        return "redirect:/admin/room-type";
    }

    // Controller for approve room
    @RequestMapping(value = "/approve")
    public ModelAndView showApprove() {
        return new ModelAndView("approve", "postList", postForApproveRepository.getAllPost());
    }

    @RequestMapping(value = "/do-approve")
    public String approveRoom(@RequestParam("id") int id, @RequestParam("approve") int approve) {
        roomPostRepository.approveRoom(id, approve);
        return "redirect:/admin/approve";
    }

    // Controller for manage accounts
    @RequestMapping(value = "/manage-accounts")
    public ModelAndView showAccounts() {
        ModelAndView model = new ModelAndView("accounts");
        model.addObject("account", new Account());
        model.addObject("accountList", accountRepository.getAllAccounts());
        return model;
    }

    @RequestMapping(value = "/edit-role")
    public ModelAndView editRole(@RequestParam("username") String username, @RequestParam("role") String role) {
        if (!"".equals(username) && !"".equals(role)) {
            if ("CUSTOMER".equals(role)) {
                role = "ADMIN";
            } else {
                role = "CUSTOMER";
            }
            accountRepository.editRole(username, role);
        }

        return new ModelAndView("redirect:/admin/manage-accounts",
                "accountList", accountRepository.getAllAccounts());
    }

    @RequestMapping(value = "/delete")
    public ModelAndView deleteAccount(@RequestParam("username") String username) {
        accountRepository.deleteAccount(username);
        return new ModelAndView("redirect:/admin/manage-accounts",
                "accountList", accountRepository.getAllAccounts());
    }

}
