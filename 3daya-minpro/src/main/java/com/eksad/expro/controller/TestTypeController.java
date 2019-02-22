package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.expro.service.TestTypeService;

@Controller
public class TestTypeController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TestTypeService service;
	
	@RequestMapping(value="/testtype")
	public String index() {
		return "testtype/index";
	}
	
	@RequestMapping(value="/testtype/detail")
	public String detail(){
		return "testtype/detail";
	}
	
	@RequestMapping(value="/testtype/create")
	public String create(){
		return "testtype/create";
	}
	
	@RequestMapping(value="/testtype/edit")
	public String edit(){
		return "testtype/edit";
	}
	
	@RequestMapping(value="/testtype/delete")
	public String delete(){
		return "testtype/delete";
	}
}
