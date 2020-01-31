package com.cognizant.fms.loginservice.repository;

import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import org.springframework.stereotype.Repository;

import reactor.core.publisher.Mono;

import com.cognizant.fms.loginservice.model.Employee;

@Repository
public interface EmployeeRepository extends ReactiveCrudRepository<Employee, String> {
	public Mono<Employee> findByUsername(String username);
} 
