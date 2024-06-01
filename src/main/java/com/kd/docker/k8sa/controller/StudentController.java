package com.kd.docker.k8sa.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hub")
public class StudentController {

	@GetMapping("/message")
	public String message() {
		return "Welcome to Learning Hub";
	}
}
