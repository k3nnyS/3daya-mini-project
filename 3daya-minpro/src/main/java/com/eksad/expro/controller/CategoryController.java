package com.eksad.expro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.expro.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService mega;

	@RequestMapping(value = "/category")
	public String index() {
		return "category/index";
	}
	
	@RequestMapping(value = "/category/create")
	public String create(Model megam) {
		String code= this.mega.getNewCode();
		megam.addAttribute("KodeBaru", code);
		return "category/create";
	}
	
	@RequestMapping(value = "/category/edit")
	public String edit() {
		return "category/edit";
	}
	
	@RequestMapping(value = "/category/delete")
	public String delete() {
		return "category/delete";
	}
}
