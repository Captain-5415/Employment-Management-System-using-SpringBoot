package com.cdgn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdgn.model.Employee;
import com.cdgn.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeRepository repo;

	public Employee SaveEmployee(Employee employee) {
		return repo.save(employee);
	}
	
	public Employee findByEmailAndPassword(String email, String password) {
		return repo.findByEmailAndPassword(email, password).orElse(null);
	}

	public List<Employee> findAll() {
		return repo.findAll();
	}

	public void deleteById(int id) {
		repo.deleteById(id);		
	}

	public Employee findById(int id) {
		
		return repo.findById(id).orElse(null);
	}
}
