package com.tech.ms.controller;


import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

@Controller("/api/v1")
public class BaseController {
	
	@Get("/getHealth")
	public String getCustomer()
	{
		return "UP";
	}

}
