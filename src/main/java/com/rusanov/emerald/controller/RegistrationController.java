//package com.rusanov.emerald.controller;
//
//import com.rusanov.emerald.entity.User;
//import com.rusanov.emerald.service.MyDateService;
//import com.rusanov.emerald.service.SendEmailService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.UUID;
//
//@Controller
//public class RegistrationController {
//
//    @Autowired
//    SendEmailService sendEmail;
//
//    @Autowired
//    public MyRepository myRepository;
//
//    @GetMapping("/reg")
//    public String registform(){
//        return "/reg";
//    }
//
//
//    @PostMapping("/reg")
//    public ModelAndView gisterUser (@ModelAttribute("user") User user, HttpServletRequest request){
//// кодируем пароль перед сохранением в БД
//        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//        user.setPassword(encoder.encode(user.getPassword()));
//// создаем калькулятьр доступа пользователя
//        user.setExpiryDate(new MyDateService().calculateExpiryDate());
//// сохраняем false для невозможности зайти не подтвердив ссылку
//        user.setEnabled(false);
//// кодируем token в строку
//        String token = UUID.randomUUID().toString();
//        user.setToken(token);
//// добавляем нового пользователя в БД
//        myRepository.addSave(user);
//// создаем ЮРЛ для отправки ссылки на почку нового пользователя
//        String appUrl ="http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/regConfirm" + user;
//// отправляем ссылку на почту
//        sendEmail.sendMail(appUrl);
//
//        return new ModelAndView("redirect:/mail");
//    }
//
//    @RequestMapping("/regConfirm")
//    public String confirmRegistration(@RequestParam("token") String token){
//
//        User user = myRepository.getUserByToken(token);
//
//        user.setEnabled(true);
//
//        myRepository.update(user);
//
//        return "/login";
//    }
//
//
//}
