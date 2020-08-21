package com.codingdojo.productscategories.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.productscategories.models.Category;
import com.codingdojo.productscategories.services.ProductService;

@Controller
public class CategoryController {
	private final ProductService productService;
	
	public CategoryController(ProductService productService) {
		this.productService = productService;
	}
	
	@GetMapping("/new/category")
	public String newCategory(@ModelAttribute("categoryObjet") Category category) {
		return "pages/newCategory.jsp";
	}
	
	@PostMapping("/addcategory")
	public String addCategory(@Valid @ModelAttribute("categoryObject") Category category, BindingResult result) {
		if(result.hasErrors()) {
			return "/new/categories";
		}
		else {
			productService.addCat(category);
			return "redirect:/new/category";
		}
	}
}
