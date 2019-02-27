package com.eksad.expro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClazzController {
	@RequestMapping(value = "/clazz")
	public String index() {
		return "clazz/index";
	}
	
	@RequestMapping(value = "/clazz/create")
	public String create() {
		return "clazz/create";
	}
	
	@RequestMapping(value = "/clazz/edit")
	public String edit() {
		return "clazz/edit";
	}
	
	@RequestMapping(value = "/clazz/delete")
	public String delete() {
		return "clazz/delete";
	}
}
