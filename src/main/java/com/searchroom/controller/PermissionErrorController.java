package com.searchroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PermissionErrorController {

    @RequestMapping(value = "/permissionError")
    public String showErrorPage() {
        return "permissionError";
    }

}
