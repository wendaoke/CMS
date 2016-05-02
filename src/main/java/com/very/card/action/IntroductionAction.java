package com.very.card.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.very.card.model.Introduction;
import com.very.card.service.IntroductionService;

@Controller
@RequestMapping("/card")
public class IntroductionAction {
	@Autowired
	public IntroductionService service;
	
	@RequestMapping(value = "/introduction.htm", method = RequestMethod.GET)
	public String login(HttpServletRequest request, ModelMap modelMap,@RequestParam("id")int id) {
		Introduction introduction = service.selectByPrimaryKey(id);
		modelMap.addAttribute("user",introduction);
		return "/card/introduction";
	}
}