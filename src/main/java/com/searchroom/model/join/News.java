package com.searchroom.model.join;

import java.math.BigDecimal;

public class News {

    protected int postId;
    protected String title;
    protected String address;
    protected BigDecimal price;
    protected String roomType;
    protected String image;
    private boolean approved;

    public News(int postId, String title, String address, BigDecimal price, String image, boolean approved) {
        this.postId = postId;
        this.title = title;
        this.address = address;
        this.price = price;
        this.image = image;
        this.approved = approved;
    }

    public News(int postId, String title, String address, BigDecimal price, String roomType, String image) {
        this.postId = postId;
        this.title = title;
        this.address = address;
        this.price = price;
        this.roomType = roomType;
        this.image = image;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }

}
