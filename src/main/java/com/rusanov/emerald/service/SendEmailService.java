package com.rusanov.emerald.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class    SendEmailService {

    @Autowired
    private MailSender mailSender;

    public void sendMail(String message) {

        SimpleMailMessage msg = new SimpleMailMessage();

        msg.setFrom("Woolfmen77@gmail.com");
        msg.setTo("rusanov_zhen@mail.ru");
        msg.setSubject("Для подтверждения почтового адреса, пройтите пожалуйста по ссылке.");
        msg.setText(message);

        mailSender.send(msg);

    }
}
