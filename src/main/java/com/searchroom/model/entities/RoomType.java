package com.searchroom.model.entities;

import javax.validation.constraints.NotEmpty;

public class RoomType {

    private int id;

    @NotEmpty
    private String description;

    public RoomType() {
    }

    public RoomType(int id, String description) {
        this.id = id;
        this.description = description;
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

}
