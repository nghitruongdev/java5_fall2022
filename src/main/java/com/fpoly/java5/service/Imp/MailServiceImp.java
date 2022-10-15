package com.fpoly.java5.service.Imp;

import com.fpoly.java5.model.MailInfo;
import com.fpoly.java5.service.MailService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.PriorityQueue;
import java.util.Queue;

@Service
public class MailServiceImp implements MailService {
    Queue<MailInfo> queue = new PriorityQueue<>();

    @Autowired
    JavaMailSender sender; //remember to check application.properties

    @Override
    public void send(MailInfo mail) {
        MimeMessagePreparator preparator = (mimeMessage) -> {
            MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            mail.prepareToSend(message);
        };

        sender.send(preparator);
    }

    @Override
    public void send(String to, String subject, String body) {
        send(new MailInfo(to, subject, body));
    }

    @Override
    public void queue(MailInfo mail) {
        queue.offer(mail);
    }

    @Override
    public void queue(String to, String subject, String body) {
        queue(new MailInfo(to, subject, body));
    }

    @Scheduled(fixedDelay = 5000)
    @SneakyThrows
    public void run() {
        while (!queue.isEmpty()) send(queue.poll());
    }
}
