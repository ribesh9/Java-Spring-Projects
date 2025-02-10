package com.krishna.flightreservation.services;

import com.krishna.flightreservation.dto.ReservationRequest;
import com.krishna.flightreservation.entities.Reservation;

public interface ReservationService {
    public Reservation bookFlight(ReservationRequest reservationRequest);
}
