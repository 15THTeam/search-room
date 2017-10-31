package com.searchroom.repository.impl;

import com.searchroom.mapper.RoomTypeMapper;
import com.searchroom.model.entities.RoomType;
import com.searchroom.repository.RoomTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class RoomTypeRepositoryImpl implements RoomTypeRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void addRoomType(String description) {
        String sql = "insert into room_types (description) values (?)";
        jdbcTemplate.update(sql, new Object[] { description });
    }

    public void updateRoomType(RoomType roomType) {
        String sql = "update room_types set description = ? where type_id = ?";
        jdbcTemplate.update(sql, new Object[] { roomType.getDescription(), roomType.getId() });
    }

    public void deleteRoomType(int id) {
        String sql = "delete from room_types where type_id = ?";
        jdbcTemplate.update(sql, new Object[] { id });
    }

    public RoomType getRoomTypeById(int id) {
        String sql = "select * from room_types where type_id = ?";

        List<RoomType> result = jdbcTemplate.query(sql, new Object[] { id }, new RoomTypeMapper());
        if (result.size() == 1) {
            return result.get(0);
        }
        return null;
    }

    public List<RoomType> getRoomTypeList() {
        String sql = "select * from room_types";

        List<RoomType> roomTypes = jdbcTemplate.query(sql, new RoomTypeMapper());
        return roomTypes;
    }

}
