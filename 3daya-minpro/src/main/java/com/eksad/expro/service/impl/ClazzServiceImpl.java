package com.eksad.expro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.expro.dao.ClazzDao;
import com.eksad.expro.model.ClazzModel;
import com.eksad.expro.service.ClazzService;

@Service
@Transactional
public class ClazzServiceImpl implements ClazzService {
	@Autowired
	private ClazzDao dao;

	@Override
	public List<ClazzModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<ClazzModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public ClazzModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(ClazzModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(ClazzModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(ClazzModel model) {
		this.dao.delete(model);

	}

}
