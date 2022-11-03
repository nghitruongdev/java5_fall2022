package com.fpoly.java5.controller;

import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.service.*;
import com.fpoly.java5.service.LoginService;
import com.fpoly.java5.service.MailService;
import com.fpoly.java5.service.ParamService;
import com.fpoly.java5.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AccountController {

    @Autowired
    LoginService loginService;
    @Autowired
    UserService userService;
    @Autowired
    ParamService paramService;
    @Autowired
    SessionService session;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/account/login")
    public String openLogin(@ModelAttribute User user) {
        return "auth/login";
    }

    @PostMapping("/account/login") // Login
    public String login(Model model, User user) {
        boolean result = loginService.login(user);
        model.addAttribute("message", result ? "Login Thành Công!" : "Login Thất Bại");
        boolean isAdmin = ((User) session.get("loggedInUser").orElse(new User())).isAdmin();
        if (result) {
            String securityUri = (String) session.get("security-uri").orElse("");
            String redirect = "redirect:%s";
            return !securityUri.isEmpty() ? String.format(redirect, securityUri) :
                    isAdmin ? String.format(redirect, "/admin/users") : String.format(redirect, getPreviousPage());
        }
        return "auth/login";
    }

    // Logout -> return to index
    @RequestMapping("/account/logout")
    public String logout() {
        loginService.logout();
        return "redirect:/";
    }

    // Open register form
    @RequestMapping("/account/register")
    public String getRegister(@ModelAttribute("user") User user) {
        return "auth/register";
    }

    // Action register form
    @PostMapping("/account/register")
    public String register(Model model,
                           @Validated @ModelAttribute("user") User user,
                           BindingResult result) {
        // Check if the data entered by the customer exists or not (If existed return to register page)
        if (result.hasErrors()) {
            model.addAttribute("message", "Cannot register! Please enter your information");
            return "/account/register";
        } else {
            model.addAttribute("message", "Are field valid");
        }
        userService.save(user);
        return "redirect:/";

    }


    // Forgot password open form
    @GetMapping("/account/forgot")
    public String forgot() {
        return "forgot";
    }

    // Forgot password, send new random number to client's email
    // If client enters wrong email -> Cannot send
    @PostMapping("/account/forgot")
    public String forgot(@RequestParam("username") String username,
                         Model model, MailService mail) {
        try {
            User user = userService.findByUsername(username);
            String to = user.getEmail();
            String email = to.substring(0, 2);
            double randomDouble = Math.random();
            randomDouble = randomDouble * 100000 + 1;
            int randomInt = (int) randomDouble;

            String subject = "Get your password";
            String body = "Your password is: " + randomInt;
            mail.queue(to, subject, body); // Gui mail lay lai mat khau
            user.setPassword(String.valueOf(randomInt));
            userService.save(user);
            model.addAttribute("message", "Password has been sent to email: " + email);
        } catch (Exception e) {
            model.addAttribute("message", "Invalid Username");
        }
        return "forgot";
    }

    private String getPreviousPage() {
        return request.getHeader("Referer");
    }


}
