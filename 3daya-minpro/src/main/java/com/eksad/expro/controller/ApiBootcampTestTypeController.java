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

import com.eksad.expro.model.BootcampTestTypeModel;
import com.eksad.expro.service.BootcampTestTypeService;

@Controller
public class ApiBootcampTestTypeController {
		private Log log = LogFactory.getLog(getClass());
		@Autowired
		private BootcampTestTypeService service;
		
		@RequestMapping(value = "/api/bootcamptesttype/", method = RequestMethod.GET)
		public ResponseEntity<List<BootcampTestTypeModel>> list(){
			ResponseEntity<List<BootcampTestTypeModel>> result = null;
			try {
				List<BootcampTestTypeModel> list = this.service.getList();
				result = new ResponseEntity<List<BootcampTestTypeModel>>(list, HttpStatus.OK);
			}  catch (Exception e) {
				log.debug(e.getMessage(), e);
				result = new ResponseEntity<List<BootcampTestTypeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return result;
		}
		
		@RequestMapping(value = "/api/test/search/{katakunci}", method = RequestMethod.GET)
		public ResponseEntity<List<BootcampTestTypeModel>> search (@PathVariable("katakunci") String cari){
			ResponseEntity<List<BootcampTestTypeModel>> result = null;
			try {
				List<BootcampTestTypeModel> list = this.service.search(cari);
				result = new ResponseEntity<List<BootcampTestTypeModel>>(list, HttpStatus.OK);
			} catch (Exception e) {
				log.debug(e.getMessage(), e);
				result = new ResponseEntity<List<BootcampTestTypeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return result;
		}
		
		}
