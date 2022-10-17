package com.rusanov.emerald.controller;

import com.rusanov.emerald.entity.Address;
import com.rusanov.emerald.entity.Image;
import com.rusanov.emerald.entity.Property;
import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.entity.enums.CategoryEnum;
import com.rusanov.emerald.service.AddressService;
import com.rusanov.emerald.service.ImageService;
import com.rusanov.emerald.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@MultipartConfig
@RequestMapping(value = "/property")
public class PropertyController {

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private AddressService addressService;

    @GetMapping("/list")
    public String listProperties(Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/";
        }
        User user = propertyService.getPrincipal(principal);
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        List<Property> properties = propertyService.getPropertyAll();
        if (user.getRole().name().equals("ADMIN")) {
            model.addAttribute("properties", properties);
        } else {
            model.addAttribute("properties", user.getProperty());
        }
        return "property-list";
    }

    @GetMapping("/categorySall")
    public String listPropertiesCategorySall(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        CategoryEnum category = CategoryEnum.SALL;
        List<Property> propertiesCategory = propertyService.findByCategory(category);
        model.addAttribute("properties", propertiesCategory);
        return "property-view";
    }

    @GetMapping("/categoryRental")
    public String listPropertiesCategoryRental(Principal principal, Model model) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        CategoryEnum category = CategoryEnum.RENTAL;
        List<Property> propertiesCategory = propertyService.findByCategory(category);
        model.addAttribute("properties", propertiesCategory);
        return "property-view";
    }

    @GetMapping("/showPropertyForm")
    public String showFormForAdd(Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        User user = propertyService.getPrincipal(principal);
        Address address = new Address();
        Property property = new Property();
        model.addAttribute("images", property.getImages());
        model.addAttribute("property", property);
        model.addAttribute("propertys", user.getProperty());
        model.addAttribute("propertyAddress", address);
        return "property-form";
    }

    @PostMapping("/addProperty")
    public String addProperty(@RequestParam("files") MultipartFile[] files,
                              @ModelAttribute("property") Property property,
                              @ModelAttribute("propertyAddress") Address address,
                              Principal principal) throws IOException {
        if (principal == null) {
            return "redirect:/";
        }
        property.setAddress(address);
        propertyService.addProperty(principal, property, files);
        return "redirect:/property/list";
    }

    @GetMapping("/editPropertyForm/{propertyId}")
    public String showFormForUpdate(@PathVariable Long propertyId,
                                    Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        Property property = propertyService.editProperty(propertyId);
        model.addAttribute("images", property.getImages());
        model.addAttribute("property", property);
        Address address = addressService.editAddress(propertyId);
        model.addAttribute("propertyAddress", address);
        return "property-form";
    }

    @GetMapping("/delete/{theId}")
    public String deleteProperty(@PathVariable Long theId, Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        propertyService.deleteProperty(theId);
        return "redirect:/property/list";
    }

    @GetMapping("/deleteImage")
    public String deleteImage(@RequestParam("imageId") Long theId,
                              @RequestParam("propertyId") Long propertyId,
                              Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        imageService.deleteImage(theId);
        model.addAttribute("propertyId", propertyId);
        return "redirect:/property/editPropertyForm/{propertyId}";
    }

    @GetMapping("/mainPhoto")
    public String mainPhoto(@RequestParam("imageId") Long theId,
                            @RequestParam("propertyId") Long propertyId,
                            Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/";
        }
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        imageService.mainPhoto(theId, propertyId);
        model.addAttribute("propertyId", propertyId);
        return "redirect:/property/editPropertyForm/{propertyId}";
    }

    @GetMapping("/info/{id}")
    public String propertyInfo(@PathVariable Long id, Model model, Principal principal) {
        model.addAttribute("userPrincipal", propertyService.getPrincipal(principal));
        Property property = propertyService.editProperty(id);
        List<Image> imageList = property.getImages();
        imageList.removeIf(Image::isPreviewImage);
        model.addAttribute("image", imageList);
        model.addAttribute("info", property);
        return "property-info";
    }
}