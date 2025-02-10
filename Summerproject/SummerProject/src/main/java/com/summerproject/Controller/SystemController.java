package com.summerproject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping("register")
    public String showRegistrationPage()
    {
        return "register";
    }
	
	@RequestMapping("dashboardadmin")
    public String showDashBoard()
    {
        return "dashboardadmin";
    }
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, ModelMap modelMap, Model model)
	{
		Admin admin = ar.findByUsername(username);
		Employee emp = er.findByUsername(username);
		Printingshop ps = psr.findByUsername(username);
		if(admin!=null) {
			 if(admin.getPassword().equals(password)&&admin.getUsername().equals(username))
		        {
		            modelMap.addAttribute("msg","Welcome "+admin.getUsername());
		            modelMap.addAttribute("name",admin.getUsername());
		            return"dashboardadmin";
		        }
		        
		        }
		        if(emp!=null) {
		       if(emp.getPassword().equals(password)&&emp.getUsername().equals(username)) {
		    	   modelMap.addAttribute("name",emp.getName());
		    	   return "register";
		        }
		       
		        }
		       if(ps!=null) {
		    	   if(ps.getPassword().equals(password)&&ps.getUsername().equals(username)){
		    		   modelMap.addAttribute("name",ps.getUsername());
		    		   return"register";
		    	   }
		    	 
		       }
		       modelMap.addAttribute("msg","Username and password are wrong");
		        return "login";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register (@ModelAttribute("customer") Customer customer, @RequestParam("customer_id") long customer_id,@RequestParam("name") String name,@RequestParam("area_no") long area_no,ModelMap modelMap)
	{
		Customer cus = cr.findById(customer_id);
		if(cus!=null) {
			if(customer.getCustomer_id()==customer_id) {
				modelMap.addAttribute("msg","Sorry! Your card has already been registered"); 
				return "register";
			}
		}
			else {
				cr.save(customer);
				modelMap.addAttribute("msg",customer.getName()+"Has been registered");
		
			}
		return "register";
	}
	
	@RequestMapping("listofemployee")
	public String employeelist(Model model) {
		List<Employee> employee = er.findAll();
		 model.addAttribute("employee",employee);
	     return "listofemployee";
	}
	
}
