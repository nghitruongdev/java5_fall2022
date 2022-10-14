package com.fpoly.java5.controller;

import com.fpoly.java5.model.MailInfo;
import com.fpoly.java5.service.MailService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;

@Controller
public class MailController {
    @Autowired
    MailService mailService;

    @SneakyThrows
    @RequestMapping("/mail")
    public String openForm() {
        return "mail/mail_form";
    }

    @PostMapping("/mail/send")
    public String sendMail(MailInfo mail, Model model) {
        mailService.send(mail);
        model.addAttribute("message", "Đã gửi email thành công!");
        return "mail/mail_form";
    }
    @PostMapping("/mail/queue")
    public String sendLater(MailInfo mail, Model model) {
        mailService.queue(mail);
        model.addAttribute("message", "Mail của bạn sẽ được gửi trong giây lát!");
        return "mail/mail_form";
    }
}
