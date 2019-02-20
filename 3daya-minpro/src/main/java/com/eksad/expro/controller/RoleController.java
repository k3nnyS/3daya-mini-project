package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.expro.service.RoleService;

@Controller
public class RoleController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private RoleService service;
	
	@RequestMapping(value = "/role", method = RequestMethod.GET)
	public String index() {
		return "role/index";
	}
	
	@RequestMapping(value = "/role/detail", method = RequestMethod.GET)
	public String detail() {
		return "role/detail";
	}
	
	@RequestMapping(value = "/role/create", method = RequestMethod.GET)
	public String create() {
		return "role/create";
	}
	
	@RequestMapping(value = "/role/edit", method = RequestMethod.GET)
	public String edit() {
		return "role/edit";
	}
	
	@RequestMapping(value = "/role/delete", method = RequestMethod.GET)
	public String delete() {
		return "role/delete";
	}
}
