package com.fpoly.java5.controller;

import com.fpoly.java5.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    LoginService loginService;

    @RequestMapping("/login")
    public String getLogin() {
        return "login";
    }


    @PostMapping("/login")
    public String doGetLogin(Model model) {
        boolean result = loginService.login();
        if (loginService.)
        model.addAttribute("message", result ? "Login Thành Công!" : "Login Thất Bại");
        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout() {
        loginService.logout();
        return "redirect:/";
    }




}
