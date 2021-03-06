package com.searchroom.model.entities;

public class Account {

    private String username;
    private String password;
    private String role;

    public Account() {
    }

    public Account(String username) {
        this.username = username;
    }

    public Account(String username, String role) {
        this.username = username;
        this.role = role;
    }

    public Account(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
