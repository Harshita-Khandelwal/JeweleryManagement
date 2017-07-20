package com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController {
	
	@RequestMapping("/loadPageOnMenuClick/{pageName}")
	public ModelAndView loadPageOnMenuClick(@PathVariable("pageName") String pageName){
		ModelAndView modelAndView = new ModelAndView(pageName);
		return modelAndView;
	}

}
