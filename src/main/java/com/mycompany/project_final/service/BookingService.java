/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.BookingEntity;
import com.mycompany.project_final.entities.CustomerInformationEntity;
import com.mycompany.project_final.repository.BookingRepository;
import com.mycompany.project_final.repository.CustomerRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class BookingService {
    @Autowired BookingRepository bookingRepository;
    @Autowired CustomerRepository customerRepository;
    
    public BookingEntity addBooking(BookingEntity b){
        CustomerInformationEntity customer =  customerRepository.save(b.getCustomerInformation());
        b.setCustomerInformation(customer);
       bookingRepository.save(b);
       return b;
       
    }
    public List<BookingEntity> viewBooking(){
        return (List<BookingEntity>) bookingRepository.findAll();
    }
    
}
