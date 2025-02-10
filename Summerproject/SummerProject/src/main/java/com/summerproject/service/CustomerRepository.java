package com.summerproject.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.summerproject.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer,Long>{
	Customer findById (long customer_id);
}
