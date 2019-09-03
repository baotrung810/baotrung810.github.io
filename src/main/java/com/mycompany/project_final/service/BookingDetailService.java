/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.BookingDetailEntity;
import com.mycompany.project_final.repository.BookingDetailRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class BookingDetailService {
    @Autowired
    BookingDetailRepository bookingDetailRepository;
    public BookingDetailEntity addBookingDetail(BookingDetailEntity b){
        return  bookingDetailRepository.save(b);
    }
    public List<BookingDetailEntity> viewBookingDetail(){
        return (List<BookingDetailEntity>) bookingDetailRepository.findAll();
    }
    public BookingDetailEntity findBookingDetail(int id){
        return bookingDetailRepository.findOne(id);
    }
}
