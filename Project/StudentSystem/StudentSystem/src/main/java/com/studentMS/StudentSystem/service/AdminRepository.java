package com.studentMS.StudentSystem.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studentMS.StudentSystem.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin,Long>{
		Admin findByEmail(String email);
}
