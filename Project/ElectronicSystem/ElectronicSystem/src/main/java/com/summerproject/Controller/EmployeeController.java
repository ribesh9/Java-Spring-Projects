package com.summerproject.Controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.summerproject.entity.Employee;
import com.summerproject.entity.PrintingPending;
import com.summerproject.service.EmployeeRepository;
import com.summerproject.service.PrintingPendingRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeRepository er;
	
	@Autowired
	PrintingPendingRepository ppr;
	
	@RequestMapping("addemp")
	public String showAddemp(HttpSession session) {
	Object admin = session.getAttribute("username");
	if(admin==null) {
		return "redirect:/logout";
	}
		return "addemp";
	}

@RequestMapping(value="saveemp", method=RequestMethod.POST)
public String addemp(@Valid @ModelAttribute("employee") Employee employee, BindingResult result,
		@RequestParam("email") String email, Model model) 
{
	if(result.hasFieldErrors()) {
		model.addAttribute("msg", "Error in fields"+result.getErrorCount());
		return "addemp";
	}
	else {
	Employee emp = er.findByEmail(email);
	if(emp!=null) {
		if(emp.getEmail().equals(email)) {
			model.addAttribute("msg","The employee already exist or the email is duplicate");
			return "editemp";
		}
	}
		else {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			String pass=bpe.encode(employee.getPassword());
			employee.setPassword(pass);
			er.save(employee);
			System.out.println(email);
		}
	}
	return"redirect:/listofemployee";
	
}

@RequestMapping("listofemployee")
public String employeelist(HttpSession session,Model model) {
	Object admin = session.getAttribute("username");
	if(admin==null) {
		model.addAttribute("msg", "Login first");
		return "login";
	}
	List<Employee> employee = er.findAll();
	 model.addAttribute("employee",employee);
     return "listofemployee";
}

@RequestMapping("editemp")
public String editemp(@RequestParam("id") long id, Model model,HttpSession session){
	Object user = session.getAttribute("username");
	if(user==null) {
		model.addAttribute("msg", "login first");
		return "login";
	}
	Employee employee = er.findById(id);
	model.addAttribute("employee",employee);
	return "editemp";
}

@RequestMapping(value="saveemployee", method=RequestMethod.POST)
public String saveemployee(@ModelAttribute("employee")Employee employee,@RequestParam("id") long id) {
	er.save(employee);
	return "redirect:/listofemployee";
}

@RequestMapping(value="savepassword", method=RequestMethod.POST)
public String savepassword(@ModelAttribute("employee")Employee employee,Model m,@RequestParam("id") long id) {
	Employee e = er.findById(id);
	BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
	String pass=bpe.encode(employee.getPassword());
	employee.setPassword(pass);
	er.save(employee);
	m.addAttribute("msg", "Successfull");
	return "login";
}

@RequestMapping("deleteemp")
public String deleteemp(@RequestParam("id") long id, Model model){
	er.deleteById(id);;
	return "redirect:/listofemployee";
}

@RequestMapping("employeedash")
public String employeedash(HttpSession session, Model m) {
	Object emp = session.getAttribute("username");
	if(emp!=null) {
	return"employeedash";
	}
	else {
		m.addAttribute("msg","Login to access");
		return"login";
	}
}

@RequestMapping("pendingViewforemp")
public String Pending(Model model) {
	List<PrintingPending> p = ppr.findAll();
	 model.addAttribute("customers",p);
	return "pendingViewforemp";
}

}
