package com.krishna.flightreservation.controllers;

import com.krishna.flightreservation.entities.Flight;
import com.krishna.flightreservation.repos.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class FlightController {


    @Autowired
    FlightRepository flightRepository;

    @RequestMapping("flightList")
    public String flightList(Model model)
    {
        List<Flight> flights=flightRepository.findAll();
        model.addAttribute("flights",flights);
        return "listFlight";
    }

    @RequestMapping("FindFlights")
    public String findFlights(@RequestParam("from") String from, @RequestParam("to")String to, @RequestParam("departureDate") String departureDate, Model model)
    {
        List<Flight> flights=flightRepository.findFlights(from, to, departureDate);
        model.addAttribute("flights",flights);

        return "displayFlights";
    }
    @RequestMapping(value="/SaveFlight", method= RequestMethod.POST)
    public String saveFlight(@ModelAttribute("flight") Flight flight)
    {
        flightRepository.save(flight);
        return "redirect:/flightList";
    }
    @RequestMapping("createFlight")
    public String createFlight()
    {
        return "createFlight";
    }

    @RequestMapping("EditFlight")
    public String editFlight(@RequestParam("id") long id, Model model)
    {
        Optional<Flight> flight=flightRepository.findById(id);
        model.addAttribute("flight", flight);
        return "EditFlight";
    }

    @RequestMapping("DeleteFlight")
    public String deleteFlight(@RequestParam("id") long id)
    {
        flightRepository.deleteById(id);
        return "redirect:/flightList";
    }
}
