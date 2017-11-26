package com.searchroom.controller.admin;

import com.searchroom.model.entities.Account;
import com.searchroom.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/login")
    public ModelAndView showLoginPage() {
        return new ModelAndView("adminLogin", "account", new Account());
    }

    @PostMapping("/login")
    public ModelAndView loginSubmit(@Valid @ModelAttribute("account") Account account, BindingResult result,
                                    HttpServletRequest request, HttpServletResponse response,
                                    final RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return new ModelAndView("adminLogin");
        }

        ModelAndView model;
        String role = accountService.login(account, request, response);
        if ("".equals(role)) {
            redirectAttributes.addFlashAttribute("message", "Username or Password is incorrect");
            model = new ModelAndView("redirect:/admin/login");
        } else {
            if (role.equals("ADMIN")) {
                model = new ModelAndView("redirect:/admin/room-type");
            } else {
                model = new ModelAndView("redirect:/");
            }
        }
        return model;
    }

    @GetMapping
    public String showAdminPage() {
        return "redirect:/admin/room-type";
    }

}
