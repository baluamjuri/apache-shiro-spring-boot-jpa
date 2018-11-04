package com.brandix.shiro.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.brandix.shiro.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, String>{

}
