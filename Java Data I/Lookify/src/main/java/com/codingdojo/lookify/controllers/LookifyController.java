package com.codingdojo.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lookify.models.Lookify;
import com.codingdojo.lookify.services.LookifyService;

@Controller
public class LookifyController {
	private final LookifyService lookifyService;
	
	public LookifyController(LookifyService lookifyService) {
		this.lookifyService = lookifyService;
	}
	
	//Pagina de Bienvenida
	@RequestMapping("/")
	public String index(Model model) {
		return "Lookify/index.jsp";
	}
	
	//Pagina de inicio
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Lookify> songs = lookifyService.allLookify();
		model.addAttribute("songs", songs);
		return "Lookify/dashboard.jsp";
	}
	
	//Pagina de la cancion
	@RequestMapping("/songs/{id}")
	public String songs(@PathVariable("id") Long id, Model model) {
		Lookify lookify = lookifyService.findLookify(id);
		model.addAttribute("lookify", lookify);
		return "Lookify/song.jsp";
	}
	
	//Pagina para agregar nueva cancion
	@RequestMapping("/songs/new")
	public String addNew(@ModelAttribute("addNew") Lookify lookify, Model model) {
		return "Lookify/new.jsp";
	}
	
	@RequestMapping(value="/process", method = RequestMethod.POST)
	public String process(@Valid @ModelAttribute("addNew") Lookify lookify, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Lookify> songs = lookifyService.allLookify();
			model.addAttribute("songs", songs);
			return "Lookify/new.jsp";
		}
		else {
			lookifyService.addLookify(lookify); 
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		lookifyService.deleteLookify(id);
		return "redirect:/dashboard";
	}
	
	@RequestMapping("/search/{artist}")
	public String search(@PathVariable("artist") String artist, Model model) {
		List<Lookify> songs = lookifyService.getSearchLookify(artist);
		model.addAttribute("artist", artist);
		model.addAttribute("songs", songs);
		return "Lookify/search.jsp";
	}
	
	@RequestMapping("/search/topten")
	public String topten(Model model) {
		List<Lookify> songs = lookifyService.getToTen();
		model.addAttribute("songs", songs);
		return "Lookify/topten.jsp";
	}
	
	@RequestMapping("/search")
	public String search(@RequestParam("artist") String artist) {
		return "redirect:/search/" + artist;
	}
	
	
}
