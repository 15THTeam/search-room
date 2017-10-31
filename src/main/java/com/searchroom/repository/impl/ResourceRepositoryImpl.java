package com.searchroom.repository.impl;

import com.searchroom.model.entities.Resource;
import com.searchroom.repository.ResourceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ResourceRepositoryImpl implements ResourceRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void addResource(Resource resource) {
        String sql = "insert into resources (file_name, room_info_id) values (?, ?)";
        jdbcTemplate.update(sql, new Object[]{
                resource.getFileName(),
                resource.getRoomInfoId()
        });
    }

    @Override
    public void deleteResource(int resourceId) {
        String sql = "delete from resources where resource_id = ?";
        jdbcTemplate.update(sql, new Object[]{ resourceId });
    }

    @Override
    public int getId(int infoId) {
        String sql = "select resource_id from resources where room_info_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[] {infoId}, Integer.class);
    }

}
