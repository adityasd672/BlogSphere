package com.adi.daoimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adi.dao.CommentDao;
import com.adi.pojo.Comment;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;
import com.adi.repository.CommentRepository;

import jakarta.transaction.Transactional;

@Repository
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	private CommentRepository repository;

	@Override
	@Transactional
	public boolean insertComment(Comment c) {
		
		try {
			repository.save(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Comment> getCommentsUsingPost(Post p) {
		
		List<Comment> lst = new ArrayList<Comment>();
		try {
			
			lst = repository.findByPost(p);
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
		return lst;
	}

	@Override
	public List<Comment> getCommentsUsingUser(UserInfo u) {
		List<Comment> lst = new ArrayList<Comment>();
		try {
			lst = repository.findByUser(u);
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
		return lst;
	}

	@Override
	@Transactional
	public boolean deleteComment(Comment c) {
		try {
			repository.delete(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Comment getCommentUsingId(int comId) {
		Optional<Comment> op = null;
		try {
			op = repository.findById(comId);
			if(op.isPresent()) {
				return op.get();
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
