package com.eksad.expro.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.expro.dao.TrainerDao;
import com.eksad.expro.model.TrainerModel;
import com.eksad.expro.service.TrainerService;

@Service
@Transactional
public class TrainerServiceImpl implements TrainerService {

	@Autowired
	private TrainerDao dao;
	
	@Override
	public List<TrainerModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<TrainerModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public TrainerModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(TrainerModel model) {
		this.dao.insert(model);
		
	}

	@Override
	public void update(TrainerModel model) {
		this.dao.update(model);
		
	}

	@Override
	public void delete(TrainerModel model) {
		this.dao.delete(model);
	}
	
}
