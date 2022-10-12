package com.fpoly.java5.controller;

import com.fpoly.java5.service.MailService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {
    @Autowired
    MailService mailService;


    @SneakyThrows
    @RequestMapping("/mail")
    @ResponseBody
    public String home() {
        mailService.queue("nghitvps19009@fpt.edu.vn", "Hello Nghi", "I come from Java Application!");
        return "Mail của bạn sẽ được gửi trong giây lát";
    }
}
