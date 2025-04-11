package com.adi.repository;

import org.springframework.data.repository.CrudRepository;

import com.adi.pojo.UserInfo;
import java.util.Optional;


public interface UserInfoRepository extends CrudRepository<UserInfo, Integer>{
	
	Optional<UserInfo> findByEmailAndPassword(String email, String password);
	Optional<UserInfo> findByEmail(String email);
}
