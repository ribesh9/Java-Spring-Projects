package com.summerproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.summerproject.service.AdminRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	AdminRepository ar;
	
	
	
	
	@RequestMapping("dashboardadmin")
    public String showDashBoard(HttpSession session,Model m)
    {
		Object admin = session.getAttribute("username");
		if(admin!=null){
			return "dashboardadmin";
		}
		m.addAttribute("msg","Login to access");
        return "login";
    }
}
