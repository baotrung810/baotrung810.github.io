/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.repository;

import com.mycompany.project_final.entities.BookingEntity;
import com.mycompany.project_final.entities.RoomEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public interface BookingRepository extends CrudRepository<BookingEntity, Integer>{
//     @Query( value = "Select b.id,b.Status, b.bookingDate,b.checkIn,b.checkOut,b.created_date,b.totalPrice, b.customer_id, bd.id, r.id, r.room_number,c.id, c.name \n" +
//"from booking b join booking_detail bd on b.id = bd.booking_id join room r on bd.room_id = r.id join room_category c on r.category_id = c.id\n" +
//"order by b.checkIn desc",nativeQuery = true)
//    List<BookingEntity> findBookingRoomNative ();
}
