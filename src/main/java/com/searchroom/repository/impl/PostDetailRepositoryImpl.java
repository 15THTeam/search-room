package com.searchroom.repository.impl;

import com.searchroom.mapper.PostDetailMapper;
import com.searchroom.model.join.PostDetail;
import com.searchroom.repository.PostDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class PostDetailRepositoryImpl implements PostDetailRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public PostDetail getPostDetail(int postId) {
        String sql = "select p.post_id, t.description, i.title, i.area, i.price, i.description, a.address,"
                + "a.latitude, a.longitude, p.created_at, c.full_name, c.email, c.phone_number, r.file_name "
                + "from room_infos i "
                + "join addresses a "
                + "on i.address_id = a.address_id "
                + "join room_posts p "
                + "on p.info_id = i.info_id "
                + "join customers c "
                + "on c.customer_id = p.customer_id "
                + "join resources r "
                + "on r.room_info_id = i.info_id "
                + "join room_types t "
                + "on i.type_id = t.type_id "
                + "where p.post_id = ?";
        List<PostDetail> detailList = jdbcTemplate.query(sql, new Object[]{postId}, new PostDetailMapper());

        if (detailList.size() > 0) {
            return detailList.get(0);
        }
        return null;
    }

    @Override
    public PostDetail getPostToSave(int postId) {
        return null;
    }

}
