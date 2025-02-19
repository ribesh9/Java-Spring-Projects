package com.example.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.users.entity.User;
import com.example.users.service.UserRepository;

@Controller
public class UserController {

	
	
	 @Autowired
	 UserRepository userRepository;
	 
	 
	 @RequestMapping("/login")
	    public String showLoginPage()
	    {
	        return "login/login";
	    }
	 
	 @RequestMapping("showReg")
	    public String showRegistrationPage()
	    {
	        return "login/registerUser";
	    }
	 
	 @RequestMapping(value="registerUser", method=RequestMethod.POST)
	    public String register(@ModelAttribute("user") User user)
	    {
	        userRepository.save(user);
	        return "login/login";
	    }    
	 
	 
	 @RequestMapping(value="login",method=RequestMethod.POST)
	    public String login(@RequestParam("email") String email, @RequestParam("password") String password, ModelMap modelMap, Model model)
	    {
	        User user=userRepository.findByEmail(email);
	        if(user.getPassword().equals(password))
	        {
	            modelMap.addAttribute("msg","Success");
	        }
	        else
	        {
	            modelMap.addAttribute("msg","User Name and Password are wrong");
	        }
	        return "login/login";
	    }
	 
}
