package com.searchroom.repository;

import com.searchroom.model.join.NewPost;

public interface NewPostRepository {

    NewPost getNewPostByPostId(int postId);

}
