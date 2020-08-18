package com.codingdojo.dojosninjas.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.dojosninjas.models.Dojo;
import com.codingdojo.dojosninjas.services.DNService;

@Controller
public class DojoController {
	private final DNService dnservice;
	
	public DojoController(DNService dnservice) {
		this.dnservice = dnservice;
	}
	
	@GetMapping("/dojos/new")
	public String newDojo(@ModelAttribute("dojoObject")Dojo dojo) {
		return "pages/newdojo.jsp";
	}
	
	@RequestMapping ("/adddojo")
	public String addDojo(@Valid @ModelAttribute("dojoObjeto")Dojo dojo,BindingResult result) {
		if(result.hasErrors()) {
			return"pages/newdojo.jsp";
		}
		else {
			dnservice.addDojo(dojo);
			return"redirect:/ninjas/new";
		}
	}
	
	@RequestMapping("/dojos/{dojoId}")
	public String showDojo(@PathVariable("dojoId")long id, Model model) {
		Dojo dojo = dnservice.dojoSingle(id);
		model.addAttribute("dojo", dojo);
		return"pages/show.jsp";
	}
}
