package com.searchroom.controller.admin;

import com.searchroom.model.entities.RoomType;
import com.searchroom.repository.RoomTypeRepository;
import com.searchroom.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class RoomTypeController {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private AdminService adminService;

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

}
