/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.controller;

import com.mycompany.project_final.entities.AccountEntity;
import com.mycompany.project_final.entities.AccountRoleEntity;
import com.mycompany.project_final.entities.ImageEntity;
import com.mycompany.project_final.entities.RoomCategoryEntity;
import com.mycompany.project_final.entities.RoomEntity;
import com.mycompany.project_final.entities.ServiceEntity;
import com.mycompany.project_final.enums.Role;
import com.mycompany.project_final.service.AccountService;
import com.mycompany.project_final.service.CategoryService;
import com.mycompany.project_final.service.ImageService;
import com.mycompany.project_final.service.RoomService;
import com.mycompany.project_final.service.ServiceEntityService;
import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author AnhLe
 */
@Controller
public class HomeController {

    @Autowired
    AccountService accountService;
    @Autowired
    ServiceEntityService serviceEntityService;
    @Autowired
    ImageService imageService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    RoomService roomService;

    @RequestMapping(value = {"/", "/home"})
    public String home(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof AccountEntity) {
            String emailAcc = ((AccountEntity) principal).getFullname();
            List<AccountRoleEntity> accountRoles = ((AccountEntity) principal).getAccountRoles();
            model.addAttribute("message", emailAcc);
//             int id = ((AccountEntity) principal).getId();
            if (accountRoles != null && accountRoles.size() > 0) {
                for (AccountRoleEntity accountRole : accountRoles) {
                    if (accountRole.getRoles().equals(Role.ROLE_ADMIN)) {
                        return "redirect:/admin/home";
                    } else if (accountRole.getRoles().equals(Role.ROLE_USER)) {
                        return "user/user_home";
                    } else if (accountRole.getRoles().equals(Role.ROLE_MANAGER)) {

                        return "redirect:/manager/manager-service";
                    } else {

                        return "redirect:/reception/home";
                    }
                }
            }

        }

        return "home";
    }

    @RequestMapping("/login")
    public String loginForm(Model model,
            @RequestParam(value = "isError",
                    required = false) boolean isError) {
        if (isError) {
            model.addAttribute("message", "Login Fail.");
        }
        return "login";
    }
//     ManagerService
//    update Sevice
//      @RequestMapping("/manager-service")
//    public String viewService(Model model) {
//        List<ServiceEntity> services = serviceEntityService.viewService();
//        model.addAttribute("service", serviceEntityService.viewService());
//        return "manager/manager-service";
//    }
//    @RequestMapping("/add")
//    public String viewAddForm(Model model,
//             @RequestParam(value = "message", required = false) String message){
//        
//        model.addAttribute("service", new ServiceEntity());
//        model.addAttribute("images", imageService.viewImage());
//        model.addAttribute("action", "add-service");
//        model.addAttribute("message", message);
//        return "manager/service-form";
//    }
//    @RequestMapping(value = {"/add-service"},method = RequestMethod.POST)
//    public String addService(Model model,@ModelAttribute("service") ServiceEntity s){      
//        s= serviceEntityService.addService(s);
//        if (s != null && s.getId() > 0) {
//            return "redirect:/manager-service";
//        } else {
//            return "redirect:/add?message= add new book fail.";
//        }
//    }
//    
//    @RequestMapping(value = "/update/{id}")
//    public String updateService(Model model,
//            @PathVariable("id") int id){
//        ServiceEntity s = serviceEntityService.findServiceById(id);
//         if (s != null && s.getId() > 0) {
//            model.addAttribute("service", s);
//            model.addAttribute("action", "update-service");
//            return "manager/service-form";
//        } else {
//            return "redirect:/home?status=fail&message=book isn't exist.";
//        }
//    }
////    edit
//     @RequestMapping(value = "/update-service", method = RequestMethod.POST)
//    public String updateProduct(Model model,
//            @ModelAttribute("service") ServiceEntity s) {
//        serviceEntityService.saveService(s);
//        return "redirect:/manager-service";
//    }
////  delete
//      @RequestMapping(value = "/delete/{id}")
//    public String deleteProduct(Model model,
//            @PathVariable("id") int id) {
//        boolean check = serviceEntityService.deleteServiceById(id);
//        if (check) {
//            return "redirect:/manager-service?status=fail&message=delete fail!";
//        } else {
//            return "redirect:/manager-service?status=ok&message=delete success full!";
//        }
//    }
////    upload image
//    @RequestMapping("/uploadFile")
//    public String uploadImage(Model model,@RequestParam("file") CommonsMultipartFile commonsMultipartFile, ImageEntity image){
//        
//          try {
//			
//			String fileName = commonsMultipartFile.getOriginalFilename();
//			File file = new File("E:/Anh" + fileName);
//			commonsMultipartFile.transferTo(file);
//                        image.setName(fileName);
//                        imageService.addImage(image);
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("message", "upload failed");
//		}
//          model.addAttribute("image",imageService.findById(1).getName());
//       return "redirect:/manager-service";
//    }

