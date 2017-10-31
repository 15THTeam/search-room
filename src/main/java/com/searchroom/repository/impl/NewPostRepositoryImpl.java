package com.searchroom.repository.impl;

import com.searchroom.model.join.NewPost;
import com.searchroom.repository.NewPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.List;

@Transactional
@Repository
public class NewPostRepositoryImpl implements NewPostRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public NewPost getNewPostByPostId(int postId) {
        String sql = "select i.title, i.area, i.price, i.description, a.address, t.type_id "
                + "from room_posts p "
                + "join room_infos i "
                + "on p.info_id = i.info_id "
                + "join addresses a "
                + "on a.address_id = i.address_id "
                + "join room_types t "
                + "on t.type_id = i.type_id "
                + "where p.post_id = ?";
        List<NewPost> newPostList = jdbcTemplate.query(sql, new Object[]{postId}, (ResultSet resultSet, int i) -> {
            String title = resultSet.getString("title");
            float area = resultSet.getFloat("area");
            BigDecimal price = resultSet.getBigDecimal("price");
            String description = resultSet.getString("description");
            String address = resultSet.getString("address");
            int typeId = resultSet.getInt("type_id");
            return new NewPost(postId, title, address, area, price, typeId, description);
        });

        if (newPostList.size() > 0) {
            return newPostList.get(0);
        }
        return null;
    }

}
