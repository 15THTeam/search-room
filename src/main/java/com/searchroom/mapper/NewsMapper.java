package com.searchroom.mapper;

import com.searchroom.model.join.News;
import org.springframework.jdbc.core.RowMapper;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NewsMapper implements RowMapper<News> {

    public News mapRow(ResultSet resultSet, int i) throws SQLException {
        int postId = resultSet.getInt("post_id");
        String title = resultSet.getString("title");
        String address = resultSet.getString("address");
        BigDecimal price = resultSet.getBigDecimal("price");
        String image = resultSet.getString("file_name");
        boolean approved = resultSet.getBoolean("is_approved");

        return new News(postId, title, address, price, image, approved);
    }

}
