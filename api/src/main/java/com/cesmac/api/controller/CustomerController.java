package com.cesmac.api.controller;

import com.cesmac.api.domain.Customer;
import com.cesmac.api.domain.Pet;
import com.cesmac.api.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/customers")
public class CustomerController {
	
	@Autowired
	private CustomerRepository customerRepository;

	// @PreAuthorize("hasRole('ROLE_LIST_USERS')")
	@GetMapping
	public ResponseEntity<Page<Customer>> index(Pageable pageable) {
		return ResponseEntity.ok().body(this.customerRepository.findAll(pageable));
	}
	
	// @PreAuthorize("hasRole('ROLE_READ_USER')")
	@GetMapping("{id}")
	public ResponseEntity<Customer> get(@PathVariable("id") Long id) {
		return this.customerRepository.findById(id).map(u -> {
			return ResponseEntity.ok().body(u);
		}).orElse(ResponseEntity.notFound().build());
	}
	
	@PostMapping
	public ResponseEntity<?> save(@Valid @RequestBody Customer customer) {
		if (this.customerRepository.findByEmail(customer.getEmail()).isPresent()) {
			Map<String, Object> result = new HashMap<>();
			result.put("errors", "Email já cadastrado.");
			return new ResponseEntity<Map<String, Object>>(result, HttpStatus.CONFLICT);
		}
		for (Pet p : customer.getPets()) {
			p.setCustomer(customer);
		}
		return new ResponseEntity<Customer>(this.customerRepository.save(customer), HttpStatus.CREATED);
	}
	
	// @PreAuthorize("hasRole('ROLE_UPDATE_USER')")
	@PutMapping("{id}")
	public ResponseEntity<Customer> update(@Valid @PathVariable("id") Long id, @RequestBody Customer customer) {
		return this.customerRepository.findById(id).map(u -> {
			for (Pet p : u.getPets()) {
				p.setCustomer(null);
			}
			for (Pet p : customer.getPets()) {
				p.setCustomer(customer);
			}
			return ResponseEntity.ok().body(this.customerRepository.save(customer));
		}).orElse(ResponseEntity.notFound().build());
	}
	
	// @PreAuthorize("hasRole('ROLE_DELETE_USER')")
	@DeleteMapping("{id}")
	public ResponseEntity<?> delete(@Valid @PathVariable("id") Long id) {
		return this.customerRepository.findById(id).map(u -> {
			this.customerRepository.deleteById(id);
			
			return ResponseEntity.ok().body(u);
		}).orElse(ResponseEntity.notFound().build());
	}
}
