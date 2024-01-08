package com.shengliangyu.sso.repository;

import com.shengliangyu.sso.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
