package com.searchroom.repository;

import com.searchroom.model.join.News;

import java.util.List;

public interface NewsRepository {

    List<News> getNewestPost();
    List<News> getPostForRoomsPage();
    List<News> getCustomerPosts(int customerId);
    List<News> getNewForSearch(String search);

}
