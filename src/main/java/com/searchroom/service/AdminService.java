package com.searchroom.service;

import com.searchroom.model.entities.RoomType;

public interface AdminService {

    void updateRoomType(RoomType roomType);
    void editRole(String username, String role);

}
