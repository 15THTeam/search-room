package com.searchroom.model.entities;

import java.util.Date;

public class RoomPost {

    private int id;
    private Date createdAt;
    private boolean isApproved;
    private Date approvedAt;
    private int approvedBy;
    private int customerId;
    private int roomInfoId;

    public RoomPost(int customerId, int roomInfoId) {
        this.customerId = customerId;
        this.roomInfoId = roomInfoId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

    public Date getApprovedAt() {
        return approvedAt;
    }

    public void setApprovedAt(Date approvedAt) {
        this.approvedAt = approvedAt;
    }

    public int getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(int approvedBy) {
        this.approvedBy = approvedBy;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getRoomInfoId() {
        return roomInfoId;
    }

    public void setRoomInfoId(int roomInfoId) {
        this.roomInfoId = roomInfoId;
    }

}
