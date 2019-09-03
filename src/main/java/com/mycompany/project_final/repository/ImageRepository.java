/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.repository;

import com.mycompany.project_final.entities.ImageEntity;
import com.mycompany.project_final.entities.RoomCategoryEntity;
import com.mycompany.project_final.entities.ServiceEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer> {

    List<ImageEntity> findByService(ServiceEntity service);
    List<ImageEntity> findByRoomCategory(RoomCategoryEntity category); // tim image theo room category
}
