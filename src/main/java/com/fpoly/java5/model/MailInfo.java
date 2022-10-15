package com.fpoly.java5.model;

import com.fpoly.java5.util.PropertyUtil;
import lombok.*;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MailInfo implements Comparable<MailInfo> {
    String from = PropertyUtil
            .get("application.properties")
            .getProperty("spring.mail.username", "nghitvps19009@fpt.edu.vn");
    String to, subject, body;
    String[] cc, bcc;
    MultipartFile[] attachments;
    Map<String, byte[]> map = new HashMap<>();

    public MailInfo(String to, String subject, String body) {
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

    @SneakyThrows
    public void prepareToSend(MimeMessageHelper helper) {
        helper.setFrom(from);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body);
        helper.setReplyTo(from);

        if (cc != null && cc.length > 0) helper.setCc(cc);
        if (bcc != null && bcc.length > 0) helper.setBcc(bcc);
        map.forEach((name, array) -> addAttachment(name, array, helper));
    }

    @SneakyThrows
    private void addAttachment(String name, byte[] array, MimeMessageHelper helper) {
        helper.addAttachment(name, new ByteArrayResource(array));
    }

    @SneakyThrows
    public void setAttachments(MultipartFile[] attachments) {
        for (MultipartFile attach : attachments) {
            if (!attach.isEmpty() && attach.getSize() > 0) {
                map.put(attach.getOriginalFilename(), attach.getBytes());
            }
        }
    }

    @Override
    public int compareTo(MailInfo o) {
        return 0;
    }
}
