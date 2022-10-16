package com.fpoly.java5.controller;

import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.repo.UserRepository;
import com.fpoly.java5.service.LoginService;
import com.fpoly.java5.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class AccountController {

    @Autowired
    LoginService loginService;
    @Autowired
    UserService userService;

    @PostMapping("/account/login") // Login
    public String login(Model model, User user, SessionService session) {
        boolean result = loginService.login(user);
        model.addAttribute("message", result ? "Login Thành Công!" : "Login Thất Bại");
        return result ?
                ((User) session.get("loggedInUser")).isAdmin() ?
                        "redirect:/admin" :
                        "redirect:/" :
                "redirect:/";
    }

    // Logout -> return to index
    @RequestMapping("/account/logout")
    public String logout() {
        loginService.logout();
        return "redirect:/";
    }

    // Open register form
    @RequestMapping("/account/register")
    public String getRegister() {
        return "auth/register";
    }

    // Action register form
    @PostMapping("/account/register")
    public String register(@ModelAttribute User user, Model model) {
    public String doGetRegister(Model model,
                                @ModelAttribute @Valid User user,
                                BindingResult result) {
        // Check if the data entered by the customer exists or not (If existed return to register page)
        if (userService.isUserExist(user)) {
            model.addAttribute("error", "User already existed");
            return "auth/register";
        }
        // If not existed, save user -> return to login to continue login
        else {
            userService.save(user);
            model.addAttribute("message", "Sign Up Success");
            return "redirect:/";
        }
        if (result.hasErrors()) {
            model.addAttribute("message", "Cannot register! Please enter your information");
            return "redirect:/account/register";
        } else {
            model.addAttribute("message", "Are field valid");
        }
        repo.save(user);
        return "redirect:/";

    }


    // Forgot password open form
    @GetMapping("/account/forgotPassword")
    public String forgot() {
        return "forgot";
    }

    // Forgot password, send new random number to client's email
    // If client enters wrong email -> Cannot send
    @PostMapping("/account/forgotPassword")
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

}
