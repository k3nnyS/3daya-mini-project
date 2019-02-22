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

import com.eksad.expro.model.TestimonyModel;
import com.eksad.expro.service.TestimonyService;

@Controller
public class ApiTestimonyController {

	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TestimonyService service;
	
	@RequestMapping(value = "api/testimony", method = RequestMethod.GET)
	public ResponseEntity<List<TestimonyModel>> list(){
		ResponseEntity<List<TestimonyModel>> result = null;
		try {
			List<TestimonyModel> list = this.service.getList();
			result = new ResponseEntity<List<TestimonyModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<TestimonyModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/testimony/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<TestimonyModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<TestimonyModel>> result = null;
		try {
			List<TestimonyModel> list = this.service.search(cari);
			result = new ResponseEntity<List<TestimonyModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<List<TestimonyModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/testimony/{testimonyId}", method = RequestMethod.GET)
	public ResponseEntity<TestimonyModel> getById(@PathVariable ("testimonyId") int vId){
		ResponseEntity<TestimonyModel> result = null;
		try {
			TestimonyModel testimony = this.service.getById(vId);
			result = new ResponseEntity<TestimonyModel>(testimony, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestimonyModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/testimony/", method = RequestMethod.POST)
	public ResponseEntity<TestimonyModel> postInsert(@RequestBody TestimonyModel item){
		ResponseEntity<TestimonyModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<TestimonyModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestimonyModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/testimony", method = RequestMethod.PUT)
	public ResponseEntity<TestimonyModel> putUpdate(@RequestBody TestimonyModel item){
		ResponseEntity<TestimonyModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<TestimonyModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestimonyModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	
	public ResponseEntity<TestimonyModel> delApi(@PathVariable("testimonyId") Integer vId){
		ResponseEntity<TestimonyModel> result = null;
		try {
			TestimonyModel item = this.service.getById(vId);
			if (item != null) {
				this.service.delete(item);
				result = new ResponseEntity<TestimonyModel>(item, HttpStatus.ACCEPTED);
			} else {
				result = new ResponseEntity<TestimonyModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestimonyModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
