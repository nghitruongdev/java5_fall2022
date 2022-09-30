package com.fpoly.java5.controller;

import com.fpoly.java5.entity.User;
import com.fpoly.java5.service.CookieService;
import com.fpoly.java5.service.LoginService;
import com.fpoly.java5.service.ParamService;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    LoginService loginService;

    @GetMapping("/login")
    public String login1(Model model) {
        User saveUser = loginService.getSaveUser();
        model.addAttribute("user", saveUser);
        return "login";
    }

    @PostMapping("/login")
    public String login2(Model model) {
        boolean result = loginService.login();
        model.addAttribute("message", result ? "Login Thành Công!" : "Login Thất Bại");
        return "";
    }

    @RequestMapping("/logout")
    public String logout(){
        loginService.logout();
        return "";
    }


}
