package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.RoleModel;

public interface RoleDao {
	public List<RoleModel> getList();
	public List<RoleModel> search(String key);
	public RoleModel getById(Integer id);
	public void insert(RoleModel model);
	public void update(RoleModel model);
	public void delete(RoleModel model);
}
