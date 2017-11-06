package com.searchroom.repository;

import com.searchroom.model.join.News;

import java.util.List;

public interface NewsRepository {

    List<News> getNewestPost();
    List<News> getPostForRoomsPage(int currentPage, int roomsPerPage);
    List<News> getCustomerPosts(int customerId, int currentPage, int roomsPerPage);
    List<News> getNewForSearch(String search);

}
