/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.CustomerInformationEntity;
import com.mycompany.project_final.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class CustomerService {
    @Autowired CustomerRepository customerRepository;
    public CustomerInformationEntity addCustomer( CustomerInformationEntity c){
        return customerRepository.save(c);
    }
}
