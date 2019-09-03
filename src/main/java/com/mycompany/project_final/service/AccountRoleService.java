/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.AccountRoleEntity;
import com.mycompany.project_final.repository.AccountRoleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class AccountRoleService {
    @Autowired 
    AccountRoleRepository accountRoleRepository;
    
    public List<AccountRoleEntity> viewAccRole(){
        return (List<AccountRoleEntity>) accountRoleRepository.findAll();
    }
    public AccountRoleEntity findById(int id){
        return accountRoleRepository.findOne(id);
    }
}
