package com.adi.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.adi.pojo.Like;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;


public interface LikeRepository extends CrudRepository<Like, Integer>{
	
	List<Like> findByPost(Post post);
	int countByPost(Post post);
	Optional<Like> findByPostAndUser(Post post, UserInfo user);

	
}
