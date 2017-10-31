package com.searchroom.repository;

import com.searchroom.model.join.PostDetail;

public interface PostDetailRepository {

    PostDetail getPostDetail(int postId);
    PostDetail getPostToSave(int postId);

}
