package com.rusanov.emerald.controller;

import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.entity.enums.*;
import com.rusanov.emerald.service.PropertyService;
import com.rusanov.emerald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/filter")
public class FilterController {

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/adminFilter", method = {RequestMethod.POST, RequestMethod.GET})
    public String adminFilter(@Param("userFilter") String userFilter,
                              @Param("enabled") Boolean enabled,
                              Principal principal,
                              Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<User> usersFilter = userService.getUsers();
        if (enabled == null && userFilter != null) {
            usersFilter = userService.getUserFilter(userFilter);
        } else if (enabled != null && userFilter != null) {
            usersFilter = userService.getUserFilter(userFilter);
            usersFilter.removeIf(user -> !user.getEnabled().equals(enabled));
        } else if (enabled != null) {
            usersFilter = userService.getUserEnabled(enabled);
        }
        model.addAttribute("users", usersFilter);
        model.addAttribute("userFilter", userFilter);
        return "list-users";
    }

    @RequestMapping(value = "/addressFilter", method = {RequestMethod.POST, RequestMethod.GET})
    public String addressFilter(@Param("addressFilter") String addressFilter,
                                Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<Property> propertyAddressFilter;
        if (addressFilter == null) {
            propertyAddressFilter = propertyService.getPropertyAll();
        } else {
            propertyAddressFilter = propertyService.getPropertyAddressFilter(addressFilter);
        }
        model.addAttribute("properties", propertyAddressFilter);
        model.addAttribute("addressFilter", addressFilter);
        return "property-view";
    }

    @RequestMapping(value = "/propertyFilter", method = {RequestMethod.POST, RequestMethod.GET})
    public String propertyFilter(@Param("category") CategoryEnum category,
                                 Principal principal,
                                 Model model) {
        User user = propertyService.getPrincipal(principal);
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<Property> propertyListFilter = propertyService.getPropertyAll();
        if (user.getRole().name().equals("ADMIN")) {
            if (category != null) {
                propertyListFilter = propertyService.findByCategory(category);
            }
            model.addAttribute("properties", propertyListFilter);
        } else {
            List<Property> listFilter = user.getProperty();
            if (category != null) {
                listFilter.removeIf(user1 -> !user1.getCategory().equals(category));
                model.addAttribute("properties", listFilter);
            }
            model.addAttribute("properties", listFilter);
        }
        return "property-list";
    }

    @GetMapping("/house")
    public String listPropertiesHouse(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        PropertyTypeEnum propertyType = PropertyTypeEnum.COTTAGE;
        List<Property> propertyTypeList = propertyService.findByPropertyType(propertyType);
        model.addAttribute("properties", propertyTypeList);
        return "property-view";
    }

    @GetMapping("/apartment")
    public String listPropertiesApartment(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        PropertyTypeEnum propertyType = PropertyTypeEnum.APARTMENT;
        List<Property> propertyTypeList = propertyService.findByPropertyType(propertyType);
        model.addAttribute("properties", propertyTypeList);
        return "property-view";
    }

    @GetMapping("/room")
    public String listPropertiesRoom(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        PropertyTypeEnum propertyType = PropertyTypeEnum.ROOM;
        List<Property> propertyTypeList = propertyService.findByPropertyType(propertyType);
        model.addAttribute("properties", propertyTypeList);
        return "property-view";
    }

    @GetMapping("/priceAscending")
    public String priceAscending(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<Property> priceAscending = propertyService.getPropertyAllPriceAscending();
        model.addAttribute("properties", priceAscending);
        return "property-view";
    }

    @GetMapping("/priceDescending")
    public String priceDescending(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<Property> priceDescending = propertyService.getPropertyAllPriceDescending();
        model.addAttribute("properties", priceDescending);
        return "property-view";
    }

    @GetMapping("/apartmentStudio")
    public String listPropertiesApartmentStudio(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        ApartmentEnum apartmentType = ApartmentEnum.STUDIO;
        List<Property> propertyApartmentTypeList = propertyService.findByApartmentType(apartmentType);
        model.addAttribute("properties", propertyApartmentTypeList);
        return "property-view";
    }

    @GetMapping("/apartmentOneRoom")
    public String listPropertiesApartmentOneRoom(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        ApartmentEnum apartmentType = ApartmentEnum.ONE_ROOM;
        List<Property> propertyApartmentTypeList = propertyService.findByApartmentType(apartmentType);
        model.addAttribute("properties", propertyApartmentTypeList);
        return "property-view";
    }

    @GetMapping("/apartmentTwoRoom")
    public String listPropertiesApartmentTwoRoom(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        ApartmentEnum apartmentType = ApartmentEnum.TWO_ROOM;
        List<Property> propertyApartmentTypeList = propertyService.findByApartmentType(apartmentType);
        model.addAttribute("properties", propertyApartmentTypeList);
        return "property-view";
    }

    @GetMapping("/apartmentThreeRoom")
    public String listPropertiesApartmentThreeRoom(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        ApartmentEnum apartmentType = ApartmentEnum.THREE_ROOM;
        List<Property> propertyApartmentTypeList = propertyService.findByApartmentType(apartmentType);
        model.addAttribute("properties", propertyApartmentTypeList);
        return "property-view";
    }

    @GetMapping("/apartmentFourRoom")
    public String listPropertiesApartmentFourRoom(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        ApartmentEnum apartmentType = ApartmentEnum.FOUR_ROOM;
        List<Property> propertyApartmentTypeList = propertyService.findByApartmentType(apartmentType);
        model.addAttribute("properties", propertyApartmentTypeList);
        return "property-view";
    }
}