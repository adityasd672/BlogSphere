package com.adi.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.adi.pojo.Comment;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

public interface CommentRepository extends CrudRepository<Comment, Integer>{
	
	List<Comment> findByPost(Post post);
	List<Comment> findByUser(UserInfo user);
}
