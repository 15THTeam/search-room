package com.searchroom.repository.impl;

import com.searchroom.model.entities.RoomPost;
import com.searchroom.repository.RoomPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class RoomPostRepositoryImpl implements RoomPostRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void addRoomPost(RoomPost roomPost) {
        String sql = "insert into room_posts (customer_id, info_id) values (?, ?)";
        jdbcTemplate.update(sql, new Object[]{ roomPost.getCustomerId(), roomPost.getRoomInfoId() });
    }

    @Override
    public void deleteRoomPost(int postId) {
        String sql = "delete from room_posts where post_id = ?";
        jdbcTemplate.update(sql, new Object[]{ postId });
    }

    @Override
    public int getInfoId(int postId) {
        String sql = "select info_id from room_posts where post_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[] {postId}, Integer.class);
    }

    @Override
    public void approveRoom(int postId, int approve) {
        String sql = "update room_posts set is_approved = ? where post_id = ?";
        jdbcTemplate.update(sql, new Object[]{approve, postId});
    }

}
