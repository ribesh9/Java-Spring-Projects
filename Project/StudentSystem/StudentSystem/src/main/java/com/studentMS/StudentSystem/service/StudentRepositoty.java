package com.studentMS.StudentSystem.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studentMS.StudentSystem.entity.Student;

public interface StudentRepositoty extends JpaRepository<Student,Long>{
	Student findByEmail(String email);
	
}
