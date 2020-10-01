package com.danielnamur.javaexamsimulator.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.danielnamur.javaexamsimulator.models.Course;
import com.danielnamur.javaexamsimulator.models.User;
import com.danielnamur.javaexamsimulator.services.CourseService;
import com.danielnamur.javaexamsimulator.services.UserService;
import com.danielnamur.javaexamsimulator.validator.UserValidator;

@Controller
public class JavaExamController {
	private CourseService courseService;
	private UserService userService;
	private UserValidator userValidator;
	
	public JavaExamController(CourseService courseService, UserService userService, UserValidator userValidator) {
		this.courseService = courseService;
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
	@RequestMapping("/")
	public String index(@ModelAttribute("user") User user) {
		return "index.jsp";
	}
	
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User u = userService.registerUser(user);
		session.setAttribute("userId", u.getId());
		return "redirect:/courses";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, 
							Model model,HttpSession session) {
		boolean isAuthenticated = userService.authenticateUser(email, password);
		if(isAuthenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/courses";
		}
		else {
			model.addAttribute("error", "Correo o contraseña incorrecta. Intentalo nuevamente");
			return "index.jsp";
		}
	}
	
	@RequestMapping("/courses")
	public String homePage(HttpSession session, Model model) {
		if(session.getAttribute("userId") !=null) {
			User user = userService.findUserById((Long) session.getAttribute("userId"));
			
			model.addAttribute("user", user);
			
			List<Course> courseList = courseService.findAllCourses();
			model.addAttribute("course", courseList);
			return "homePage.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/courses/new")
	public String createCourse(@Valid @ModelAttribute("course") Course course, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "course.jsp";
		}
		else {
			courseService.createCourse(course);
			return "redirect:/courses";
		}
	}
	
	//Información del Curso
	@RequestMapping("courses/{id}")
	public String displayCourse(@PathVariable("id") Long id, Model model, HttpSession session) {
		Course myCourse = courseService.findCourseById(id);
		model.addAttribute("course", myCourse);
		
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("currentUser", u);
		return "courseInfo.jsp";
	}
	
	//Agregar Usuario a un Curso
	@RequestMapping("courses/add/{id}")
	public String addCourse(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		Course course = courseService.findCourseById(id);
		
		u.getCourses().add(course);
		userService.updateUser(u);
		
		return "redirect:/courses";
	}
	
	//Editar Curso
	@RequestMapping("/courses/edit/{id}")
	public String editPage(@ModelAttribute("course") Course myCourse, @PathVariable("id")Long myId, Model model) {
		Course course = courseService.findCourseById(myId);
		model.addAttribute("course", course);
		return "editCourse.jsp";
	}
	
	//Actualizar Curso
	@PostMapping("/courses/update")
	public String updateCourse(@Valid @ModelAttribute("course")Course myCourse, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			courseService.updateCourse(myCourse);
			return "redirect:/courses";
		}
	}
	
	//Eliminar Curso
	@RequestMapping("/courses/delete/{id}")
	public String deleteCourse(@PathVariable("id")Long id) {
		Course myCourse = courseService.findCourseById(id);
		if(myCourse != null) {
			courseService.deleteCourse(myCourse);
			return "redirect:/courses";
		}
		else {
			return "redirect:/courses";
		}
	}
	
	//Remover Usuario del Curso
	@RequestMapping("/courses/remove/{id}")
	public String removerUserFromCourse(@PathVariable("id") Long myId, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		Course course = courseService.findCourseById(myId);
		u.getCourses().remove(course);
		userService.updateUser(u);
		return "redirect:/courses";
	}
	
}
