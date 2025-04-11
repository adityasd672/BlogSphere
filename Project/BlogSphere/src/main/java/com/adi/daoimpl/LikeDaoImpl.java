package com.adi.daoimpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adi.dao.LikeDao;
import com.adi.pojo.Like;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;
import com.adi.repository.LikeRepository;

import jakarta.transaction.Transactional;

@Repository
public class LikeDaoImpl implements LikeDao{
	
	@Autowired
	private LikeRepository repository;
	
	@Override
	@Transactional
	public boolean insertLike(Like like) {
		
		try {
			repository.save(like);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public int countLikeOnPost(Post p) {
		
		int count = 0;
		try {
			count = repository.countByPost(p);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return count;
	}

	@Override
	public boolean isLikedByUser(Post p, UserInfo u) {
		
		
		try {
			Optional<Like> op = repository.findByPostAndUser(p, u);
			if(op.isPresent()) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
	}

	@Override
	@Transactional
	public boolean deleteLike(Post p, UserInfo u) {
		
		 try {
		        Optional<Like> like = repository.findByPostAndUser(p, u);
		        if(like.isPresent()) {
		        	repository.delete(like.get());
		        	return true;
		        }
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return false;
	}
}
