package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.expro.service.TrainerService;

@Controller
public class TrainerController {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TrainerService service;
	
	@RequestMapping(value="/trainer")
	public String index() {
		return "/trainer/index";
	}
	
	@RequestMapping(value="/trainer/create")
	public String create(){
		return "/trainer/create";
	}
	
	@RequestMapping(value="/trainer/edit")
	public String edit() {
		return "/trainer/edit";
	}
	
	@RequestMapping(value="/trainer/delete")
	public String delete() {
		return "/trainer/delete";
	}
}