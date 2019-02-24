package com.eksad.expro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.expro.dao.TestimonyDao;
import com.eksad.expro.model.TestimonyModel;
import com.eksad.expro.service.TestimonyService;

@Service
@Transactional
public class TestimonyServiceImpl implements TestimonyService {
	@Autowired
	private TestimonyDao dao;
	
	@Override
	public List<TestimonyModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<TestimonyModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public TestimonyModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(TestimonyModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(TestimonyModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(TestimonyModel model) {
		this.dao.delete(model);

	}

}
