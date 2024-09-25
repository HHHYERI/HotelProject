package com.springmvc.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/welcome", method=RequestMethod.GET)
	public String welcome(Model model) {
		logger.info("웰컴페이지");
		model.addAttribute("greeting", "Welcom to Hotel");
		model.addAttribute("strapline", "Welcom to Web Reservation of Hotel");
		return "welcome";
	}
}
