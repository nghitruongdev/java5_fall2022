package com.fpoly.java5.controller;

import com.fpoly.java5.service.CookieService;
import com.fpoly.java5.service.ParamService;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AccountController {
    @Autowired ParamService paramService;
    @Autowired CookieService cookieService;
    @Autowired SessionService sessionService;

    @GetMapping("/account/login")
    public String login1() {
    return "/account/login";
    }

    @PostMapping("/account/login")
    public String login2(){
        String un = paramService.getString("username", "");
        String pw = paramService.getString("password", "");
        boolean rm = paramService.getBoolean("remember", false);
        return "/account/login";
    }

}
