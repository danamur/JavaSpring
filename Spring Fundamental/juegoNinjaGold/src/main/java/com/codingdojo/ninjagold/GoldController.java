package com.codingdojo.ninjagold;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoldController {
	@RequestMapping (value="/getGold", method=RequestMethod.POST)
	public String getGold(@RequestParam(value="button")String button, HttpSession session) {
		
		if(button.equals("farm")) {
			
			String format = "EEEEE dd yyyy KK:mm aa";
			SimpleDateFormat dateFormat = new SimpleDateFormat (format);
			
			int generadorGold = ThreadLocalRandom.current().nextInt(10,21);
			String timeCreate = dateFormat.format(new Date());
			ArrayList<String> list = (ArrayList<String>) session.getAttribute("eventLog");
			list.add(0,"Conseguiste una muy buena cocecha en el campo de maiz. Ganaste " + generadorGold+" gold ("+timeCreate+")");
			session.setAttribute("gold", (int)session.getAttribute("gold")+generadorGold);
			session.setAttribute("logList", list);
	
		}
		
		if(button.equals("cave")) {
			
			String format = "EEEEE dd yyyy KK:mm aa";
			SimpleDateFormat dateFormat = new SimpleDateFormat (format);
			
			int generadorGold = ThreadLocalRandom.current().nextInt(5,11);
			String timeCreate = dateFormat.format(new Date());
			ArrayList<String> list = (ArrayList<String>) session.getAttribute("eventLog");
			list.add(0,"Conseguiste un muy buen mineral en la cueva. Ganaste " + generadorGold+" gold ("+timeCreate+")");
			session.setAttribute("gold", (int)session.getAttribute("gold")+generadorGold);
			session.setAttribute("logList", list);
		}
		
		if(button.equals("house")) {
			
			String format = "EEEEE dd yyyy KK:mm aa";
			SimpleDateFormat dateFormat = new SimpleDateFormat (format);
			
			int generadorGold = ThreadLocalRandom.current().nextInt(2, 6);
			String timeCreate = dateFormat.format(new Date());
			ArrayList<String> list = (ArrayList<String>) session.getAttribute("eventLog");
			list.add(0,"Conseguiste un muy buen botin en esa casa. Ganaste " + generadorGold+" gold ("+timeCreate+")");
			session.setAttribute("gold", (int)session.getAttribute("gold")+generadorGold);
			session.setAttribute("logList", list);
		}
		
		if(button.equals("casino")) {
			
			int rand = ThreadLocalRandom.current().nextInt(1, 3);
			String format = "EEEEE dd yyyy KK:mm aa";
			SimpleDateFormat dateFormat = new SimpleDateFormat (format);
			
			if(rand == 1) {
				int generadorGold = ThreadLocalRandom.current().nextInt(0, 51);
				String timeCreate = dateFormat.format(new Date());
				ArrayList<String> list = (ArrayList<String>) session.getAttribute("eventLog");
				list.add(0,"Una muy buena jugada!. Ganaste " + generadorGold+" gold ("+timeCreate+")");
				session.setAttribute("gold", (int)session.getAttribute("gold")+generadorGold);
				session.setAttribute("logList", list);
			}
			
			if(rand == 2) {
				
				int generadorGold = ThreadLocalRandom.current().nextInt(0, 51);
				String timeCreate = dateFormat.format(new Date());
				ArrayList<String> list = (ArrayList<String>) session.getAttribute("eventLog");
				list.add(0,"Fue una apuesta dificil. perdiste " + generadorGold+" gold ("+timeCreate+")");
				session.setAttribute("gold", (int)session.getAttribute("gold")-generadorGold);
				session.setAttribute("logList", list);
			}

		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
