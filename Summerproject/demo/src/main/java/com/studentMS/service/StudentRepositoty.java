package com.studentMS.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studentMS.entity.Student;

public interface StudentRepositoty extends JpaRepository<Student,Long>{
	Student findByEmail(String email);
	
}
