package com.summerproject.entity;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name="customer")
public class Customer {
	@Id
	@Column(name="customer_id")
	@NotNull(message="the cutomer id cannot be blank")
	private long customer_id;
	
	@Column(name="name")
	@NotNull(message="Field is empty")
	private String name;
	
	@Column(name="area_no")
	@NotNull(message="Field is empty")
	private long area_no;

	public long getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(long customer_id) {
		this.customer_id = customer_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getArea_no() {
		return area_no;
	}

	public void setArea_no(long area_no) {
		this.area_no = area_no;
	}
	
	
}