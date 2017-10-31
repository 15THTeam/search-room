package com.searchroom.model.entities;

public class Resource {

    private int id;
    private String fileName;
    private int roomInfoId;

    public Resource(String fileName, int roomInfoId) {
        this.fileName = fileName;
        this.roomInfoId = roomInfoId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getRoomInfoId() {
        return roomInfoId;
    }

    public void setRoomInfoId(int roomInfoId) {
        this.roomInfoId = roomInfoId;
    }

}
