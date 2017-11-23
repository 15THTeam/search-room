package com.searchroom.controller;

import com.searchroom.model.entities.Account;
import com.searchroom.model.entities.RoomType;
import com.searchroom.repository.*;
import com.searchroom.service.AccountService;
import com.searchroom.service.AdminService;
import com.searchroom.service.PaginationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
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

    @Autowired
    private AdminService adminService;

    @Autowired
    private PaginationService paginationService;

    @Autowired
    private AccountAndPostRepository accountAndPostRepository;

    @Autowired
    private CustomerRepository customerRepository;

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

    // Controllers for add room types
    @GetMapping("/room-type")
    public String showRoomTypeList(Model model) {
        model.addAttribute("roomType", new RoomType());
        model.addAttribute("roomTypeList", roomTypeRepository.getRoomTypeList());
        return "roomTypes";
    }

    @PostMapping("/room-type/update")
    public ModelAndView addRoomType(@ModelAttribute("roomType")RoomType roomType) {
        adminService.updateRoomType(roomType);
        return new ModelAndView("redirect:/admin/room-type");
    }

    @GetMapping("/room-type/edit")
    public ModelAndView editRoomType(@RequestParam("id") int id) {
        ModelAndView model = new ModelAndView("roomTypes");
        model.addObject("roomType", roomTypeRepository.getRoomTypeById(id));
        model.addObject("roomTypeList", roomTypeRepository.getRoomTypeList());
        return model;
    }

    @GetMapping("/room-type/delete")
    public String removeRoomType(@RequestParam("id") int id) {
        roomTypeRepository.deleteRoomType(id);
        return "redirect:/admin/room-type";
    }

    // Controller for approve room
    @GetMapping("/approve")
    public ModelAndView showApprove(@RequestParam("page") int pageNumber) {
        final int ROOMS_PER_PAGE = 8;

        ModelAndView model = new ModelAndView("approve");
        model.addObject("pageAmount", paginationService.calculatePageAmount(ROOMS_PER_PAGE));
        model.addObject("currentPage", pageNumber);
        model.addObject("postList", postForApproveRepository.getAllPost(pageNumber, ROOMS_PER_PAGE));
        return model;
    }

    @GetMapping("/do-approve")
    public String approveRoom(@RequestParam("page") int page, @RequestParam("id") int id,
                              @RequestParam("approve") int approve) {
        roomPostRepository.approveRoom(id, approve);
        return "redirect:/admin/approve?page=" + page;
    }

    // Controller for manage accounts
    @GetMapping("/manage-accounts")
    public ModelAndView showAccounts() {
        return new ModelAndView("accounts",
                "accountList", accountAndPostRepository.getAllAccountsAndPosts());
    }

    @GetMapping("/edit-role")
    public ModelAndView editRole(@RequestParam("username") String username, @RequestParam("role") String role) {
        adminService.editRole(username, role);
        return new ModelAndView("redirect:/admin/manage-accounts",
                "accountList", accountAndPostRepository.getAllAccountsAndPosts());
    }

    @GetMapping("/delete")
    public ModelAndView deleteAccount(@RequestParam("username") String username) {
        customerRepository.delete(username);
        accountRepository.deleteAccount(username);
        return new ModelAndView("redirect:/admin/manage-accounts",
                "accountList", accountAndPostRepository.getAllAccountsAndPosts());
    }

}
