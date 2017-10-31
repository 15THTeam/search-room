package com.searchroom.model.join;

public class PostForApprove {

    private int id;
    private String fullName;
    private String createdAt;
    private boolean isApproved;

    public PostForApprove() {
    }

    public PostForApprove(int id, String fullName, String createdAt, boolean isApproved) {
        this.id = id;
        this.fullName = fullName;
        this.createdAt = createdAt;
        this.isApproved = isApproved;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

}
