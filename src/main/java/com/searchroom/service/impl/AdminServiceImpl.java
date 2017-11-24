package com.searchroom.service.impl;

import com.searchroom.model.entities.RoomType;
import com.searchroom.repository.RoomTypeRepository;
import com.searchroom.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    @Override
    public void updateRoomType(RoomType roomType) {
        if (roomType.getId() == 0) {
            roomTypeRepository.addRoomType(roomType.getDescription());
        } else {
            roomTypeRepository.updateRoomType(roomType);
        }
    }

}
