package com.summerproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.summerproject.entity.Admin;
import com.summerproject.entity.Customer;
import com.summerproject.entity.Employee;
import com.summerproject.entity.Printingshop;
import com.summerproject.service.AdminRepository;
import com.summerproject.service.CustomerRepository;
import com.summerproject.service.EmployeeRepository;
import com.summerproject.service.PrintingShopRepository;
import jakarta.servlet.http.HttpSession;

@Controller
public class SystemController {
	
	@Autowired
	AdminRepository ar;
	
	@Autowired
	EmployeeRepository er;
	
	@Autowired
	PrintingShopRepository psr;
	
	@Autowired
	CustomerRepository cr;
	
	
	
	@RequestMapping("/")
	public String index()
	{
		return"Home";
	}
	
	@RequestMapping("/login")
    public String showLoginPage()
    {
        return "login";
    }
	
	@RequestMapping("/home")
    public String showHome()
    {
        return "Home";
    }
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@RequestParam("username") String username,HttpSession session ,@RequestParam("password") String password, ModelMap modelMap)
	{
		Admin admin = ar.findByUsername(username);
		Employee emp = er.findByUsername(username);
		Printingshop ps = psr.findByUsername(username);
		String sid = session.getId();
		if(admin!=null) {
			
			 if(admin.getPassword().equals(password)&&admin.getUsername().equals(username)&&sid!=null)
		        {
				 	
		            modelMap.addAttribute("msg","Welcome "+admin.getUsername());
		            modelMap.addAttribute("name",admin.getUsername());
		            session.setAttribute("username",admin.getUsername());
		            return"redirect:/dashboardadmin";
		        }
		        
		        }
		        if(emp!=null) {
		        	BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		       if(bpe.matches(password,emp.getPassword())&&emp.getUsername().equals(username)) {
		    	   modelMap.addAttribute("name",emp.getName());
		    	   session.setAttribute("username",emp.getUsername());	
		    	   return "redirect:/employeedash";
		        }
		       
		        }
		       if(ps!=null) {
		    	   BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		    	   if(bpe.matches(password, ps.getPassword())&&ps.getUsername().equals(username)){
		    		   modelMap.addAttribute("name",ps.getUsername());
		    		   session.setAttribute("username",ps.getUsername());	
		    		   return"redirect:/printingdash";
		    	   }
		    	 
		       }
		       modelMap.addAttribute("msg","Username and password are wrong");
		        return "login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.getAttribute("username");
		session.invalidate();
		return "redirect:/login";
	}
	
	@RequestMapping("forgotpassword")
	public String forgotpassword() {
		return "forgotpassword";
	}
	
	@RequestMapping("validateemail")
	public String validation(@RequestParam("email") String email, Model mode){
		Admin admin = ar.findByUsername(email);
		Employee emp = er.findByEmail(email);
		Printingshop ps = psr.findByEmail(email);
		if(admin!=null) {
			mode.addAttribute("admin", admin);
			return "validateemail";
		}
		
		if(emp!=null) {
			mode.addAttribute("emp", emp);
			return "forgotemp";
		}
		
		if(ps!=null) {
			mode.addAttribute("p", ps);
			return "forgotprint";
		}
		mode.addAttribute("msg", "no username found");
		return "forgotpassword";
	}
}
