package com.searchroom.model.entities;

import java.math.BigDecimal;

public class RoomInfo {

    private int id;
    private String title;
    private float area;
    private BigDecimal price;
    private String description;
    private boolean available;
    private int addressId;
    private int typeId;

    public RoomInfo(int id, String title, float area, BigDecimal price, String description, int typeId) {
        this.id = id;
        this.title = title;
        this.area = area;
        this.price = price;
        this.description = description;
        this.typeId = typeId;
    }

    public RoomInfo(String title, float area, BigDecimal price, String description, int addressId, int typeId) {
        this.title = title;
        this.area = area;
        this.price = price;
        this.description = description;
        this.addressId = addressId;
        this.typeId = typeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

}
