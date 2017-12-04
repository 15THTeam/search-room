package com.searchroom.repository;

import com.searchroom.model.entities.Resource;

public interface ResourceRepository {

    void addResource(Resource resource);
    void updateResource(String imageName, int resourceId);
    void deleteResource(int resourceId);
    int getId(int infoId);
    String getImageNameById(int resourceId);

}
