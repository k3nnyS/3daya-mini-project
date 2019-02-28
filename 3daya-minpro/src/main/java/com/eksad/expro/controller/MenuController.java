package com.eksad.expro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.expro.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService service;

	@RequestMapping(value = "/menu")
	public String index() {
		return "menu/index";
	}
	
	@RequestMapping(value = "/menu/create")
	public String create(Model model) {
		String code = this.service.getNewCode();
		model.addAttribute("KodeBaru", code);
		return "/menu/create";
	}
	
	@RequestMapping(value = "/menu/edit")
	public String edit() {
		return "menu/edit";
	}
	
	@RequestMapping(value = "/menu/delete")
	public String delete() {
		return "menu/delete";
	}
}
