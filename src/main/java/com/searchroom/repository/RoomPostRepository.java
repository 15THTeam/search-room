package com.searchroom.repository;

import com.searchroom.model.entities.RoomPost;

public interface RoomPostRepository {

    void addRoomPost(RoomPost roomPost);
    void deleteRoomPost(int postId);
    int getInfoId(int postId);
    void approveRoom(int postId, int approve);

}
