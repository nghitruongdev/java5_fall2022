package com.fpoly.java5.controller;

import com.fpoly.java5.model.entity.Account;
import com.fpoly.java5.repo.AccountRepository;
import com.fpoly.java5.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

    @Autowired
    SessionService session;

    @Autowired
    AccountRepository accountRepo;

    @GetMapping("/account/login")
    public String login() {
        return "account/login";
    }

    @PostMapping("/account/login")
    public String doLogin(Account user, Model model) {
        String message = "";
        Account userDB = accountRepo.findById(user.getUsername()).orElse(null);
        if (userDB == null) {
            message = "Invalid username";
        } else if (!userDB.getPassword().equals(user.getPassword())) {
            message = "Invalid password";
        } else {
            session.add("user", userDB);
            String uri = session.get("security-uri");
            if (uri != null) {
                session.remove("security-uri");
                return "redirect:" + uri;
            } else message = "Login success!";
        }
        model.addAttribute("message", message);

        return "account/login";
    }

    @RequestMapping("/logout")
    public String logout() {
        session.remove("user");
        return "mail/mail_form";
    }

}
