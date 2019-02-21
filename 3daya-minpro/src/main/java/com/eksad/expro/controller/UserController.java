package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.expro.service.UserService;


@Controller
public class UserController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/user", method = RequestMethod.GET)
	public String index(){
		return "/user/index";
	}
	
	@RequestMapping(value="/user/create", method = RequestMethod.GET)
	public String create(){
		return "/user/create";
	}
	
	@RequestMapping(value="/user/edit", method = RequestMethod.GET)
	public String edit(){
		return "/user/edit";
	}
	
	@RequestMapping(value="/user/delete", method = RequestMethod.GET)
	public String delete(){
		return "/user/delete";
	}
	
	@RequestMapping(value="/user/detail", method = RequestMethod.GET)
	public String detail(){
		return "/user/detail";
	}

}
