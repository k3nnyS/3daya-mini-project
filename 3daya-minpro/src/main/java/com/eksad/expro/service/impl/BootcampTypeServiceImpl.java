package com.eksad.expro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.expro.dao.BootcampTypeDao;
import com.eksad.expro.model.BootcampTypeModel;
import com.eksad.expro.service.BootcampTypeService;

@Service
@Transactional
public class BootcampTypeServiceImpl implements BootcampTypeService {
	
	@Autowired
	private BootcampTypeDao dao;

	@Override
	public List<BootcampTypeModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<BootcampTypeModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public BootcampTypeModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(BootcampTypeModel model) {
		this.dao.insert(model);		
	}

	@Override
	public void update(BootcampTypeModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(BootcampTypeModel model) {
		this.dao.delete(model);
	}

}