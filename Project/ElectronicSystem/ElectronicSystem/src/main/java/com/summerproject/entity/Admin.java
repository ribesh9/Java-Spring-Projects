package com.summerproject.entity;
import java.util.HashMap;
import java.util.Map;

import jakarta.persistence.*;

@Entity
@Table(name="admin")
public class Admin {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setEmail(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String pwd) {
		pwd = password;
	}
	public class TokenValidator {
		private static final Map<String,String> tokenMap= new HashMap<>();
		public static boolean validateToken(String token) {
			return tokenMap.containsKey(token);
		}
		public static void addToken(String token, String id) {
			tokenMap.put(token, id);
		}
		public static void removeToken(String token) {
			tokenMap.remove(token);
		}
	}
}
