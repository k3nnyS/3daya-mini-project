package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.expro.service.TechnologyService;

@Controller
public class TechnologyController {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TechnologyService service;
	
	@RequestMapping(value="/technology")
	public String index() {
		return "/technology/index";
	}
	
	@RequestMapping(value="/technology/create")
	public String create(){
		return "/technology/create";
	}
	
	@RequestMapping(value="/technology/edit")
	public String edit() {
		return "/technology/edit";
	}
	
	@RequestMapping(value="/technology/delete")
	public String delete() {
		return "/technology/delete";
	}
	
	@RequestMapping(value="/technology/detail")
	public String detail() {
		return "/technology/detail";
	}
	
	@RequestMapping(value="/technology/trainer")
	public String addTt() {
		return"/technology/trainer";
	}
}