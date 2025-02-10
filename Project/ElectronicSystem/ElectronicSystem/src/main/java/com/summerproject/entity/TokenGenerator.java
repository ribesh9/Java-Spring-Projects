package com.summerproject.entity;
import java.security.*;
import java.util.Base64;
public class TokenGenerator {
	private static final SecureRandom secureRandom = new SecureRandom();
	
	public static String generateToken() {
		byte[] token= new byte[32];
		secureRandom.nextBytes(token);
		return Base64.getEncoder().encodeToString(token);
	}
}
