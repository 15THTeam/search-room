package com.searchroom.model.join;

import javax.validation.constraints.NotEmpty;

public class RoomTypeWithPostAmount {

    private int id;

    @NotEmpty
    private String description;

    private int postAmount;

    public RoomTypeWithPostAmount() {
    }

    public RoomTypeWithPostAmount(int id, @NotEmpty String description, int postAmount) {
        this.id = id;
        this.description = description;
        this.postAmount = postAmount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPostAmount() {
        return postAmount;
    }

    public void setPostAmount(int postAmount) {
        this.postAmount = postAmount;
    }

}
