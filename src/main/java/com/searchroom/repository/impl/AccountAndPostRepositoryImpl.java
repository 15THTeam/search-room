package com.searchroom.repository.impl;

import com.searchroom.mapper.AccountAndPostMapper;
import com.searchroom.model.join.AccountAndPost;
import com.searchroom.repository.AccountAndPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AccountAndPostRepositoryImpl implements AccountAndPostRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<AccountAndPost> getAllAccountsAndPosts() {
        String sql = "select a.username, a.role, count(r.post_id) as posts "
                + "from accounts a "
                + "left join customers c "
                + "on a.username = c.username "
                + "left join room_posts r "
                + "on r.customer_id = c.customer_id "
                + "group by a.username";
        return jdbcTemplate.query(sql, new AccountAndPostMapper());
    }

}
