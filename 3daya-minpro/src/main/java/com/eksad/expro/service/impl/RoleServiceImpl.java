package com.eksad.expro.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eksad.expro.dao.RoleDao;
import com.eksad.expro.model.RoleModel;
import com.eksad.expro.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao dao;
	
	@Override
	public List<RoleModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<RoleModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public RoleModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(RoleModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(RoleModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(RoleModel model) {
		this.dao.delete(model);

	}

}
