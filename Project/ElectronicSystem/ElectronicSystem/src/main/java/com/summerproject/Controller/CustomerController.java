package com.summerproject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.summerproject.entity.Customer;
import com.summerproject.entity.PrintingPending;
import com.summerproject.service.CustomerRepository;
import com.summerproject.service.PrintedRepository;
import com.summerproject.service.PrintingPendingRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {
	
		@Autowired
		CustomerRepository cr;
		
		@Autowired
		PrintingPendingRepository ppr;
		
		@Autowired
		PrintedRepository pr;
		
		@RequestMapping("register")
	    public String showRegistrationPage()
	    {
	        return "register";
	    }
		
		@RequestMapping("registerviewemp")
	    public String registerviewemp()
	    {
	        return "registerviewemp";
	    }
		
		@PostMapping(value="register")
		public String register (@ModelAttribute("customer") Customer customer,
				@ModelAttribute("print")PrintingPending print,
				@RequestParam("id") long customer_id,@RequestParam("name") String name,
				@RequestParam("area_no") long area_no,ModelMap modelMap,Model model)
		{

			Customer cus = cr.findById(customer_id);
//			long id = customer_id;
//			String n = name;
//			long area = area_no;
			if(cus==null) {
				cr.save(customer);
				ppr.save(print);
				
				modelMap.addAttribute("msg","The customer has been registered");
				return "register";
			}
			else {
				modelMap.addAttribute("msg","The customer already exist");
				return "register";
			}	
		}
		
		@PostMapping(value="registerfromemp")
		public String registerfromemp (@ModelAttribute("customer") Customer customer,
				@ModelAttribute("print")PrintingPending print,
				@RequestParam("id") long customer_id,@RequestParam("name") String name,
				@RequestParam("area_no") long area_no,ModelMap modelMap,Model model)
		{

			Customer cus = cr.findById(customer_id);
//			long id = customer_id;
//			String n = name;
//			long area = area_no;
			if(cus==null) {
				cr.save(customer);
				ppr.save(print);
				
				modelMap.addAttribute("msg","The customer has been registered");
				return "registeremp";
			}
			else {
				modelMap.addAttribute("msg","The customer already exist");
				return "registerviewemp";
			}	
		}
		
		@RequestMapping("listofcustomers")
		public String customerlist(HttpSession session,Model model) {
			Object admin = session.getAttribute("username");
			if(admin==null) {
				model.addAttribute("msg", "Login first");
				return "login";
			}
			List<Customer> customer = cr.findAll();
			 model.addAttribute("customer",customer);
		     return "listofcustomers";
		}
		
		@RequestMapping("editcus")
		public String editcus(@RequestParam("id") long id, Model model,HttpSession session){
			Object user = session.getAttribute("username");
			if(user==null) {
				model.addAttribute("msg", "Login first");
				return "login";
			}
			Customer customer= cr.findById(id);
			model.addAttribute("customer",customer);
			return "editcus";
		}
		
		@RequestMapping(value="savecus", method=RequestMethod.POST)
		public String savecus(@ModelAttribute("customer") Customer customer) {
			cr.save(customer);
			System.out.println(customer.getId()+" "+customer.getArea_no()+" "+customer.getName());
			return "redirect:/listofcustomers";
			
		}
		
		@RequestMapping("deletecus")
		public String deletecus(@RequestParam("id") long id, Model model){
			cr.deleteById(id);;
			pr.deleteById(id);
			return "redirect:/listofcustomers";
		}
		
		
}
