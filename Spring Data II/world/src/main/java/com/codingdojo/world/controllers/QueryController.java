package com.codingdojo.world.controllers;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.world.services.ApiService;

@Controller
public class QueryController {
	private final ApiService apiService;
	
	
	public QueryController(ApiService apiService) {
		this.apiService = apiService;
	}


	@RequestMapping("/question1")
    public String exercise1(Model model) {
        ArrayList<String> columns = new ArrayList<String>();
        columns.add("Ciudad");
        columns.add("Lenguaje");
        columns.add("Porcentaje");
        model.addAttribute("columns", columns);
    	model.addAttribute("numEjercicio", "Ejercicio 1");
    	model.addAttribute("descripcion", "¿Qué consulta ejecutarías para obtener todos los países que hablan Sloveno? "
			    			+ "Su consulta debe retornar el nombre del país, lenguaje y porcentaje del lenguaje. "
			    			+ "Su consulta debe organizar los resultados por porcentaje en orden descendente.");
        model.addAttribute("tabla", apiService.question1());
        return "views/query.jsp";
    }
	
	@RequestMapping("/question2")
	public String exercise2(Model model) {
		ArrayList<String> columns = new ArrayList<String>();
		columns.add("Pais");
		columns.add("Cantidad de Ciudades");
        model.addAttribute("columns", columns);
    	model.addAttribute("numEjercicio", "Ejercicio 2");
    	model.addAttribute("descripcion", "¿Qué consulta ejecutarías para mostrar el número total de ciudades de cada país? "
    						+ "Su consulta debe retornar el nombre del país y el número total de ciudades. "
    						+ "Su consulta debe organizar los resultados por número de ciudades en orden descendente.");
        model.addAttribute("tabla", apiService.question2());
		return "views/query.jsp";
	}
	
	@RequestMapping("/question3")
	public String exercise3(Model model) {
		ArrayList<String> columns = new ArrayList<String>();
		columns.add("Ciudad");
		columns.add("Poblacion Total");
		model.addAttribute("columns", columns);
		model.addAttribute("numEjercicio", "Ejercicio 3");
		model.addAttribute("descripcion", "¿Qué consulta ejecutarías para obtener todas las ciudades en México con una población mayor a 500.000? "
							+ "Su consulta debe organizar los resultados por población en orden descendente.");
		model.addAttribute("tabla", apiService.question3());
		return "views/query.jsp";
	}
	
	@RequestMapping("/question4")
	public String exercise4(Model model) {
		ArrayList<String> columns = new ArrayList<String>();
		columns.add("Pais");
		columns.add("Lenguages");
		columns.add("Porcentaje");
		model.addAttribute("columns", columns);
		model.addAttribute("numEjercicio", "Ejercicio 4");
		model.addAttribute("descripcion", "¿Qué consulta ejecutarías para obtener todos los lenguajes en cada país con un "
							+ "porcentaje mayor al 89%? "
							+ "Su consulta debe organizar los resultados por porcentaje en orden descendente.");
		model.addAttribute("tabla", apiService.question4());
		return "views/query.jsp";
	}
	
	@RequestMapping("/question5")
	public String exercise5(Model model) {
		ArrayList<String> columns = new ArrayList<String>();
		columns.add("Pais");
		columns.add("Superficie total");
		columns.add("Poblacion total");
		model.addAttribute("columns", columns);
		model.addAttribute("numEjercicio", "Ejercicio 5");
		model.addAttribute("descripcion", "¿Qué consulta ejecutarías para obtener todos los países con un superficie de área "
							+ "inferior a 501 y una población mayor a 100.000?");
		model.addAttribute("tabla", apiService.question5());
		return "views/query.jsp";
	}
	
	@RequestMapping("/question6")
	public String exercise6(Model model) {
		ArrayList<String> columns = new ArrayList<String>();
		columns.add("País");
		columns.add("Sistema de gobierno");
		columns.add("Superficie total");
		columns.add("Expectativas de vida");
		model.addAttribute("columns", columns);
		model.addAttribute("numEjercicio", "Ejercicio 6");
		model.addAttribute("descripcion", "¿Qué consulta ejecutarías para obtener todos los países que tienen solo "
							+ "Constitutional Monarchy (Monarquía) y una superficie de área mayor a 200 y "
							+ "una expectativa de vida superior a los 75 años?");
		model.addAttribute("tabla", apiService.question6());
		return "views/query.jsp";
	}
	
	@RequestMapping("/question7")
	public String exercise7(Model model) {
		ArrayList<String> columns = new ArrayList<String>();
		columns.add("País");
		columns.add("Ciudad");
		columns.add("Distrito");
		columns.add("Poblacion total");
		model.addAttribute("columns", columns);
		model.addAttribute("numEjercicio", "Ejercicio 7");
		model.addAttribute("descripcion", "¿Qué consulta ejecutarías para obtener todas las ciudades de Argentina "
				+ "dentro del distrito de Buenos Aires y que tengan una población mayor a 500.000? "
				+ "La consulta debe retornar el nombre del país, nombre de la ciudad, distrito y población.");
		model.addAttribute("tabla", apiService.question7());
		return "views/query.jsp";
	}
	
	@RequestMapping("/question8")
	public String exercise8(Model model) {
		ArrayList<String> columns = new ArrayList<String>();
		columns.add("Región");
		columns.add("Cantidad Paises");
		model.addAttribute("columns", columns);
		model.addAttribute("numEjercicio", "Ejercicio 8");
		model.addAttribute("descripcion", "¿Qué consulta ejecutarías para sumar el número de países en cada región? "
				+ "La consulta debe mostrar el nombre de la región y el número de países. "
				+ "Además, la consulta debe organizar los resultados por el número de países en orden descendente.");
		model.addAttribute("tabla", apiService.question8());
		return "views/query.jsp";
	}
}