// //     ManagerCategory
////    update Category
//      @RequestMapping("/manager-category")
//    public String viewCategory(Model model) {
//        model.addAttribute("category", categoryService.viewCategory());
//        return "manager/manager-category";
//    }
//    @RequestMapping("/ADD")
//    public String viewFormCate(Model model,
//             @RequestParam(value = "message", required = false) String message){
//        
//        model.addAttribute("service", new RoomCategoryEntity());
//        model.addAttribute("images", imageService.viewImage());
//        model.addAttribute("action", "add-category");
//        model.addAttribute("message", message);
//        return "manager/category-form";
//    }
//    @RequestMapping(value = {"/add-category"},method = RequestMethod.POST)
//    public String addCategory(Model model,@ModelAttribute("category") RoomCategoryEntity c){      
//        c= categoryService.addCategory(c);
//        if (c != null && c.getId() > 0) {
//            return "redirect:/manager-category";
//        } else {
//            return "redirect:/ADD?message= add new book fail.";
//        }
//    }
//    
//    @RequestMapping(value = "/UPDATE/{id}")
//    public String updateCategory(Model model,
//            @PathVariable("id") int id){
//        RoomCategoryEntity r = categoryService.findCategoryById(id);
//         if (r != null && r.getId() > 0) {
//            model.addAttribute("category", r);          
//            model.addAttribute("action", "update-category");
//            return "manager/category-form";
//        } else {
//            return "redirect:/home?status=fail&message=book isn't exist.";
//        }
//    }
////    edit
//     @RequestMapping(value = "/update-category", method = RequestMethod.POST)
//    public String updateCate(Model model,
//            @ModelAttribute("category") RoomCategoryEntity r) {
//        categoryService.addCategory(r);
//        return "redirect:/manager-category";
//    }
////  delete
//      @RequestMapping(value = "/DELETE/{id}")
//    public String deleteCate(Model model,
//            @PathVariable("id") int id) {
//        boolean check = categoryService.deleteCategory(id);
//        if (check) {
//            return "redirect:/manager-category?status=fail&message=delete fail!";
//        } else {
//            return "redirect:/manager-category?status=ok&message=delete success full!";
//        }
//    } 
    //     ManagerRoom
//    update room
//      @RequestMapping("/manager-room")
//    public String viewRoom(Model model) {
//        model.addAttribute("room", roomService.viewRoom());
//        return "manager/manager-room";
//    }
//    @RequestMapping("/Add")
//    public String viewFormRoom(Model model,
//             @RequestParam(value = "message", required = false) String message){
//        
//        model.addAttribute("room", new RoomEntity());
//        model.addAttribute("category", categoryService.viewCategory());
//        model.addAttribute("action", "add-room");
//        model.addAttribute("message", message);
//        return "manager/room-form";
//    }
//    @RequestMapping(value = {"/add-room"},method = RequestMethod.POST)
//    public String addRoom(Model model,@ModelAttribute("room") RoomEntity r){      
//        r= roomService.addRoom(r);
//        if (r != null && r.getId() > 0) {
//            return "redirect:/manager-room";
//        } else {
//            return "redirect:/ADD?message= add new book fail.";
//        }
//    }
// //    edit   
//    @RequestMapping(value = "/Update/{id}")
//    public String updateRoom(Model model,
//            @PathVariable("id") int id){
//        RoomEntity r = roomService.findRoom(id);
//         if (r != null && r.getId() > 0) {
//            model.addAttribute("room", r);      
//             model.addAttribute("category", categoryService.viewCategory());
//            model.addAttribute("action", "update-room");
//            return "manager/room-form";
//        } else {
//            return "redirect:/home?status=fail&message=book isn't exist.";
//        }
//    }
//
//     @RequestMapping(value = "/update-room", method = RequestMethod.POST)
//    public String updateRoom(Model model,
//            @ModelAttribute("room") RoomEntity r) {
//        roomService.addRoom(r);
//        return "redirect:/manager-room";
//    }
////  delete
//      @RequestMapping(value = "/Delete/{id}")
//    public String deleteRoom(Model model,
//            @PathVariable("id") int id) {
//        boolean check = roomService.deleteRoom(id);
//        if (check) {
//            return "redirect:/manager-room?status=fail&message=delete fail!";
//        } else {
//            return "redirect:/manager-room?status=ok&message=delete success full!";
//        }
//    } 
//         @RequestMapping("/uploadImage")
//    public String viewFormImage(Model model,
//             @RequestParam(value = "message", required = false) String message){
//        
//        model.addAttribute("image", new ImageEntity());
//        model.addAttribute("category", categoryService.viewCategory());
//         model.addAttribute("service", serviceEntityService.viewService());
//      
//        model.addAttribute("message", message);
//        return "manager/upload";
//    }
}
