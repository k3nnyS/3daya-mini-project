package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.UserModel;

public interface UserDao {
	public List<UserModel> getList();
	public List<UserModel> search(String key);
	public UserModel getById(Integer id);
	public void insert(UserModel model);
	public void update(UserModel model);
	public void delete(UserModel model);

}
