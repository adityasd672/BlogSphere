package com.adi.dao;

import java.util.List;

import com.adi.pojo.UserInfo;

public interface UserInfoDao {
	
	boolean addNewUser(UserInfo u);
	UserInfo getUserByEmail(String email);
	boolean updateUser(UserInfo u);
	UserInfo getUser(int id);
	List<UserInfo> getAllUsers();
	boolean doesUserAlreadyExist(String email);
	boolean deleteUserById(int id);
}
