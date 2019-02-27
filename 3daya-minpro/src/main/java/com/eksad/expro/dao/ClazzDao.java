package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.ClazzModel;

public interface ClazzDao {
	public List<ClazzModel> getList();
	public List<ClazzModel> search(String key);
	public ClazzModel getById(Integer id);
	public void insert(ClazzModel model);
	public void update(ClazzModel model);
	public void delete(ClazzModel model);
}
