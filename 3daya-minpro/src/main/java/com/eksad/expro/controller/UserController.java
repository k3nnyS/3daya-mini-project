package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.expro.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

	@RequestMapping(value="/user")
	public String index(){
		return "/user/index";
	}
	
	@RequestMapping(value="/user/create")
	public String create(){
		return "/user/create";
	}
	
	@RequestMapping(value="/user/edit")
	public String edit(){
		return "/user/edit";
	}
	
	@RequestMapping(value="/user/delete")
	public String delete(){
		return "/user/delete";
	}
	
	@RequestMapping(value="/user/reset")
	public String reset(){
		return "/user/reset";
	}
	
}