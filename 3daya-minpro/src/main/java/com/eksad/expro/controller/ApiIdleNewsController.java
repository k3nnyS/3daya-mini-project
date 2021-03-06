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

import com.eksad.expro.model.IdleNewsModel;
import com.eksad.expro.service.IdleNewsService;

@Controller
public class ApiIdleNewsController {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private IdleNewsService service;
	
	@RequestMapping(value = "/api/idlenews/", method = RequestMethod.GET)
	public ResponseEntity<List<IdleNewsModel>> list(){
		ResponseEntity<List<IdleNewsModel>> result = null;
		try {
			List<IdleNewsModel> list = this.service.getList();
			result = new ResponseEntity<List<IdleNewsModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<IdleNewsModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/idlenews/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<IdleNewsModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<IdleNewsModel>> result = null;
		try {
			List<IdleNewsModel> list = this.service.search(cari);
			result = new ResponseEntity<List<IdleNewsModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<IdleNewsModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/idlenews/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<IdleNewsModel> getById(@PathVariable("itemId") int vId) {
		ResponseEntity<IdleNewsModel> result = null;
		try {
			IdleNewsModel IdleNews = this.service.getById(vId);
			result = new ResponseEntity<IdleNewsModel>(IdleNews, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<IdleNewsModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/idlenews/", method = RequestMethod.POST)
	public ResponseEntity<IdleNewsModel> postInsert(@RequestBody IdleNewsModel item){
		ResponseEntity<IdleNewsModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<IdleNewsModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<IdleNewsModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/idlenews/", method = RequestMethod.PUT)
	public ResponseEntity<IdleNewsModel> putUpdate(@RequestBody IdleNewsModel item){
		ResponseEntity<IdleNewsModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<IdleNewsModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<IdleNewsModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/idlenews/{itemId}", method = RequestMethod.DELETE)
	public ResponseEntity<IdleNewsModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<IdleNewsModel> result = null;
		try {
			IdleNewsModel item = this.service.getById(vid);
			if(item != null) {
				this.service.delete(item);
				result = new ResponseEntity<IdleNewsModel>(item, HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<IdleNewsModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<IdleNewsModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
