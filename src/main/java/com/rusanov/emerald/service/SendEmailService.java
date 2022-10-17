package com.rusanov.emerald.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class SendEmailService {

    @Autowired
    private MailSender mailSender;

    public void sendMail(String message, String email) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("Woolfmen77@gmail.com");
        msg.setTo(email);
        msg.setSubject("Для подтверждения почтового адреса, пройдите пожалуйста по ссылке.");
        msg.setText(message);
        mailSender.send(msg);
    }
}