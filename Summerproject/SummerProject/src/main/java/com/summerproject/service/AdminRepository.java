package com.summerproject.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.summerproject.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin,Long>{
		Admin findByUsername(String username);
		Admin findByPassword(String password);
}