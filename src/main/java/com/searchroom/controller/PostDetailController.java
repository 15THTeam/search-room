package com.searchroom.controller;

import com.searchroom.exception.RoomNotFoundException;
import com.searchroom.model.join.PostDetail;
import com.searchroom.repository.PostDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PostDetailController {

    @Autowired
    private PostDetailRepository postDetailRepository;

    @RequestMapping(value = "/detail")
    public ModelAndView showDetailPage(@RequestParam("post-id") int postId) {
        PostDetail detail = postDetailRepository.getPostDetail(postId);
        if (detail == null) {
            throw new RoomNotFoundException();
        }
        return new ModelAndView("detail", "postDetail", detail);
    }

    @ExceptionHandler(RoomNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handleRoomNotFoundException() {
        return new ModelAndView("exception", "message", "Room is not exist");
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/saveRoom/{postId}")
    public String saveRoomPost(@PathVariable(value = "postId")int postId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<PostDetail> postDetails = (List<PostDetail>) session.getAttribute("savePosts");
        if (postDetails == null) {
            postDetails = new ArrayList<>();
        }
        postDetails.add(postDetailRepository.getPostToSave(postId));
        session.setAttribute("savedPosts", postDetails);
        return "redirect:/detail/" + postId;
    }

}
