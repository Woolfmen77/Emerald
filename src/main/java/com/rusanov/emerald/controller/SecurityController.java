package com.rusanov.emerald.controller;

import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.service.PropertyService;
import com.rusanov.emerald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
public class SecurityController {

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String view(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<Property> properties = propertyService.getPropertyAll();
        model.addAttribute("property2", propertyService.getPropertyAll());
        model.addAttribute("properties", properties);
        return "property-view";
    }

    @GetMapping("/login")
    public String login(Principal principal, Model model, HttpServletRequest request) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        if (request.getParameterMap().containsKey("error")) {
            model.addAttribute("error", true);
        }
        return "login";
    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping("/regConfirm")
    public String confirmRegistration(@RequestParam("token") String token, Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        userService.confirmRegistration(token);
        return "login";
    }

    @PostMapping("/registration")
    public String saveUser(@ModelAttribute("userForm") @Valid User userForm, BindingResult bindingResult, Model model,
                           @RequestParam("email") String email, HttpServletRequest request) {

        if (userForm.getPassword() != null && !userForm.getPassword().equals(userForm.getConfirmPassword())) {
            model.addAttribute("passwordError", true);
            return "registration";
        }
        if (userService.findByEmail(userForm.getEmail()) != null) {
            model.addAttribute("emailError", true);
            return "registration";
        }
        if (userService.findByUsername(userForm.getUsername()).isPresent()) {
            model.addAttribute("usernameError", true);
            return "registration";
        }
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.saveUser(userForm, email, request);
        return "mail";
    }
}