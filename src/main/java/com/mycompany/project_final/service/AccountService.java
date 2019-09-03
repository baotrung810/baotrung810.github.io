/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.AccountEntity;
import com.mycompany.project_final.repository.AccountRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhLe
 */
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public AccountEntity findAccountByEmailAndPassword(
            String email, String password) {
        return accountRepository.findByEmailLikeAndPasswordLike(email, password);
    }
    public List<AccountEntity> viewAccount(){
        return (List<AccountEntity>) accountRepository.findAll();
    }
    public AccountEntity addAccount(AccountEntity acc){
        return accountRepository.save(acc);
    }
    public Optional<AccountEntity> finAccountdByEmail( String email){
        return accountRepository.findByEmail(email);
    }
    public AccountEntity findAccountById(int id){
        return accountRepository.findOne(id);
    }
}
