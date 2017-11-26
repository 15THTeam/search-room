package com.searchroom.controller.admin;

import com.searchroom.repository.PostForApproveRepository;
import com.searchroom.repository.RoomPostRepository;
import com.searchroom.service.PaginationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class ApproveRoomController {

    @Autowired
    private PaginationService paginationService;

    @Autowired
    private PostForApproveRepository postForApproveRepository;

    @Autowired
    private RoomPostRepository roomPostRepository;

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

}
