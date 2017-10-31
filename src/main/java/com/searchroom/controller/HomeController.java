package com.searchroom.controller;

import com.searchroom.repository.NewsRepository;
import com.searchroom.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class HomeController {

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = { "/", "/index", "/home" })
    public ModelAndView home() {
        return new ModelAndView("home", "postNewsList", newsRepository.getNewestPost());
    }

    @RequestMapping(value = "/image/{imageName}")
    @ResponseBody
    public byte[] getImage(@PathVariable(value = "imageName")String imageName) throws IOException {
        return roomService.getImage(imageName);
    }

}
