package com.searchroom.repository;

import com.searchroom.model.entities.RoomPost;

import java.util.List;

public interface RoomPostRepository {

    void addRoomPost(RoomPost roomPost);
    void deleteRoomPost(int postId) throws Exception;
    int getInfoId(int postId);
    void approveRoom(int postId, int approve);
    int getPostAmount();
    int getPostAmountByCustomer(int customerId);
    List<Integer> getPostIdByUsername(String username);

}
