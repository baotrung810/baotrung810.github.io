/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.controller;

import com.mycompany.project_final.entities.AccountEntity;
import com.mycompany.project_final.entities.AccountRoleEntity;
import com.mycompany.project_final.enums.Gender;
import com.mycompany.project_final.enums.Role;
import com.mycompany.project_final.model.UserInput;
import com.mycompany.project_final.repository.AccountRepository;
import com.mycompany.project_final.service.AccountRoleService;
import com.mycompany.project_final.service.AccountService;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhLe
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AccountService accountService;
    @Autowired
    AccountRoleService accountRoleService;

    @RequestMapping(value = {"/home"})
    public String home(Model model,@RequestParam(value = "message", required = false) String message) {
        model.addAttribute("account", accountService.viewAccount());
        model.addAttribute("message", message);
        return "/admin/home_admin";
    }

    @RequestMapping("/add") // click button add view page 
    public String viewFormRegistor(Model model) {
        model.addAttribute("gender", Gender.values());
        model.addAttribute("roles", accountRoleService.viewAccRole());
        return "/admin/registor";
    }
/// add account

    @RequestMapping(value = "/add-account", method = RequestMethod.POST)
    public String registorAcc(HttpServletRequest rq, @ModelAttribute("account") UserInput user) {
        AccountEntity account = new AccountEntity();
        account.setEmail(user.getEmail());
        account.setFullname(user.getFullName());
        account.setPassword(user.getPassword());
        account.setGender(user.getGender());
        account.setPhoneNumber(Integer.parseInt(user.getPhoneNumber()));
        int id = user.getRole();
        AccountRoleEntity accRole = accountRoleService.findById(id);
        if (accountService.finAccountdByEmail(user.getEmail()).isPresent()) {
            return "redirect:/admin/add";
        }
        accountService.addAccount(account);
//        account.getAccountRoles().clear();
        ArrayList<AccountRoleEntity> accountRoleEntitys = new ArrayList<>();
        accountRoleEntitys.add(accRole);
        account.setAccountRoles(accountRoleEntitys);
        accountService.addAccount(account);
        return "redirect:/admin/home";
    }

    @RequestMapping("/update/{idAccount}") // click button add view page 
    public String viewFormUpdate(Model model, @PathVariable("idAccount") int id) {
        AccountEntity accountEntity = accountService.findAccountById(id);
        if (accountEntity != null && accountEntity.getId() > 0) {
            model.addAttribute("account", accountEntity);
            model.addAttribute("gender", Gender.values());
            model.addAttribute("roles", accountRoleService.viewAccRole());
            return "/admin/account-update";
        } else {
            return "redirect:/admin/home_admin?status=fail&message=account isn't exist.";
        }

    }
    @RequestMapping(value = {"/update-account"}, method = RequestMethod.POST)
    public String updateAccount(Model model,@ModelAttribute("account") AccountEntity a){
        accountService.addAccount(a);
        return "redirect:/admin/home";
    }
      @InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception {
        binder.registerCustomEditor(List.class, "accountRoles", new CustomCollectionEditor(List.class) {
            protected AccountRoleEntity convertElement(Object element) {
                if (element instanceof String) {
                    String id = (String) element;
                    AccountRoleEntity accountRole = accountRoleService.findById(Integer.parseInt(id));
                    return accountRole;
                }
                return null;
            }
        });
    }
}