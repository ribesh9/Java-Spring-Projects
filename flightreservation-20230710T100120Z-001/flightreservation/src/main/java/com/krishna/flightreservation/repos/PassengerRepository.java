package com.krishna.flightreservation.repos;

import com.krishna.flightreservation.entities.Passenger;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PassengerRepository extends JpaRepository<Passenger, Long> {
}
