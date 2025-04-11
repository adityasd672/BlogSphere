package com.adi.daoimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.adi.dao.UserInfoDao;
import com.adi.pojo.UserInfo;
import com.adi.repository.UserInfoRepository;

import jakarta.transaction.Transactional;

@Repository
public class UserInfoDaoImpl implements UserInfoDao{

	@Autowired
	private UserInfoRepository repository;

	@Override
	@Transactional
	public boolean addNewUser(UserInfo u) {
		
		try {
			repository.save(u);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public UserInfo getUserByEmail(String email) {
		
		
		try {
			Optional<UserInfo> op = repository.findByEmail(email);
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
	public boolean updateUser(UserInfo u) {
		
		try {
			if(repository.existsById(u.getId())) {
				repository.save(u);
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public UserInfo getUser(int id) {
		
		
		try {
			Optional<UserInfo> op = repository.findById(id);
			if(op.isPresent()) {
				return op.get();
			}
			else return null;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<UserInfo> getAllUsers() {
		List<UserInfo> lst = new ArrayList<UserInfo>();
		try {
			lst = (List<UserInfo>) repository.findAll();
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
	}

	@Override
	public boolean doesUserAlreadyExist(String email) {
		
		boolean b = false;
		try {
			Optional<UserInfo> op = repository.findByEmail(email);
			if(op.isPresent()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return b;
	}

	@Override
	@Transactional
	public boolean deleteUserById(int id) {
		
		
		try {
			repository.deleteById(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
	
	
}
