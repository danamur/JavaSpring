package com.codingdojo.overflow.controllers;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.overflow.models.Answer;
import com.codingdojo.overflow.models.Question;
import com.codingdojo.overflow.services.OverflowService;

@Controller
public class OverflowController {
	private final OverflowService overflowService;
	
	public OverflowController(OverflowService overflowService) {
		
		this.overflowService = overflowService;
	}

	@GetMapping("/")
	public String notHere() {
		return"redirect:/questions";
	}
	
	@GetMapping("/questions")
	public String index(Model model) {
		model.addAttribute("questions",overflowService.allQuestions());
		return"pages/index.jsp";
	}
	
	@GetMapping("/questions/new")
	public String newQuestion(@ModelAttribute("addQuestion")Question question) {
		return"pages/new.jsp";
	}
	
	@PostMapping("/questions/new")
	public String addQuestion(@RequestParam("other")String tags,@Valid @ModelAttribute("addQuestion")
								Question question,BindingResult result,RedirectAttributes rAttributes) {
		List<String> tagString = Arrays.asList(tags.split(","));
		if(tagString.size() > 3) {
			String error = "<div class=\"alert alert-danger\" role=\"alert\"> Questions can only have a maximum of 3 tags </div>";
			rAttributes.addFlashAttribute("error", error );
			return "redirect:/questions/new";
		} 
		else if(result.hasErrors()) {
			return"pages/new.jsp";
		} 
		else {
			overflowService.tagCheckAndSave(tagString, question);
			return "redirect:/";
		}
	}
	
	@GetMapping("/questions/{questionId}")
	public String viewQuestion(@ModelAttribute("addTheAnswer")Answer answer,@PathVariable("questionId")Long id,Model model) {
		model.addAttribute("question",overflowService.findQuestionById(id));
		return"pages/view.jsp";
	}
	
	@PostMapping("/questions/{questionId}")
	public String addNewAnswer(@Valid @ModelAttribute("addTheAnswer")Answer answer,BindingResult result,
								@PathVariable("questionId")Long id , Model model) {
		if(result.hasErrors()) {
			model.addAttribute("question",overflowService.findQuestionById(id));
			return"pages/view.jsp";
		}
		else {
			answer.setQuestion(overflowService.findQuestionById(id));
			overflowService.saveAnswer(answer);
			return"redirect:/questions/"+id;
		}
	}
	


}