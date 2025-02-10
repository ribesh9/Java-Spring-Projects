package com.studentMS.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studentMS.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin,Long>{
		Admin findByEmail(String email);
}
