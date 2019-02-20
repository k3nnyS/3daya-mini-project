package com.eksad.expro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.expro.dao.UserDao;
import com.eksad.expro.model.UserModel;
import com.eksad.expro.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;
	
	@Override
	public List<UserModel> getList() {
		return this.dao.getList();
	}

	@Override
	public UserModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(UserModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(UserModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(UserModel model) {
		this.dao.delete(model);
	}

	@Override
	public List<UserModel> search(String key) {
		return this.dao.search(key);
	}
}
