package com.fpoly.java5.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contact")
public class ContactController {
    @RequestMapping
    public String index() {
        return "contact/index";
    }
}
