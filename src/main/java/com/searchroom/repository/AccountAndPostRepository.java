package com.searchroom.repository;

import com.searchroom.model.join.AccountAndPost;

import java.util.List;

public interface AccountAndPostRepository {

    List<AccountAndPost> getAllAccountsAndPosts();

}
