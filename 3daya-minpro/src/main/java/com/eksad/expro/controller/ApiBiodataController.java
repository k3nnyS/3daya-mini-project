package com.eksad.expro.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.expro.model.BiodataModel;
import com.eksad.expro.model.RoleModel;
import com.eksad.expro.service.BiodataService;

@Controller
public class ApiBiodataController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private BiodataService service;
	
	@RequestMapping(value = "/api/biodata/list", method = RequestMethod.GET)
	public ResponseEntity<List<BiodataModel>> list(){
		ResponseEntity<List<BiodataModel>> result = null;
		try {
			List<BiodataModel> list = this.service.getList();
			result = new ResponseEntity<List<BiodataModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<BiodataModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/biodata/", method = RequestMethod.POST)
	public ResponseEntity<BiodataModel> postInsert(@RequestBody BiodataModel item){
		ResponseEntity<BiodataModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<BiodataModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BiodataModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/biodata/search/{keyword}", method=RequestMethod.GET)
	public ResponseEntity<List<BiodataModel>> search(@PathVariable("keyword") String cari){
		ResponseEntity<List<BiodataModel>> result = null;
		try {
			List<BiodataModel> list = this.service.search(cari);
			result = new ResponseEntity<List<BiodataModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<BiodataModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
