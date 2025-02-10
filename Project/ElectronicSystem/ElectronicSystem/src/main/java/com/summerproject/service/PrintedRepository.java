package com.summerproject.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.summerproject.entity.Printed;

public interface PrintedRepository extends JpaRepository<Printed,Long> {
	Printed findById(long id);
	Printed findByName(String name);
}
