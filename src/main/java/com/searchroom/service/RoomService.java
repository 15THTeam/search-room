package com.searchroom.service;

import com.searchroom.model.entities.Address;
import com.searchroom.model.join.NewPost;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;

public interface RoomService {

    void uploadFile(HttpServletRequest request, int roomInfoId) throws SQLException;
    byte[] getImage(String imageName) throws IOException;
    void addRoom(NewPost newPost, HttpServletRequest request, Address address) throws SQLException;
    void updateRoom(NewPost newPost, Address address);
    void deleteRoomPost(int postId);

}
