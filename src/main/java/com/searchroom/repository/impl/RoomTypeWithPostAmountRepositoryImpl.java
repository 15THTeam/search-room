package com.searchroom.repository.impl;

import com.searchroom.model.join.RoomTypeWithPostAmount;
import com.searchroom.repository.RoomTypeWithPostAmountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class RoomTypeWithPostAmountRepositoryImpl implements RoomTypeWithPostAmountRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<RoomTypeWithPostAmount> getList() {
        String sql = "select t.type_id, t.description, count(i.info_id) as post_amount "
                + "from room_types t "
                + "left join room_infos i "
                + "on i.type_id = t.type_id "
                + "group by i.type_id";
        return jdbcTemplate.query(sql, (resultSet, i) -> {
            int id = resultSet.getInt("type_id");
            String description = resultSet.getString("description");
            int roomAmount = resultSet.getInt("post_amount");
            return new RoomTypeWithPostAmount(id, description, roomAmount);
        });
    }
}
