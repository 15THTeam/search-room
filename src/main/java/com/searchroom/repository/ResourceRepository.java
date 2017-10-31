package com.searchroom.repository;

import com.searchroom.model.entities.Resource;

public interface ResourceRepository {

    void addResource(Resource resource);
    void deleteResource(int resourceId);
    int getId(int infoId);

}
