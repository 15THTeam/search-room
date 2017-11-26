package com.searchroom.repository.impl;

import com.searchroom.model.entities.RoomPost;
import com.searchroom.repository.RoomPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;

@Repository
@Transactional
public class RoomPostRepositoryImpl implements RoomPostRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void addRoomPost(RoomPost roomPost) {
        String sql = "insert into room_posts (customer_id, info_id) values (?, ?)";
        jdbcTemplate.update(sql, new Object[]{roomPost.getCustomerId(), roomPost.getRoomInfoId()});
    }

    @Override
    public void deleteRoomPost(int postId) throws Exception {
        String sql = "delete from room_posts where post_id = ?";
        jdbcTemplate.update(sql, new Object[]{postId});
    }

    @Override
    public int getInfoId(int postId) {
        String sql = "select info_id from room_posts where post_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{postId}, Integer.class);
    }

    @Override
    public void approveRoom(int postId, int approve) {
        String sql = "update room_posts set is_approved = ? where post_id = ?";
        jdbcTemplate.update(sql, new Object[]{approve, postId});
    }

    @Override
    public int getPostAmount() {
        String sql = "select count(post_id) from room_posts";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public int getPostAmountByCustomer(int customerId) {
        String sql = "select count(post_id) from room_posts where customer_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{customerId}, Integer.class);
    }

    @Override
    public List<Integer> getPostIdByUsername(String username) {
        String sql = "select post_id "
                + "from room_posts r "
                + "join customers c "
                + "on c.customer_id = r.customer_id "
                + "join accounts a "
                + "on a.username = c.username "
                + "where a.username = ?";
        return jdbcTemplate.queryForList(sql, new Object[]{username}, Integer.class);
    }

}
