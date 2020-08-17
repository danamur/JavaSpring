package com.codingdojo.relationships.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.relationships.models.License;
import com.codingdojo.relationships.models.Person;
import com.codingdojo.relationships.services.LicenseService;
import com.codingdojo.relationships.services.PersonService;

@Controller
public class LicenseController {
	private final LicenseService licenseService;
	
	public LicenseController(LicenseService licenseService) {
		this.licenseService = licenseService;
	}

	@Autowired
	private PersonService personService;
	
	@RequestMapping("/newLicense")
	public String newLicense(@ModelAttribute("licenseObject") License license, Model model) {
		List<Person> personslist = personService.allPerson();
		model.addAttribute("personslist", personslist);
		ArrayList<String> states = new ArrayList<String>(Arrays.asList("Algarrobo","Cabildo","Calle Larga","Cartagena",
				"Casablanca","Catemu","Concon","El Melon","El Quisco","El Tabo","Hijuelas","La Calera","La Cruz","La Ligua",
				"Las Ventanas","Limache","Llaillay","Los Andes","Nogales","Olmue","Placilla de Penuelas","Putaendo","Quillota",
				"Quilpue","Quintero","Rinconada","San Antonio","San Esteban","San Felipe","Santa Maria","Santo Domingo",
				"Valparaiso","Villa Alemana","Villa Los Almendros","Vina del Mar"));
		model.addAttribute("states", states);
		return "DriversLicense/newlicense.jsp";
	}
	
	@RequestMapping(value="/addlicense", method=RequestMethod.POST)
	public String addlicense(@Valid @ModelAttribute("licenseObject") License license, BindingResult result) {
		if (result.hasErrors()) {
			return "DriversLicense/newlicense.jsp";
		}
		else {
			String number = licenseService.generateLicenseNumber();
			license.setNumber(number);
			licenseService.addLicense(license);
			return "redirect:/person/" +license.getId();
		}
	}
}