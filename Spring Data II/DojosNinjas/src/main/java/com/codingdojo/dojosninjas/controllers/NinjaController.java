package com.codingdojo.dojosninjas.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.dojosninjas.models.Ninja;
import com.codingdojo.dojosninjas.services.DNService;

@Controller
public class NinjaController {
	private final DNService dnservice;
	
	public NinjaController(DNService dnservice) {
		this.dnservice = dnservice;
	}
	
	@GetMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninjaObject")Ninja ninja, Model model) {
		model.addAttribute("dojosList", dnservice.getAllDojos());
		return "pages/newninja.jsp";
	}
	
	@PostMapping("/addninja")
	public String addNinja(@Valid @ModelAttribute("ninjaObject")Ninja ninja, BindingResult result) {
		if(result.hasErrors()) {
			return"pages/newninja.jsp";
		}
		else {
			dnservice.addNinja(ninja);
			return "redirect:/dojos/"+ninja.getDojo().getId();
		}
	}
}
