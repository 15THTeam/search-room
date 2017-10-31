package com.searchroom.controller;

import com.searchroom.model.entities.RoomType;
import com.searchroom.repository.RoomTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/roomtype")
public class RoomTypeController {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String showRoomTypeList(Model model) {
        model.addAttribute("roomType", new RoomType());
        model.addAttribute("roomTypeList", roomTypeRepository.getRoomTypeList());
        return "roomType";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
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
        return new ModelAndView("redirect:/roomType");
    }

    @RequestMapping("/edit")
    public String editRoomType(@RequestParam("id") int id, Model model) {
        model.addAttribute("roomType", roomTypeRepository.getRoomTypeById(id));
        model.addAttribute("roomTypeList", roomTypeRepository.getRoomTypeList());
        return "roomType";
    }

    @RequestMapping("/remove")
    public String removeRoomType(@RequestParam("id") int id) {
        roomTypeRepository.deleteRoomType(id);
        return "redirect:/roomType";
    }

}
