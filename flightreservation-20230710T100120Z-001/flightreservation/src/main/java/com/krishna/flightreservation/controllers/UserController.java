package com.krishna.flightreservation.controllers;

import com.krishna.flightreservation.entities.Flight;
import com.krishna.flightreservation.entities.User;
import com.krishna.flightreservation.repos.FlightRepository;
import com.krishna.flightreservation.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    FlightRepository flightRepository;

    @RequestMapping("showReg")
    public String showRegistrationPage()
    {
        return "login/registerUser";
    }

    @RequestMapping("login")
    public String showLoginPage()
    {
        return "login/login";
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
            List<Flight> listFlight=flightRepository.findAll();
            model.addAttribute("flightList", listFlight);
            return "findFlights";
        }
        else
        {
            modelMap.addAttribute("msg","User Name and Password are wrong");
        }
        return "login/login";
    }

}
