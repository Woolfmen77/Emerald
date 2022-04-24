package com.rusanov.emerald.controller;

import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import com.rusanov.emerald.service.PropertyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value="/property")
public class PropertyController {

    private static final Logger LOG = LoggerFactory.getLogger(PropertyController.class);

    @Autowired
    private PropertyService propertyService;

    @GetMapping("/list")
    public String listProperties(Model model){
        List<Property> properties = propertyService.getPropertyAll();
        model.addAttribute("properties",properties);
        return "property-list";
    }

    @GetMapping("/categorySall")
    public String listPropertiesCategorySall(Model model){
        CategoryEnum category = CategoryEnum.SALL;
        List<Property> propertiesCategory = propertyService.findByCategory(category);
        model.addAttribute("propertiesCategory", propertiesCategory);
        return "property-category";
    }

    @GetMapping("/categoryRental")
    public String listPropertiesCategoryRental(Model model){
        CategoryEnum category = CategoryEnum.RENTAL;
        List<Property> propertiesCategory = propertyService.findByCategory(category);
        model.addAttribute("propertiesCategory", propertiesCategory);
        return "property-category";
    }

    @GetMapping("/showPropertyForm")
    public String showFormForAdd(Model model){
        LOG.debug("inside show property-form METHOD");
        Property property = new Property();
        model.addAttribute("property", property);
        return "property-form";
    }

    @PostMapping("/addProperty")
    public String addProperty(@ModelAttribute("property") Property property){
        propertyService.addProperty(property);
        return "redirect:/property/list";
    }

    @GetMapping("/editPropertyForm")
    public String showFormForUpdate(@RequestParam("propertyId") Long theId, Model model){
        Property property = propertyService.editProperty(theId);
        model.addAttribute("property", property);
        return "property-form";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("propertyId") Long theId){
        propertyService.deleteProperty(theId);
        return "redirect:/property/list";
    }

}
