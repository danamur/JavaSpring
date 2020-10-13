package com.danielnamur.JavaBelt.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.danielnamur.JavaBelt.models.Rating;
import com.danielnamur.JavaBelt.models.TvShow;
import com.danielnamur.JavaBelt.models.User;
import com.danielnamur.JavaBelt.service.RatingService;
import com.danielnamur.JavaBelt.service.TvShowService;
import com.danielnamur.JavaBelt.service.UserService;

@Controller
public class TvShowController {
	private final UserService userService;
	private final TvShowService tvShowService;
	private final RatingService ratingService;
	
	public TvShowController(UserService userService, TvShowService tvShowService, RatingService ratingService) {
		this.userService = userService;
		this.tvShowService = tvShowService;
		this.ratingService = ratingService;
	}
	
	//Inicio
	@RequestMapping("/tvshows")
	public String allTvShows(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long id = (Long) session.getAttribute("userId");
		User u = userService.findUserById(id);
		model.addAttribute("user", u);
		
		List<TvShow> tvshows = tvShowService.allShows();
		model.addAttribute("tvshows", tvshows);
		return "/main.jsp";
	}
	
	//nuevo TvShow
	@RequestMapping("/tvshows/new")
	public String newTvShow(@ModelAttribute("tvshow") TvShow tvshow) {
		return "/newTvShow.jsp";
	}
	
	@RequestMapping(value="/tvshows/create", method=RequestMethod.POST)
	public String createTvShow(@Valid @ModelAttribute("tvshow") TvShow tvshow, BindingResult result, @RequestParam(value="title") String title) {
		boolean isAuth = tvShowService.authTvShow(title);
		if(isAuth) {
			if (result.hasErrors()) {
	            return "/new.jsp";
	        } else {
	        		tvShowService.createTvShow(tvshow);
	        		return "redirect:/tvshows";
	        }
		} else {
			return "redirect:/tvshowerror";
		}
	}
	
	
	//Informacion de un TvShow
	@RequestMapping("/tvshows/{id}")
	public String TvShow(@PathVariable("id") Long id, Model model, @ModelAttribute("rating") Rating rating, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
		TvShow tvshow = tvShowService.findTvShow(id);
		model.addAttribute("tvshow", tvshow);
		
		return "/tvShowInfo.jsp";
	}
	
	//editar programa
	@RequestMapping("tvshows/{id}/edit")
	public String editShow(@PathVariable("id") Long id, @ModelAttribute("tvshow") TvShow tvshow, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
		TvShow tshow = tvShowService.findTvShow(id);
		model.addAttribute("show", tshow);
		return "/editTvShow.jsp";
	}
	
	//actualizar programa
	@RequestMapping(value="/tvshows/{id}/update", method=RequestMethod.POST)
	public String updateShow(@PathVariable("id") Long id, @Valid @ModelAttribute("tvshow") TvShow tvshow, BindingResult result, @RequestParam(value="title") String title, @RequestParam(value="network") String network) {

		if(result.hasErrors()) {
			return "/editTvShow.jsp";
		} else {
			tvShowService.updateTvShow(tvshow.getId(), tvshow.getTitle(), tvshow.getNetwork());
			return "redirect:/tvshows";
		}
	}
	
	//Mensaje de error si esta agregado el programa
	@RequestMapping("/tvshowerror")
	public String flashMessages(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", "Programa de Televisión ya agregado");
        return "redirect:/tvshows/new";
	}
	
	//Eliminar un programa
	@RequestMapping("/tvshows/{id}/delete")
	public String deleteTvShow(@PathVariable("id") Long id) {
		tvShowService.deleteTvShow(id);
		return "redirect:/tvshows";
	}
}