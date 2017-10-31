package com.searchroom.model.join;

import java.math.BigDecimal;

public class NewPost {

    private int postId;
    private String title;
    private String address;
    private float area;
    private BigDecimal price;
    private int typeId;
    private String description;

    public NewPost() {
    }

    public NewPost(int postId, String title, String address, float area, BigDecimal price,
                   int typeId, String description) {
        this.postId = postId;
        this.title = title;
        this.address = address;
        this.area = area;
        this.price = price;
        this.typeId = typeId;
        this.description = description;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
