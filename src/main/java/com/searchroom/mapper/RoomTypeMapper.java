package com.searchroom.mapper;

import com.searchroom.model.entities.RoomType;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoomTypeMapper implements RowMapper<RoomType> {

    public RoomType mapRow(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt("type_id");
        String description = resultSet.getString("description");
        return new RoomType(id, description);
    }

}
