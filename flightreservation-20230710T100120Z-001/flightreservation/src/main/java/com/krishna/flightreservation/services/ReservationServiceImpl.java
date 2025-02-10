package com.krishna.flightreservation.services;

import com.krishna.flightreservation.dto.ReservationRequest;
import com.krishna.flightreservation.entities.Flight;
import com.krishna.flightreservation.entities.Passenger;
import com.krishna.flightreservation.entities.Reservation;
import com.krishna.flightreservation.repos.FlightRepository;
import com.krishna.flightreservation.repos.PassengerRepository;
import com.krishna.flightreservation.repos.ReservationRepository;
import com.krishna.flightreservation.util.EmailUtil;
import com.krishna.flightreservation.util.PDFGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReservationServiceImpl implements ReservationService {


    @Autowired
    FlightRepository flightRepository;

    @Autowired
    PassengerRepository passengerRepository;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    PDFGenerator pdfGenerator;

    @Autowired
    EmailUtil emailUtil;

    @Override
    public Reservation bookFlight(ReservationRequest reservationRequest) {

        long flightId=reservationRequest.getFlightId();
        Flight flight= flightRepository.findById(flightId).get();

        Passenger passenger=new Passenger();
        passenger.setFirstName(reservationRequest.getPassengerFirstName());
        passenger.setLastName(reservationRequest.getPassengerLastName());
        passenger.setEmail(reservationRequest.getPassengerEmail());
        passenger.setPhone(reservationRequest.getPassengerPhone());
        Passenger savedPassenger=passengerRepository.save(passenger);

        Reservation reservation=new Reservation();
        reservation.setFlight(flight);
        reservation.setPassenger(savedPassenger);
        reservation.setCheckedIn(false);

        Reservation savedReservation=reservationRepository.save(reservation);

        String filePath="/Users/krishnapandey/IdeaProjects/flightreservation/reservation"+savedReservation.getId()+".pdf";
        pdfGenerator.generateItinerary(savedReservation,filePath);
        emailUtil.sendItinerary(passenger.getEmail(),filePath);
        return reservation;
    }
}
