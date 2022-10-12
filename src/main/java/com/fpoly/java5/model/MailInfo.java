package com.fpoly.java5.model;

import com.fpoly.java5.util.PropertyUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import java.io.File;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo implements Comparable<MailInfo> {
    String from = PropertyUtil
            .get("application.properties")
            .getProperty("spring.mail.username", "nghitvps19009@fpt.edu.vn");
    String to, subject, body;
    String[] cc, bcc, attachments;

    public MailInfo(String to, String subject, String body) {
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

    public void prepareToSend(MimeMessageHelper helper) throws MessagingException {
        helper.setFrom(from);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body);
        helper.setReplyTo(from);

        if (cc != null && cc.length > 0) helper.setCc(cc);
        if (bcc != null && bcc.length > 0) helper.setBcc(bcc);
        if (attachments != null && attachments.length > 0) {
            for (String filePath : attachments) {
                File file = new File(filePath);
                helper.addAttachment(file.getName(), file);
            }
        }
    }

    @Override
    public int compareTo(MailInfo o) {
        return 0;
    }
}
