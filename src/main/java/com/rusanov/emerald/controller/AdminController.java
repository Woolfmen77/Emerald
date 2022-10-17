package com.rusanov.emerald.controller;

import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.service.PropertyService;
import com.rusanov.emerald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String listUsers(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        return "list-users";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Long id, Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        User user = userService.update(id);
        model.addAttribute("user", user);
        return "admin-form";
    }

    @PostMapping("/update")
    public String adminEdit(@ModelAttribute("user") User user) {
        userService.adminEdit(user);
        return "redirect:/admin/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("userId") Long theId, Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        userService.delete(theId);
        return "redirect:/admin/list";
    }
}