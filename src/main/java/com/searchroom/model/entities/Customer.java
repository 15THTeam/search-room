package com.searchroom.model.entities;

import com.searchroom.model.validator.Phone;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class Customer {

    private int id;

    @NotEmpty
    private String fullName;

    @Phone
    private String phoneNumber;

    @Email
    private String email;

    private String username;

    public Customer() {
    }

    public Customer(int id, String fullName, String phoneNumber, String email, String username) {
        this.id = id;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.username = username;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
