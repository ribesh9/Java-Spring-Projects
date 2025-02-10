package com.summerproject.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.summerproject.entity.Printingshop;

public interface PrintingShopRepository extends JpaRepository<Printingshop,Long>{
	Printingshop findByUsername (String username);
	Printingshop findByPassword (String password);
	Printingshop findByEmail (String email);
}
