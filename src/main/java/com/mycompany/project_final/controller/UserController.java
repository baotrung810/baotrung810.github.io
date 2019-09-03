/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author AnhLe
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = {"/home"})
    public String home(Model model) {
        model.addAttribute("message", "User");
        return "/user/home";
    }
    
    @RequestMapping(value = {"/user_home"})
    public String user_home(Model model){
        return "/user/user_home";
    }
}
