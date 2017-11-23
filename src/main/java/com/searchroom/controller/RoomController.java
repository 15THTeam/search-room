package com.searchroom.controller;

import com.searchroom.model.entities.*;
import com.searchroom.model.join.NewPost;
import com.searchroom.repository.*;
import com.searchroom.service.AddressService;
import com.searchroom.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

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
    private AddressRepository addressRepository;

    @Autowired
    private RoomInfoRepository roomInfoRepository;

    @Autowired
    private RoomPostRepository roomPostRepository;

    @Autowired
    private RoomService roomService;

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private ResourceRepository resourceRepository;

    @Autowired
    private NewPostRepository newPostRepository;

    @GetMapping
    public ModelAndView showPagedPost(@RequestParam("page") int pageNumber) {
        final int ROOMS_PER_PAGE = 8;

        ModelAndView model = new ModelAndView("rooms");
        model.addObject("pageAmount",
                Math.ceil(roomPostRepository.getPostAmount() * 1.0 / ROOMS_PER_PAGE));
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
            mav = addRoom(mav, newPost, request, addressObject);
        } else {
            mav = updateRoom(mav, newPost, addressObject);
        }

        return mav;
    }

    private ModelAndView addRoom(ModelAndView mav, NewPost newPost, HttpServletRequest request, Address address)
            throws SQLException {
        int addressId = addressRepository.addAddress(address);

        RoomInfo roomInfo = new RoomInfo(newPost.getTitle(), newPost.getArea(), newPost.getPrice(),
                newPost.getDescription(), addressId, newPost.getTypeId());
        int roomInfoId = roomInfoRepository.addRoomInfo(roomInfo);

        Account loggedInUser = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        Customer customer = customerRepository.getCustomerByUsername(loggedInUser.getUsername());
        RoomPost roomPost = new RoomPost(customer.getId(), roomInfoId);
        roomPostRepository.addRoomPost(roomPost);

        roomService.uploadFile(request, roomInfoId);

        mav.addObject("message", "Add new room succeed");
        return mav;
    }

    private ModelAndView updateRoom(ModelAndView mav, NewPost newPost, Address address) {
        int roomInfoId = roomPostRepository.getInfoId(newPost.getPostId());
        RoomInfo info = new RoomInfo(roomInfoId, newPost.getTitle(), newPost.getArea(), newPost.getPrice(),
                newPost.getDescription(), newPost.getTypeId());
        roomInfoRepository.updateRoomInfo(info);

        address.setId(roomInfoRepository.getAddressId(roomInfoId));
        addressRepository.updateAddress(address);

        mav.addObject("message", "Update succeed");
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
        int infoId = roomPostRepository.getInfoId(postId);
        int resourceId = resourceRepository.getId(infoId);
        int addressId = roomInfoRepository.getAddressId(infoId);

        resourceRepository.deleteResource(resourceId);
        roomPostRepository.deleteRoomPost(postId);
        roomInfoRepository.deleteRoomInfo(infoId);
        addressRepository.deleteAddress(addressId);

        Account account = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        redirectAttributes.addFlashAttribute("message", "Deleted post successfully");

        if (account.getRole().equals("CUSTOMER")) {
            return "redirect:/customer-posts?user=" + account.getUsername() + "&page=" + page;
        } else {
            return "redirect:/admin/approve?page=" + page;
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
