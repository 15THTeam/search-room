package com.searchroom.repository.impl;

import com.searchroom.mapper.PostOnMapMapper;
import com.searchroom.model.join.PostOnMap;
import com.searchroom.repository.PostOnMapRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class PostOnMapRepositoryImpl implements PostOnMapRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<PostOnMap> getPostToMap() {
        String sql = "select r.post_id, i.title, a.latitude, a.longitude "
                + "from room_posts r "
                + "join room_infos i "
                + "on r.info_id = i.info_id "
                + "join addresses a "
                + "on a.address_id = i.address_id";
        return jdbcTemplate.query(sql, new PostOnMapMapper());
    }

}
