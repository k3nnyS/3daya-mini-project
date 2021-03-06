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

import com.eksad.expro.model.CategoryModel;
import com.eksad.expro.service.CategoryService;

@Controller
public class ApiCategoryController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private CategoryService service;
	
	@RequestMapping(value = "/api/category/", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryModel>> list(){
		ResponseEntity<List<CategoryModel>> result = null;
		try {
			List<CategoryModel> list = this.service.getList();
			result = new ResponseEntity<List<CategoryModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<CategoryModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/category/search/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryModel>> search(@PathVariable("keyword") String cari){
		ResponseEntity<List<CategoryModel>> result = null;
		try {
			List<CategoryModel> list = this.service.search(cari);
			result = new ResponseEntity<List<CategoryModel>>(list, HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(), err);
			result = new ResponseEntity<List<CategoryModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/category/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<CategoryModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<CategoryModel> result = null;
		try {
			CategoryModel category = this.service.getById(vId);
			result = new ResponseEntity<CategoryModel>(category, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<CategoryModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/category/", method = RequestMethod.POST)
	public ResponseEntity<CategoryModel> postInsert(@RequestBody CategoryModel item){ //yg nangkep RequestBody
		ResponseEntity<CategoryModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<CategoryModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<CategoryModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value ="api/category/", method = RequestMethod.PUT)
	public ResponseEntity<CategoryModel> putUpdate(@RequestBody CategoryModel item){
		ResponseEntity<CategoryModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<CategoryModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<CategoryModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "api/category/{itemId}", method = RequestMethod.DELETE)
	public ResponseEntity<CategoryModel> delApi(@PathVariable("itemId") Integer vId){
		ResponseEntity<CategoryModel> result = null;
		try {
			CategoryModel item = this.service.getById(vId);
			if(item != null) {
				this.service.delete(item);
				result = new ResponseEntity<CategoryModel>(item, HttpStatus.ACCEPTED);
			} else {
				result = new ResponseEntity<CategoryModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<CategoryModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
