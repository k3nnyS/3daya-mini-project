package com.eksad.expro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IdleNewsController {

	@RequestMapping(value = "/idlenews")
	public String index() {
		return "/idlenews/index";
	}
	
	@RequestMapping(value = "/idlenews/create")
	public String create() {
		return "/idlenews/create";
	}
	
	@RequestMapping(value = "/idlenews/edit")
	public String edit() {
		return "/idlenews/edit";
	}
	
	@RequestMapping(value = "/idlenews/delete")
	public String delete() {
		return "/idlenews/delete";
	}
}
