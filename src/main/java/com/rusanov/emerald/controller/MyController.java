package com.rusanov.emerald.controller;

import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping(value="/")
public class MyController {


    @Autowired
    private UserService userService;

    @GetMapping
    public String home(){
        return "index";
    }

    @GetMapping("/mail")
    public String mail(){
        return "mail";
    }

    @GetMapping("/list")
    public String listUsers(Model model){
        List<User> users = userService.getUsers();
        model.addAttribute("users",users);
        return "list-users";
    }

    @GetMapping("/showForm")
    public String showForm(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "/user-form";
    }

    @GetMapping("/update")
    public String update(@ModelAttribute("userId") Long theId, Model model){
        User user = userService.update(theId);
        model.addAttribute("user", user);
        return "/user-form";
    }

    @PostMapping("/update")
    public String edit(@ModelAttribute("user") User user){
        userService.edit(user);
        return "redirect:/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("userId") Long theId){
        userService.delete(theId);
        return "redirect:/list";
    }

    @GetMapping("/log")
    public String login(Model model){
        model.addAttribute("userLogin", new User());
        return "/log";
    }

    @PostMapping(value = "/log")
    public String loginUser (@RequestParam("username") String name,
                             @RequestParam("g-recaptcha-response") String response) {
        switch (userService.loginUser(name, response)){
            case ("owner"):
                return "owner";
            case ("login"):
                return "redirect:/log";
            case ("errorUser"):
                return "redirect:/registration";
        }
        return "redirect:/registration";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute("userRegistration") User user, HttpServletRequest request){
        userService.saveUser(user, request);
        return "mail";
    }

    @RequestMapping("/regConfirm")
    public String confirmRegistration(@RequestParam("token") String token){
        userService.confirmRegistration(token);
        return "redirect:/log";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userRegistration", new User());
        return "registration";
    }

}
