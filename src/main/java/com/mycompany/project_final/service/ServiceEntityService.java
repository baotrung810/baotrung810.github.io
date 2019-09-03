/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.service;

import com.mycompany.project_final.entities.ImageEntity;
import com.mycompany.project_final.entities.ServiceEntity;
import com.mycompany.project_final.repository.ImageRepository;
import com.mycompany.project_final.repository.ServiceRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class ServiceEntityService {

    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private ImageRepository imageRepository;

    public ServiceEntity addService(ServiceEntity s) {
        return serviceRepository.save(s);
    }

    public List<ServiceEntity> viewService() {
        List<ServiceEntity> services = (List<ServiceEntity>) serviceRepository.findAll();
        if (services != null && services.size() > 0) {
            for (ServiceEntity service : services) {
                List<ImageEntity> images = imageRepository.findByService(service);
                
                if (images != null && images.size() > 0) {
                    service.setImages(images);
                } else {
                    service.setImages(new ArrayList<ImageEntity>());
                }
            }
        }
        return services;
    }

    public ServiceEntity findServiceById(int id) {
        return serviceRepository.findOne(id);
    }

    public ServiceEntity saveService(ServiceEntity s) {
        return serviceRepository.save(s);
    }

    public boolean deleteServiceById(int id) {
        serviceRepository.delete(id);
        return serviceRepository.exists(id);
    }
}
