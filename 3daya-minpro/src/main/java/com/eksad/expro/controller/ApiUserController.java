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

import com.eksad.expro.model.UserModel;
import com.eksad.expro.service.UserService;

@Controller
public class ApiUserController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private UserService service;

	@RequestMapping(value = "/api/user/", method = RequestMethod.GET)
	public ResponseEntity<List<UserModel>> list() {
		ResponseEntity<List<UserModel>> result = null;
		try {
			List<UserModel> list = this.service.getList();
			result = new ResponseEntity<List<UserModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<UserModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/user/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<UserModel>> search(@PathVariable("katakunci") String cari) {
		ResponseEntity<List<UserModel>> result = null;
		try {
			List<UserModel> list = this.service.search(cari);
			result = new ResponseEntity<List<UserModel>>(list, HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(), err);
			result = new ResponseEntity<List<UserModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/user/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<UserModel> getById(@PathVariable("itemId") int vId) {
		ResponseEntity<UserModel> result = null;
		try {
			UserModel cat = this.service.getById(vId);
			result = new ResponseEntity<UserModel>(cat, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<UserModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/user/", method = RequestMethod.POST)
	public ResponseEntity<UserModel> postInsert(@RequestBody UserModel item) {
		ResponseEntity<UserModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<UserModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<UserModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/user/", method = RequestMethod.PUT)
	public ResponseEntity<UserModel> putUpdate(@RequestBody UserModel item) {
		ResponseEntity<UserModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<UserModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<UserModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/user/reset/", method = RequestMethod.PUT)
	public ResponseEntity<UserModel> putReset(@RequestBody UserModel item) {
		ResponseEntity<UserModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<UserModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<UserModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/user/delete/", method = RequestMethod.PUT)
	public ResponseEntity<UserModel> putDelete(@RequestBody UserModel item) {
		ResponseEntity<UserModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<UserModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<UserModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}


	@RequestMapping(value = "/api/user/{itemId}", method = RequestMethod.DELETE)
	public ResponseEntity<UserModel> delApi(@PathVariable("itemId") Integer vid) {
		ResponseEntity<UserModel> result = null;
		try {
			UserModel item = this.service.getById(vid);
			if (item != null) {
				this.service.delete(item);
				result = new ResponseEntity<UserModel>(item, HttpStatus.ACCEPTED);
			} else {
				result = new ResponseEntity<UserModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<UserModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}