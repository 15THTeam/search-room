package com.searchroom.mapper;

import com.searchroom.model.join.PostOnMap;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PostOnMapMapper implements RowMapper<PostOnMap> {

    @Override
    public PostOnMap mapRow(ResultSet resultSet, int i) throws SQLException {
        int postId = resultSet.getInt("post_id");
        String title = resultSet.getString("title");
        String latitude = resultSet.getString("latitude");
        String longitude = resultSet.getString("longitude");
        return new PostOnMap(postId, title, latitude, longitude);
    }

}
