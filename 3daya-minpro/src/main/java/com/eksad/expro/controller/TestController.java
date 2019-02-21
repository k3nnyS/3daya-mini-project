package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.expro.service.TestService;

@Controller
public class TestController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TestService service;
	
	@RequestMapping(value="/test")
	public String index() {
		return "/test/index";
	}
	
	@RequestMapping(value="/test/detail")
	public String detail(){
		return "/test/detail";
	}
	
	@RequestMapping(value="/test/create")
	public String create(){
		return "/test/create";
	}
	
	@RequestMapping(value="/test/edit")
	public String edit(){
		return "/test/edit";
	}
	
	@RequestMapping(value="/test/delete")
	public String delete(){
		return "/test/delete";
	}
}
