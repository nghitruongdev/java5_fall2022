package com.fpoly.java5.controller;

import com.fpoly.java5.entity.User;
import com.fpoly.java5.repo.UserRepository;
import com.fpoly.java5.service.LoginService;
import com.fpoly.java5.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AccountController {

    @Autowired
    LoginService loginService;
    @Autowired
    UserRepository repo;
    @Autowired
    UserService userService;




    // Open login form
    @RequestMapping("/account/login")
    public String getLogin() {
        return "login_form";
    }


    // Login form
    // If user is admin redirect to admin page
    // If user is normal user redirect to user page
    @PostMapping("/account/login") // Login
    public String doGetLogin(Model model) {
        boolean result = loginService.login();
        model.addAttribute("message", result ? "Login Thành Công!" : "Login Thất Bại");
        return loginService.getAdmin() ?
                "redirect:/admin" :
                "redirect:/user";

    }

    // Logout -> return to index
    @RequestMapping("/account/logout")
    public String logout() {
        loginService.logout();
        return "redirect:/";
    }

    // Open Register form
//    @GetMapping("/account/register")
//    public String doGetRegister(WebRequest request, Model model) {
//        UserDto userDto = new UserDto(); // creates the new UserDto object, which backs the registration form, binds it, and returns
//        model.addAttribute("user", userDto);
//        return "register";
//    }
//
//    @PostMapping("/account/register")
//    public ModelAndView registerUserAccount(@ModelAttribute("model") @Valid UserDto userDto,
//                                            HttpServletRequest request,
//                                            Errors errors,
//                                            ModelAndView mv) {
//        try {
//            User registered = userService.registerNewUserAccount(userDto);
//        } catch (Exception uaeEx) {
//            mv.addObject("message", "An account for that username/email already exists.");
//            return mv;
//        }
//        // return registered user - successRegister view
//        return new ModelAndView("successRegister", "user", userDto);
//
//    }


    // Open register form
    @GetMapping("/account/register")
    public String getRegister() {
        return "register";
    }

    // Action register form
    @PostMapping("/account/register")
    public String doGetRegister(@ModelAttribute User user, Model model) {
        // Check if the data entered by the customer exists or not (If existed return to register page)
        if (userService.isUserExist(user)) {
            model.addAttribute("error", "User already existed");
            return "redirect:/register";
        }
        // If not existed, save user -> return to login to continue login
        else {
            repo.save(user);
            model.addAttribute("message", "Sign Up Success");
            return "redirect:/account/login";
        }
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
                         Model model) {
        try {
            User user = repo.findByUsername(username);
            String to = user.getEmail();
            String email = to.substring(0, 2);
            double randomDouble = Math.random();
            randomDouble = randomDouble * 100000 + 1;
            int randomInt = (int) randomDouble;

            String subject = "Get your password";
            String body = "Your password is: " + randomInt;
//            mail.send(to, subject, body); // Gui mail lay lai mat khau
            user.setPassword(String.valueOf(randomInt));
            repo.save(user);
            model.addAttribute("message", "Password has been sent to email: " + email);
        } catch (Exception e) {
            model.addAttribute("message", "Invalid Username");
        }
        return "forgot";
    }

}
