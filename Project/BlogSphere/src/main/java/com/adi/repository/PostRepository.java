package com.adi.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.adi.pojo.Post;
import com.adi.pojo.Category;
import com.adi.pojo.UserInfo;



public interface PostRepository extends CrudRepository<Post, Integer>{
	List<Post> getByCategory(Category category); 
	List<Post> getByUser(UserInfo user);
}
