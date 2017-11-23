package com.searchroom.model.join;

public class AccountAndPost {

    private String username;
    private String role;
    private int postAmount;

    public AccountAndPost() {
    }

    public AccountAndPost(String username, String role, int postAmount) {
        this.username = username;
        this.role = role;
        this.postAmount = postAmount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getPostAmount() {
        return postAmount;
    }

    public void setPostAmount(int postAmount) {
        this.postAmount = postAmount;
    }

}
