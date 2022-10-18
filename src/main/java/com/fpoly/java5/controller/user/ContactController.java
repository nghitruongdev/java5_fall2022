package com.fpoly.java5.controller.user;

import com.fpoly.java5.model.MailInfo;
import com.fpoly.java5.repo.UserRepository;
import com.fpoly.java5.service.MailService;
import com.fpoly.java5.service.UserService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/contact")
public class ContactController {

    @Autowired
    MailService mailService;
    @Autowired
    UserService userService;
    @Autowired
    UserRepository repo;

    @RequestMapping
    public String index() {
        return "contact/index";
    }

    @PostMapping("/sent")
    @SneakyThrows
    public String doGetForm(MailInfo mailInfo, Model model) {
        mailService.send(mailInfo);
        model.addAttribute("message", "Email sent successfully");
        return "contact/index";
    }
}
