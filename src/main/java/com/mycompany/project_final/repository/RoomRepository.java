/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.repository;

import com.mycompany.project_final.entities.RoomCategoryEntity;
import com.mycompany.project_final.entities.RoomEntity;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Integer>{
    List<RoomEntity> findByRoomCategory(RoomCategoryEntity category);
    @Query( value = "Select r.id,r.status,c.id as category_id, r.room_number,c.name,c.price from room r join room_category c on r.category_id = c.id "
    + "where r.category_id = ?1 and r.id not in" +
      "(select bd.room_id from booking_detail bd where bd.booking_id in (select b.id from booking b where b.checkIn between ?2 and ?3 or b.checkOut between ?2 and ?3))",nativeQuery = true)
    List<RoomEntity> findRoomByBookingNative (int id, String checkIn, String checkOut);   
}
