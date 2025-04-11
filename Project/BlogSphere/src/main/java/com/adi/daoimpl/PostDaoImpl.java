package com.adi.daoimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.adi.dao.PostDao;
import com.adi.pojo.Category;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;
import com.adi.repository.CategoryRepository;
import com.adi.repository.PostRepository;

import jakarta.transaction.Transactional;

@Repository
public class PostDaoImpl implements PostDao{

	@Autowired
	private PostRepository repository;
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<Category> getAllCategories() {
		
		List<Category> lst = new ArrayList<Category>();
		
		try {
			lst = (List<Category>) categoryRepository.findAll();
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
	}

	@Override
	@Transactional
	public boolean savePost(Post p) {
		
		try {
			repository.save(p);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Category getCategoryUsingId(int cid) {
		
		Optional<Category> c = null;
		try {
			c = categoryRepository.findById(cid);
			if(c.isPresent()) {
				return c.get();
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Post> getAllPosts() {
		
		List<Post> lst = new ArrayList<Post>();
		try {
			lst = (List<Post>) repository.findAll();
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
	}

	@Override
	public List<Post> getPostsByCategoryId(int cid) {
		
		List<Post> lst = new ArrayList<Post>();
		try {
			Optional<Category> op = categoryRepository.findById(cid);
			if(op.isPresent()) {
				lst = repository.getByCategory(op.get());
				return lst;
			}
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
		
		return lst;
	}

	@Override
	public Post getPostById(int pId) {
		
		
		try {
			Optional<Post> op = repository.findById(pId);
			if(op.isPresent()) {
				return op.get();
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	@Transactional
	public boolean updatePost(Post p) {
		
		try {
			Optional<Post> op = repository.findById(p.getPid());
			if(op.isPresent()) {
				repository.save(p);
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
	public boolean deletePost(Post p) {
		
		try {
			repository.delete(p);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Post> getPostByUser(UserInfo u) {
		
		List<Post> lst = new ArrayList<Post>();
		try {
			lst = repository.getByUser(u);
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
		
	}

	@Override
	@Transactional
	public boolean deleteCategoryUsingId(int cid) {
		
		
		try {
			Optional<Category> op = categoryRepository.findById(cid);
			if(op.isPresent()) {
				categoryRepository.delete(op.get());
				return true;
			}
			return false;
		} catch (Exception e) {
			return false;
		}
		
	}

	@Override
	@Transactional
	public boolean saveCategory(Category cat) {
		
		try {
			categoryRepository.save(cat);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	
}
