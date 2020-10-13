package com.danielnamur.JavaBelt.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.danielnamur.JavaBelt.models.User;
import com.danielnamur.JavaBelt.service.UserService;
import com.danielnamur.JavaBelt.validator.UserValidator;

@Controller
public class MainController {
	private final UserService userService;
	private final UserValidator userValidator;
	
	public MainController(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
	@RequestMapping("/")
	public String index(@ModelAttribute("user") User user) {
		return "/index.jsp";
	}
	
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String indexRedir(@RequestParam(value="email") String email, @RequestParam(value="password") String password, @RequestParam(value="passwordConfirmation") String passwordConfirmation, @Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "/index.jsp";
		} else {
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/tvshows";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginRedir(@RequestParam(value="email") String email, @RequestParam(value="password") String password, HttpSession session, Model model) {
		boolean isAuthenticated = userService.authenticateUser(email, password);
		if(isAuthenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/tvshows";
		} else {			
			return "redirect:/createError";
		}
	}
	
	@RequestMapping("/createError")
	public String flashMessages(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", "Su correo o contraseña es incorrecta.");
        return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}