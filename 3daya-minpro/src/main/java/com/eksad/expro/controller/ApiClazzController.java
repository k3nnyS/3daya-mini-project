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

import com.eksad.expro.model.ClazzModel;
import com.eksad.expro.service.ClazzService;

@Controller
public class ApiClazzController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private ClazzService service;
	
	@RequestMapping(value = "/api/clazz/", method = RequestMethod.GET)
	public ResponseEntity<List<ClazzModel>> list(){
		ResponseEntity<List<ClazzModel>> result = null;
		try {
			List<ClazzModel> list = this.service.getList();
			result = new ResponseEntity<List<ClazzModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<ClazzModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/clazz/search/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<ClazzModel>> search(@PathVariable("keyword") String cari){
		ResponseEntity<List<ClazzModel>> result = null;
		try {
			List<ClazzModel> list = this.service.search(cari);
			result = new ResponseEntity<List<ClazzModel>>(list, HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(), err);
			result = new ResponseEntity<List<ClazzModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/clazz/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<ClazzModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<ClazzModel> result = null;
		try {
			ClazzModel clazz = this.service.getById(vId);
			result = new ResponseEntity<ClazzModel>(clazz, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClazzModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/clazz/", method = RequestMethod.POST)
	public ResponseEntity<ClazzModel> postInsert(@RequestBody ClazzModel item){
		ResponseEntity<ClazzModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<ClazzModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClazzModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value ="api/clazz/", method = RequestMethod.PUT)
	public ResponseEntity<ClazzModel> putUpdate(@RequestBody ClazzModel item){
		ResponseEntity<ClazzModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<ClazzModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClazzModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/clazz/{itemId}", method = RequestMethod.DELETE)
	public ResponseEntity<ClazzModel> delApi(@PathVariable("itemId") Integer vId){
		ResponseEntity<ClazzModel> result = null;
		try {
			ClazzModel item = this.service.getById(vId);
			if(item != null) {
				this.service.delete(item);
				result = new ResponseEntity<ClazzModel>(item, HttpStatus.ACCEPTED);
			} else {
				result = new ResponseEntity<ClazzModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClazzModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
