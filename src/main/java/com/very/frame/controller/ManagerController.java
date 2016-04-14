package com.very.frame.controller ;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/veryadmin")
public class ManagerController {
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public String login(HttpServletRequest request, ModelMap modelMap) {
		return "/frame/manage/index";
	}
}
