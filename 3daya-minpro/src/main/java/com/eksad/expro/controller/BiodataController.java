package com.eksad.expro.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.expro.service.BiodataService;

@Controller
public class BiodataController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private BiodataService service;
	
	@RequestMapping(value = "/biodata")
	public String index() {
		return "biodata/index";
	}
	
	@RequestMapping(value = "/biodata/create")
	public String create() {
		return "biodata/create";
	}
	
	@RequestMapping(value = "/biodata/edit")
	public String edit() {
		return "biodata/edit";
	}
	
	@RequestMapping(value = "/biodata/delete")
	public String delete() {
		return "biodata/delete";
	}
}
