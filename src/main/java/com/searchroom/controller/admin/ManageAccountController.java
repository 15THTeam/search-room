package com.searchroom.controller.admin;

import com.searchroom.model.entities.Account;
import com.searchroom.repository.AccountAndPostRepository;
import com.searchroom.repository.AccountRepository;
import com.searchroom.repository.CustomerRepository;
import com.searchroom.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class ManageAccountController {

    @Autowired
    private AccountAndPostRepository accountAndPostRepository;

    @Autowired
    private AccountService accountService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/manage-accounts")
    public ModelAndView showAccounts() {
        return new ModelAndView("accounts",
                "accountList", accountAndPostRepository.getAllAccountsAndPosts());
    }

    @PostMapping("/add-admin-account")
    public String addAdminAccount(HttpServletRequest request, final RedirectAttributes redirectAttributes) {
        String username = request.getParameter("username");
        if (accountService.checkUsernameDuplicate(username)) {
            redirectAttributes.addFlashAttribute("duplicate", "duplicate username");
        } else {
            Account newAccount = new Account(username, "admin", "ADMIN");
            accountService.saveAccount(newAccount);
            redirectAttributes.addFlashAttribute("success", "add account success");
        }

        return "redirect:/admin/manage-accounts";
    }

    @GetMapping("/delete")
    public ModelAndView deleteAccount(@RequestParam("username") String username) {
        customerRepository.delete(username);
        accountRepository.deleteAccount(username);
        return new ModelAndView("redirect:/admin/manage-accounts",
                "accountList", accountAndPostRepository.getAllAccountsAndPosts());
    }

}
