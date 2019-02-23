package com.eksad.expro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.expro.dao.TestTypeDao;
import com.eksad.expro.model.TestTypeModel;
import com.eksad.expro.service.TestTypeService;

@Service
@Transactional
public class TestTypeServiceImpl implements TestTypeService{
	@Autowired
	private TestTypeDao dao;
	
	@Override
	public List<TestTypeModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<TestTypeModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public TestTypeModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(TestTypeModel model) {
		this.dao.insert(model);
		
	}

	@Override
	public void update(TestTypeModel model) {
		this.dao.update(model);
		
	}

	@Override
	public void delete(TestTypeModel model) {
		this.dao.delete(model);
	}
	
}
