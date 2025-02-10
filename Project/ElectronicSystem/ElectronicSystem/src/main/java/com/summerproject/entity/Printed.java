package com.summerproject.entity;
import jakarta.persistence.*;
@Entity
@Table(name="printed")
public class Printed {
		@Id
		@Column(name="customer_id")
		private long id;
		
		@Column(name="name")
		private String name;
		
		@Column(name="area_no")
		private long area_no;

		

		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
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

