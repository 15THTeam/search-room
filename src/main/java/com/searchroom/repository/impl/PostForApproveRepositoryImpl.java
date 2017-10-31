package com.searchroom.repository.impl;

import com.searchroom.model.join.PostForApprove;
import com.searchroom.repository.PostForApproveRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Repository
@Transactional
public class PostForApproveRepositoryImpl implements PostForApproveRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<PostForApprove> getAllPost() {
        String sql = "select p.post_id, p.created_at, c.full_name, p.is_approved "
                + "from room_posts p "
                + "join customers c "
                + "on c.customer_id = p.customer_id";
        return jdbcTemplate.query(sql, (ResultSet resultSet, int row) -> {
            int postId = resultSet.getInt("post_id");
            String fullName = resultSet.getString("full_name");
            String createdAt = resultSet.getTimestamp("created_at").toString();
            boolean isApproved = resultSet.getBoolean("is_approved");

            LocalDateTime dateTime
                    = LocalDateTime.parse(createdAt, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
            String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy"));

            return new PostForApprove(postId, fullName, formattedDate, isApproved);
        });
    }

}
