package com.example.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.users.entity.Flight;
import com.example.users.service.FlightRepository;

@Controller
public class FlightController {
	
	@Autowired
	FlightRepository fr;
	
	@RequestMapping("saveTheFlight")
	public String showFlightForm() {
		return "login/SaveFlight";
	}
	
	@RequestMapping(value="saveFlight", method=RequestMethod.POST)
	public String register(@ModelAttribute("flight") Flight flight, ModelMap m) {
		fr.save(flight);
		m.addAttribute("msg","Success");
		return "login/SaveFlight";
}
	
	@RequestMapping("theFlightList")
	public String flightList(@ModelAttribute("flight") Flight flight,Model m) {
		m.addAttribute("flight",flight);
		return "login/listFlight";
	}
	
	@RequestMapping("findFlight")
	public String findFlight() {
		return "login/findFlight";
	}
}
