package com.codingdojo.relationships.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.relationships.models.Person;
import com.codingdojo.relationships.services.LicenseService;
import com.codingdojo.relationships.services.PersonService;

@Controller
public class PersonController {
	private final PersonService personService;
	private final LicenseService licenseService;
	
	public PersonController(PersonService personService, LicenseService licenseService) {
		this.personService = personService;
		this.licenseService = licenseService;
	}

	@RequestMapping(value="/addperson", method=RequestMethod.POST)
	public String addperson(@Valid @ModelAttribute("personObject") Person person, BindingResult result) {
		if (result.hasErrors()) {
			return "DriversLicense/newperson.jsp";
		}
		else {
			personService.addPerson(person);
			return "redirect:newLicense";
		}
	}
	
	@RequestMapping("/newPerson")
	public String newPerson(@ModelAttribute("personObject") Person person, Model model) {
		return "DriversLicense/newperson.jsp";
	}
	
	
	@RequestMapping("/person/{id}")
	public String viewDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("license", licenseService.getLicense(id).get());
		return "DriversLicense/view.jsp";
	}
}