package com.krishna.flightreservation.controllers;

import com.krishna.flightreservation.dto.ReservationRequest;
import com.krishna.flightreservation.entities.Flight;
import com.krishna.flightreservation.entities.Reservation;
import com.krishna.flightreservation.repos.FlightRepository;
import com.krishna.flightreservation.services.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {


    @Autowired
    FlightRepository flightRepository;

    @Autowired
    ReservationService reservationService;


    @RequestMapping("showCompleteReservation")
    public String showCompleteReservation(@RequestParam("flightId") long flightId,ModelMap modelMap)
    {
        Flight flight= flightRepository.findById(flightId).get();
        modelMap.addAttribute("flight",flight);
        return "completeReservation";
    }

    @RequestMapping(value="completeReservation", method=RequestMethod.POST)
    public String completeReservation(ReservationRequest reservationRequest, ModelMap modelMap)
    {
        Reservation reservation=reservationService.bookFlight(reservationRequest);
        modelMap.addAttribute("msg","Reservation Confirmation Successfully and the ID is: "+reservation.getId());
        return "reservationConfirmation";

    }
}
