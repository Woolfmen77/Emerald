package com.rusanov.emerald.controller;

import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.service.PropertyService;
import com.rusanov.emerald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PropertyService propertyService;


    @GetMapping("/accaunt")
    public String accaunt(Principal principal, Model model) {
        if (principal==null){
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        return "accaunt";
    }

    @GetMapping("/update/{userId}")
    public String update(@PathVariable Long userId, Principal principal, Model model){
        if (principal==null){
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        User user = userService.update(userId);
        model.addAttribute("user", user);
        return "user-edit";
    }

    @PostMapping("/update")
    public String edit(@ModelAttribute("user") User user, Principal principal, HttpServletRequest request){

        User userNew = propertyService.getPrincipal(principal);
        userService.edit(user, request);
        if (!user.getUsername().equals(userNew.getUsername())){
            return "login";
        }
        if (!userNew.getEmail().equals(user.getEmail())){
            return "redirect:/mail";
        }
        return "redirect:/accaunt";
    }

    @GetMapping("/delete/{userId}")
    public String delete(@PathVariable Long userId, Principal principal, Model model){
        if (principal==null){
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        userService.delete(userId);
        return "redirect:/";
    }

    @GetMapping("/mail")
    public String mailPage() {
        return "mail";
    }
}





//
//    @GetMapping("/showForm")
//    public String showForm(Principal principal, Model model){
//        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
//        User user = new User();
//        model.addAttribute("user", user);
//        return "admin-form";
//    }
//
//
//
//    @GetMapping("/update")
//    public String update(@ModelAttribute("userId") Long theId, Principal principal, Model model){
//        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
//        User user = userService.update(theId);
//        model.addAttribute("user", user);
//        return "admin-form";
//    }
//
//    @PostMapping("/update")
//    public String edit(@ModelAttribute("user") User user){
//        userService.edit(user);
//        return "redirect:/list";
//    }
//
//    @GetMapping("/delete")
//    public String delete(@RequestParam("userId") Long theId, Principal principal, Model model){
//        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
//        userService.delete(theId);
//        return "redirect:/list";
//    }
