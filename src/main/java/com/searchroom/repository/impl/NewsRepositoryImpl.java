package com.searchroom.repository.impl;

import com.searchroom.mapper.NewsMapper;
import com.searchroom.model.join.News;
import com.searchroom.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class NewsRepositoryImpl implements NewsRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<News> getNewestPost() {
        int POSTS_ON_HOME_PAGE = 8;
        String sql = "select p.post_id, i.price, i.title, a.address, t.description, r.file_name"
                + " from room_posts p"
                + " join room_infos i"
                + " on p.info_id = i.info_id"
                + " join addresses a"
                + " on i.address_id = a.address_id"
                + " join room_types t"
                + " on t.type_id = i.type_id"
                + " join resources r"
                + " on r.room_info_id = i.info_id"
                + " order by p.created_at desc"
                + " limit " + POSTS_ON_HOME_PAGE;
        return jdbcTemplate.query(sql, (resultSet, i) -> {
            int postId = resultSet.getInt("post_id");
            String title = resultSet.getString("title");
            String address = resultSet.getString("address");
            BigDecimal price = resultSet.getBigDecimal("price");
            String roomType = resultSet.getString("description");
            String image = resultSet.getString("file_name");

            return new News(postId, title, address, price, roomType, image);
        });
    }

    @Override
    public List<News> getPostForRoomsPage() {
        String sql = "select p.post_id, p.is_approved, i.price, i.title, a.address, r.file_name"
                + " from room_posts p"
                + " join room_infos i"
                + " on p.info_id = i.info_id"
                + " join addresses a"
                + " on i.address_id = a.address_id"
                + " join resources r"
                + " on r.room_info_id = i.info_id";
        return jdbcTemplate.query(sql, new NewsMapper());
    }

    @Override
    public List<News> getCustomerPosts(int customerId) {
        String sql = "select p.post_id, p.is_approved, i.price, i.title, a.address, r.file_name"
                + " from room_posts p"
                + " join room_infos i"
                + " on p.info_id = i.info_id"
                + " join addresses a"
                + " on i.address_id = a.address_id"
                + " join resources r"
                + " on r.room_info_id = i.info_id"
                + " join customers c"
                + " on c.customer_id = p.customer_id"
                + " where c.customer_id = ?";
        return jdbcTemplate.query(sql, new Object[]{customerId}, new NewsMapper());
    }

    @Override
    public List<News> getNewForSearch(String search) {
        String sql = "select p.post_id, p.is_approved, i.price, i.title, a.address, r.file_name "
                + "from room_posts p "
                + "join room_infos i "
                + "on p.info_id = i.info_id "
                + "join addresses a "
                + "on i.address_id = a.address_id "
                + "join resources r "
                + "on r.room_info_id = i.info_id ";
        if (isNumeric(search)) {
            sql += "where i.price <= ? "
                    + "or i.area = ?";
            Double pr = Double.valueOf(search);
            BigDecimal price = BigDecimal.valueOf(pr);
            float area = Float.valueOf(search);
            return jdbcTemplate.query(sql, new Object[]{price, area}, new NewsMapper());
        } else {
            sql += "where a.address like ?";
            return jdbcTemplate.query(sql, new Object[]{"%" + search + "%"}, new NewsMapper());
        }
    }

    private boolean isNumeric(String s) {
        return s != null && s.matches("[-+]?\\d*\\.?\\d+");
    }

}
