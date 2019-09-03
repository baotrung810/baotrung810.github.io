/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.ImageEntity;
import com.mycompany.project_final.repository.ImageRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class ImageService {
    @Autowired ImageRepository imageRepository;
    public ImageEntity addImage(ImageEntity i){
        return  imageRepository.save(i);
    }
    public List<ImageEntity> viewImage(){
        return (List<ImageEntity>) imageRepository.findAll();
    }
    public ImageEntity findById(int id){
        return imageRepository.findOne(id);
    }
}
