package com.searchroom.model.join;

public class PostOnMap {

    private int postId;
    private String title;
    private String latitude;
    private String longitude;

    public PostOnMap() {
    }

    public PostOnMap(int postId, String title, String latitude, String longitude) {
        this.postId = postId;
        this.title = title;
        this.latitude = latitude;
        this.longitude = longitude;
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

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

}
