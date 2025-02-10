package com.krishna.flightreservation.controllers;

import com.krishna.flightreservation.dto.ReservationUpdateRequest;
import com.krishna.flightreservation.entities.Reservation;
import com.krishna.flightreservation.repos.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ReservationRestController {


    @Autowired
    ReservationRepository reservationRepository;

    @RequestMapping("/reservations/{id}")
    public Reservation findReservation(@PathVariable("id") long id){
        return reservationRepository.findById(id).get();
    }

    @RequestMapping("/reservations")
    public Reservation updateReservation(@RequestBody ReservationUpdateRequest reservationUpdateRequest){
     Reservation reservation=reservationRepository.findById(reservationUpdateRequest.getId()).get();
     reservation.setNumberOfBags(reservationUpdateRequest.getNumberOfBags());
     reservation.setCheckedIn(reservationUpdateRequest.isCheckedIn());
     Reservation updateReservation=reservationRepository.save(reservation);
     return updateReservation;
    }
}
