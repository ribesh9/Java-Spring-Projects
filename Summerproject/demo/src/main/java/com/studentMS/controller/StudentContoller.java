package com.studentMS.controller;

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

import com.studentMS.entity.Admin;
import com.studentMS.entity.Student;
import com.studentMS.service.AdminRepository;
import com.studentMS.service.StudentRepositoty;

@Controller
public class StudentContoller {

	@Autowired
	StudentRepositoty stdrepo;
	
	@Autowired
	AdminRepository adrepo;
	
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
    public String register(@ModelAttribute("student") Student student, ModelMap modelMap)
    {
	 stdrepo.save(student);
	 modelMap.addAttribute("msg","Success");
        return "login";
        
    }
 
 
 @RequestMapping(value="login",method=RequestMethod.POST)
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, ModelMap modelMap, Model model)
    {
        Student student=stdrepo.findByEmail(email);
        Admin admin = adrepo.findByEmail(email);
        
       
        if(student.getPassword().equals("admin")) {
        	return "listofStudents";
        }
        else if(student.getPassword().equals(password))
        {
            modelMap.addAttribute("msg","Success");
            return"home";
        }
        else
        {
            modelMap.addAttribute("msg","UserName and Password are wrong");
        }
        return "login";
    }
 
 @RequestMapping("listofStudent")
 public String studentlist(Model model)
 {
     List<Student> std=stdrepo.findAll();
     model.addAttribute("std",std);
     return "listofStudents";
 }
 
 @RequestMapping("Editstd")
 public String editFlight(@RequestParam("id") long id, Model model)
 {
     Optional<Student> std=stdrepo.findById(id);
     model.addAttribute("std", std);
     return "EditStudent";
 }

 @RequestMapping("Deletestd")
 public String deleteFlight(@RequestParam("id") long id)
 {
	 stdrepo.deleteById(id);
     return "redirect:/listofStudents";
 }
 
 
}
