package com.searchroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PermissionErrorController {

    @GetMapping("/permissionError")
    public String showErrorPage() {
        return "permissionError";
    }

}
