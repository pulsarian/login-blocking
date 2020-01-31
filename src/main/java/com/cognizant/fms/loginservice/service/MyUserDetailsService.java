package com.cognizant.fms.loginservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.ReactiveUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


import com.cognizant.fms.loginservice.model.Employee;
import com.cognizant.fms.loginservice.repository.EmployeeRepository;


import reactor.core.publisher.Mono;

@Service
public class MyUserDetailsService implements ReactiveUserDetailsService {

	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Override
	public Mono<UserDetails> findByUsername(String name) {
	
		return employeeRepository.findByUsername(name)
				.switchIfEmpty(Mono.defer(() -> {
					return Mono.error(new UsernameNotFoundException("Employee Not Found!"));
				}))
				.map((emp) -> new Employee(emp.getUsername()));	
	}

}