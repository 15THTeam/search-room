package com.searchroom.repository;

import com.searchroom.model.entities.RoomInfo;

public interface RoomInfoRepository {

    int addRoomInfo(RoomInfo roomInfo);
    int getAddressId(int infoId);
    void updateRoomInfo(RoomInfo roomInfo);
    void deleteRoomInfo(int infoId);

}
