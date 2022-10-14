package com.fpoly.java5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    @RequestMapping("/admin/*")
    @ResponseBody
    public String openAdmin(HttpServletRequest request) {
        return "Đây là trang " + request.getRequestURI();
    }

}
