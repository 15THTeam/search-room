package com.searchroom.mapper;

import com.searchroom.model.join.PostDetail;
import org.springframework.jdbc.core.RowMapper;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PostDetailMapper implements RowMapper<PostDetail> {

    @Override
    public PostDetail mapRow(ResultSet resultSet, int i) throws SQLException {
        int postId = resultSet.getInt("post_id");
        String roomType = resultSet.getString("t.description");
        String title = resultSet.getString("title");
        float area = resultSet.getFloat("area");
        BigDecimal price = resultSet.getBigDecimal("price");
        String description = resultSet.getString("i.description");
        String address = resultSet.getString("address");
        String latitude = resultSet.getString("latitude");
        String longitude = resultSet.getString("longitude");
        String createdAt = resultSet.getTimestamp("created_at").toString();
        String fullName = resultSet.getString("full_name");
        String email = resultSet.getString("email");
        String phoneNumber = resultSet.getString("phone_number");
        String fileName = resultSet.getString("file_name");

        LocalDateTime dateTime
                = LocalDateTime.parse(createdAt, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
        String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy"));
        return new PostDetail(postId, title, address, price, roomType, fileName, area, description,
                latitude, longitude, formattedDate, fullName, email, phoneNumber);
    }

}
