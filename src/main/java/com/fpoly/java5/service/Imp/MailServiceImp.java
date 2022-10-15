package com.fpoly.java5.service.Imp;

import com.fpoly.java5.entity.MailInfo;
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
    JavaMailSender sender;

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
//    @Autowired
//    JavaMailSender mailSender;
//
//    @Override
//    public void send(MailInfo mail) throws MessagingException {
//        MimeMessage message = mailSender.createMimeMessage(); // Create Message
//
//        // Sử dụng Helper để thiết lập các thông tin cần thiết cho message
//        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//        helper.setFrom(mail.getFrom());
//        helper.setTo(mail.getTo());
//        helper.setSubject(mail.getSubject());
//        helper.setText(mail.getBody(), true);
//        helper.setReplyTo(mail.getFrom());
//
//        String[] cc = mail.getCc();
//        if (cc != null && cc.length > 0) {
//            helper.setCc(cc);
//        }
//
//        String[] bcc = mail.getBcc();
//        if (bcc != null && bcc.length > 0) {
//            helper.setBcc(bcc);
//        }
//        String[] attachments = mail.getAttachments();
//        if (attachments != null && attachments.length > 0) {
//            for (String path : attachments) {
//                File file = new File(path);
//                helper.addAttachment(file.getName(), file);
//            }
//        }
//
//        mailSender.send(message);
//    }
//
//    @Override
//    public void send(String to, String subject, String body) throws MessagingException {
//        this.send(new MailInfo(to, subject, body));
//    }
//
//    List<MailInfo> list = new ArrayList<>();
//
//    @Override
//    public void queue(MailInfo mail) {
//        list.add(mail);
//    }
//
//    @Override
//    public void queue(String to, String subject, String body) {
//        queue(new MailInfo(to, subject, body));
//    }
//
//    @Scheduled(fixedDelay = 5000)
//    public void run() {
//        while(!list.isEmpty()) {
//            MailInfo mail = list.remove(0);
//            try {
//                this.send(mail);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//    }
}
