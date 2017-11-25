package com.searchroom.controller;

import com.searchroom.model.join.PostOnMap;
import com.searchroom.repository.NewsRepository;
import com.searchroom.repository.PostOnMapRepository;
import com.searchroom.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private RoomService roomService;

    @Autowired
    private PostOnMapRepository postOnMapRepository;

    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView model = new ModelAndView("home");
        model.addObject("postNewsList", newsRepository.getNewestPost());
        return model;
    }

    @GetMapping("/get-markers")
    public @ResponseBody List<PostOnMap> getMarkers() {
        return postOnMapRepository.getPostToMap();
    }

    @GetMapping("/image/{imageName}")
    @ResponseBody
    public byte[] getImage(@PathVariable(value = "imageName")String imageName) throws IOException {
        return roomService.getImage(imageName);
    }

}
