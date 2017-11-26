package com.searchroom.controller.app;

import com.searchroom.model.entities.*;
import com.searchroom.model.join.NewPost;
import com.searchroom.repository.*;
import com.searchroom.service.AddressService;
import com.searchroom.service.PaginationService;
import com.searchroom.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/rooms")
public class RoomController {

    @Autowired
    private AddressService addressService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private RoomService roomService;

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private NewPostRepository newPostRepository;

    @Autowired
    private PaginationService paginationService;

    @Autowired
    private RoomPostRepository roomPostRepository;

    @GetMapping
    public ModelAndView showPagedPost(@RequestParam("page") int pageNumber) {
        final int ROOMS_PER_PAGE = 8;

        ModelAndView model = new ModelAndView("rooms");
        model.addObject("pageAmount", paginationService.calculatePageAmount(ROOMS_PER_PAGE));
        model.addObject("currentPage", pageNumber);
        model.addObject("postList", newsRepository.getPostForRoomsPage(pageNumber, ROOMS_PER_PAGE));
        return model;
    }

    @GetMapping("/update")
    public ModelAndView showPostPage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("post");

        Account loggedInUser = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        Customer customerInfo = customerRepository.getCustomerByUsername(loggedInUser.getUsername());
        if (customerInfo == null) {
            mav.addObject("cusInfoMess", "Please complete your information before post new room");
        } else {
            mav.addObject("post", new NewPost());
            mav.addObject("roomTypeList", roomTypeRepository.getRoomTypeList());
        }

        return mav;
    }

    @PostMapping("/update")
    public ModelAndView addOrUpdate(@ModelAttribute("post") NewPost newPost, HttpServletRequest request)
            throws SQLException {
        ModelAndView mav = new ModelAndView("post");
        mav.addObject("roomTypeList", roomTypeRepository.getRoomTypeList());

        Address addressObject;
        try {
            addressObject = addressService.getLatLngByAddress(newPost.getAddress());
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "Unknown error, please try again");
            return mav;
        }

        if (newPost.getPostId() == 0) {
            roomService.addRoom(newPost, request, addressObject);
            mav.addObject("message", "Add new room succeed");
        } else {
            roomService.updateRoom(newPost, addressObject);
            mav.addObject("message", "Update succeed");
        }

        return mav;
    }

    @GetMapping("/edit")
    public ModelAndView editRoomPost(@RequestParam("post-id") int postId) {
        ModelAndView mav = new ModelAndView("post");
        mav.addObject("post", newPostRepository.getNewPostByPostId(postId));
        mav.addObject("roomTypeList", roomTypeRepository.getRoomTypeList());
        return mav;
    }

    @GetMapping("/delete")
    public String deleteRoomPost(@RequestParam("page") int page, @RequestParam("post-id") int postId,
                                 HttpServletRequest request, final RedirectAttributes redirectAttributes) {
        Account account = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        if (account.getRole().equals("ADMIN")) {
            roomService.deleteRoomPost(postId);
            return "redirect:/admin/approve?page=" + page;
        } else {
            List<Integer> postIdList = roomPostRepository.getPostIdByUsername(account.getUsername());
            if (postIdList.contains(postId)) {
                roomService.deleteRoomPost(postId);
                redirectAttributes.addFlashAttribute("message", "Deleted post successfully");
            } else {
                return "redirect:/";
            }
            return "redirect:/customer-posts?user=" + account.getUsername() + "&page=" + page;
        }
    }

    @GetMapping("/search")
    public ModelAndView search(HttpServletRequest request) {
        if (request.getParameter("search") == null) {
            return new ModelAndView("redirect:/");
        }
        ModelAndView mav = new ModelAndView("rooms");
        mav.addObject("message", "Search result");
        mav.addObject("postList", newsRepository.getNewForSearch(request.getParameter("search")));
        return mav;
    }

}
