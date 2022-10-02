package com.fpoly.java5.controller;

import com.fpoly.java5.entity.User;
import com.fpoly.java5.service.*;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    LoginService loginService;

    @GetMapping("/login")
    @ResponseBody
    public User login1(Model model) {
        User saveUser = loginService.getSaveUser();
        model.addAttribute("user", saveUser);
        return saveUser;
    }

    @PostMapping("/login")
    public String login2(Model model) {
        boolean result = loginService.login();
        model.addAttribute("message", result ? "Login Thành Công!" : "Login Thất Bại");
        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout() {
        loginService.logout();
        return "redirect:/";
    }


}
