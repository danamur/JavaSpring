package com.codingdojo.productscategories.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.productscategories.models.Category;
import com.codingdojo.productscategories.models.CategoryProduct;
import com.codingdojo.productscategories.models.Product;
import com.codingdojo.productscategories.services.ProductService;

@Controller
public class ProductController {
	private final ProductService productService;
	
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	@GetMapping ("/new/product")
	public String newProduct(@ModelAttribute("productObject") Product product) {
		return "pages/newProduct.jsp";
	}
	
	@PostMapping("/addproduct")
	public String addCategory(@Valid @ModelAttribute("productObjet") Product product, BindingResult result) {
		if(result.hasErrors()) {
			return"pages/newProduct.jsp";
		}
		else {
			productService.addProd(product);
			return "redirect:/new/product";
		}
	}
	
	//Show
	
	@GetMapping("product/{productid}")
	public String showProduct(@PathVariable("productid")Long productid,
							@ModelAttribute("categoryProductObj")CategoryProduct categoryProduct,
							Model model) {
		Product product = productService.singleProd(productid);
		model.addAttribute("product", product);
		model.addAttribute("categories", productService.availableCategoriesForProduct(product));
		return "pages/product.jsp";
	}
	
	@GetMapping("categories/{categoriesid}")
	public String showCategory(@PathVariable("categoriesid") Long categoriesid,
								@ModelAttribute("categoryProductObj") CategoryProduct categoryProduct,
								Model model) {
		Category category = productService.singleCat(categoriesid);
		model.addAttribute("category", category);
		model.addAttribute("product", productService.availableProductsForCategory(category));
		return "pages/category.jsp";
	}
	
	@PostMapping("/addcat")
	public String addCat(@ModelAttribute("categoryProductObj") CategoryProduct categoryProduct) {
		productService.addCatToProduct(categoryProduct);
		return "redirect:/product/" + categoryProduct.getProduct().getId();
	}
	
	@PostMapping("/addpro")
	public String addPro(@ModelAttribute("categoryProductObj") CategoryProduct categoryProduct) {
		productService.addProdToCategory(categoryProduct);
		return "redirect:/categories/" + categoryProduct.getCategory().getId();
	}
}
