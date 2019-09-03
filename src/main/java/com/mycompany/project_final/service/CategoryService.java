/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.ImageEntity;
import com.mycompany.project_final.entities.RoomCategoryEntity;
import com.mycompany.project_final.repository.CategoryRepository;
import com.mycompany.project_final.repository.ImageRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class CategoryService {
    @Autowired CategoryRepository categoryRepository;
    @Autowired ImageRepository imageRepository;
    public List<RoomCategoryEntity> viewCategory(){
        List<RoomCategoryEntity> categorys = (List<RoomCategoryEntity>) categoryRepository.findAll();
          if (categorys != null && categorys.size() > 0) {
            for (RoomCategoryEntity category : categorys) {
                List<ImageEntity> images = imageRepository.findByRoomCategory(category);
                
                if (images != null && images.size() > 0) {
                    category.setImages(images);
                } else {
                    category.setImages(new ArrayList<ImageEntity>());
                }
            }
        }

        return categorys;
    }
    public RoomCategoryEntity addCategory(RoomCategoryEntity r){
        return categoryRepository.save(r);
    }
    public RoomCategoryEntity findCategoryById(int id){
        return categoryRepository.findOne(id);
    }
      public boolean  deleteCategory(int id){
        categoryRepository.delete(id);
        return categoryRepository.exists(id);
    }
  
}

