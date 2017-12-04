package com.searchroom.model.join;

public class PostForApprove {

    private int id;
    private String username;
    private String createdAt;
    private boolean isApproved;

    public PostForApprove() {
    }

    public PostForApprove(int id, String username, String createdAt, boolean isApproved) {
        this.id = id;
        this.username = username;
        this.createdAt = createdAt;
        this.isApproved = isApproved;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
