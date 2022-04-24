//package com.rusanov.emerald.controller;
//
//import com.rusanov.emerald.entity.ReCaptchaResponse;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.client.RestTemplate;
//
//import static org.springframework.http.HttpMethod.POST;
//
//@Controller
//public class LoginController {
//
//    @Autowired
//    RestTemplate restTemplate;
//
//    @GetMapping("/login")
//    public String login(){
//        return "/login";
//    }
//
//    @PostMapping(value = "/login")
//    public String loginUser (@RequestParam("name") String name, @RequestParam("g-recaptcha-response") String response) {
//        System.out.println(name);
//
//        String url = "https://www.google.com/recaptcha/api/siteverify";
//        String params = "?secret=6LcQYIgfAAAAAFJIRNoL9TuHz9I0uvbL3ETw5-Qg&response=" + response;
//
//        ReCaptchaResponse reCaptchaResponse = restTemplate.exchange(url + params, POST, null, ReCaptchaResponse.class).getBody();
//
//        System.out.println(url + params);
//
//        assert reCaptchaResponse != null;
//        if (reCaptchaResponse.isSuccess()) {
//            return "redirect:/owner";
//        } else {
//            return "redirect:/login";
//        }
//    }
//}
