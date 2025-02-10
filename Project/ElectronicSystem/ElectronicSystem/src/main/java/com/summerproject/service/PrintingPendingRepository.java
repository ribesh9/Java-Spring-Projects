package com.summerproject.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.summerproject.entity.PrintingPending;

public interface PrintingPendingRepository extends JpaRepository<PrintingPending,Long>{
	PrintingPending findById(long id);
	PrintingPending findByName(String name);
}
