/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.ImageEntity;
import com.mycompany.project_final.entities.RoomCategoryEntity;
import com.mycompany.project_final.entities.RoomEntity;
import com.mycompany.project_final.repository.CategoryRepository;
import com.mycompany.project_final.repository.ImageRepository;
import com.mycompany.project_final.repository.RoomRepository;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class RoomService {

    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    RoomRepository roomRepository;
    @Autowired
    ImageRepository imageRepository;

    public List<RoomEntity> viewRoom() {
        return (List<RoomEntity>) roomRepository.findAll();

    }

    public RoomEntity addRoom(RoomEntity r) {
        return roomRepository.save(r);
    }

    public RoomEntity findRoom(int id) {
        RoomEntity room = roomRepository.findOne(id);
        RoomCategoryEntity category = room.getRoomCategory();
        List<ImageEntity> images = imageRepository.findByRoomCategory(category);
        if (images != null && images.size() > 0) {
            category.setImages(images);
            room.setRoomCategory(category);
        } else {
            category.setImages(new ArrayList<ImageEntity>());
            room.setRoomCategory(category);
        }
        return room;
//        return roomRepository.findOne(id);
    }

    public boolean deleteRoom(int id) {
        roomRepository.delete(id);
        return roomRepository.exists(id);
    }

    public List<RoomEntity> searchRoomByBooking(int id, String checkin, String checkout) {

        List<RoomEntity> rooms = roomRepository.findRoomByBookingNative(id, checkin, checkout);
        if (rooms != null && rooms.size() > 0) {
            for (RoomEntity room : rooms) {
                RoomCategoryEntity category = room.getRoomCategory();
                List<ImageEntity> image = imageRepository.findByRoomCategory(category); // lay list image theo roomcategory
                if (image != null && image.size() > 0) {
                    category.setImages(image);
                    room.setRoomCategory(category);
                } else {
                    category.setImages(new ArrayList<ImageEntity>());
                    room.setRoomCategory(category);
                }

            }
        }
        return rooms;
    }

}
