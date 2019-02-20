package com.eksad.expro.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.expro.model.RoleModel;
import com.eksad.expro.service.RoleService;

@Controller
public class ApiRoleController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private RoleService service;

	@RequestMapping(value = "/api/role/list", method = RequestMethod.GET)
	public ResponseEntity<List<RoleModel>> list(){
		ResponseEntity<List<RoleModel>> result = null;
		try {
			List<RoleModel> list = this.service.getList();
			result = new ResponseEntity<List<RoleModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	@RequestMapping(value="api/role/search/{keyword}", method=RequestMethod.GET)
	public ResponseEntity<List<RoleModel>> search(@PathVariable("keyword") String cari){
		ResponseEntity<List<RoleModel>> result = null;
		try {
			List<RoleModel> list = this.service.search(cari);
			result = new ResponseEntity<List<RoleModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<RoleModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	
}
