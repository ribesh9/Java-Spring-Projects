package com.studentMS.StudentSystem.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.studentMS.StudentSystem.entity.Admin;
import com.studentMS.StudentSystem.entity.Student;
import com.studentMS.StudentSystem.service.AdminRepository;
import com.studentMS.StudentSystem.service.StudentRepositoty;

@Controller
public class StudentContoller {

	@Autowired
	StudentRepositoty stdrepo;
	
	@Autowired
	AdminRepository adrepo;
	
	@RequestMapping("/")
	public String index()
	{
		return"home";
	}
	
	@RequestMapping("/login")
    public String showLoginPage()
    {
        return "login";
    }
	
	@RequestMapping("/home")
    public String showHome()
    {
        return "home";
    }
	@RequestMapping("showReg")
    public String showRegistrationPage()
    {
        return "register";
    }
 
 @RequestMapping(value="registerUser", method=RequestMethod.POST)
    public String register(@ModelAttribute("student") Student student,@RequestParam("email") String email,ModelMap modelMap)
    {
	 if(student.getEmail().equals(email)) {
		 modelMap.addAttribute("msg","Sorry! Your email already has been registered");
		 return "register";
	 }
	 else {
	 stdrepo.save(student);
	 modelMap.addAttribute("msg","Success");
	 }
	 return "login";
    }
 
 @RequestMapping(value="updateuser", method=RequestMethod.POST)
 public String update(@ModelAttribute("student") Student student) {
	 stdrepo.save(student);
	 return "redirect:/listofStudent";
 }
 
 @RequestMapping(value="login",method=RequestMethod.POST)
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, ModelMap modelMap, Model model)
    {
        Student student=stdrepo.findByEmail(email);
        Admin admin = adrepo.findByEmail(email);
        if(student!=null) {
        if(student.getPassword().equals(password)&&student.getEmail().equals(email))
        {
            modelMap.addAttribute("msg","Thank you for login "+student.getEmail());
           
            return"registrationsuccess";
        }
        else
        {
            modelMap.addAttribute("msg","UserName and Password are wrong");
        }
        }
        if(admin!=null) {
       if(admin.getPassword().equals(password)&&admin.getEmail().equals(email)) {
        	return "redirect:/listofStudent";
        }
       else
       {
           modelMap.addAttribute("msg","UserName and Password are wrong");
       }
        }
        return "login";
    }
 
 @RequestMapping("listofStudent")
 public String studentlist(Model model)
 {
     List<Student> std=stdrepo.findAll();
     model.addAttribute("admin",std);
     return "listofStudents";
 }
 
 @RequestMapping("listofAdmin")
 public String adminList(Model model) {
	 List<Admin> admin = adrepo.findAll();
     model.addAttribute("admin",admin);
     return "listofAdmin";
 }
 
 @RequestMapping("Editstd")
 public String editFlight(@RequestParam("id") long id,@RequestParam("email") String email, Model model)
 {
	 Optional<Student> std=stdrepo.findById(id);
     model.addAttribute("stds", std);
     return "Editstd";
 }

 @RequestMapping("Deletestd")
 public String deleteFlight(@RequestParam("id") long id)
 {
	 stdrepo.deleteById(id);
     return "redirect:/listofStudent";
 }
 
 @RequestMapping("registrationsuccess")
 public String scc() {
	 return "registrationsuccess";
 }
}
