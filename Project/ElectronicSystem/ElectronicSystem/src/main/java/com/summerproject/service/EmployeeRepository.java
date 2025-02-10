package com.summerproject.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.summerproject.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee,Long>{
	Employee findByUsername(String username);
	Employee findByPassword(String password);
	Employee findByEmail(String email);
	Employee findById(long id);
}
