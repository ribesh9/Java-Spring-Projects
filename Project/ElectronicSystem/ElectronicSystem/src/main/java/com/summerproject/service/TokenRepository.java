package com.summerproject.service;
import java.util.*;
public interface TokenRepository {
	public class TokenValidator{
		public static final Map<String,String> tokenMap =new HashMap<>();
	
	
	public static boolean validateToken(String token) {
		return tokenMap.containsKey(token);
	}
	
	public static void addToken(String token, String userid) {
		tokenMap.put(token,userid);
	}
	public static void removeToken(String token) {
		tokenMap.remove(token);
	}
}
}
