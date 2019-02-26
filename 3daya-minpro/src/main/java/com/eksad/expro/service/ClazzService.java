package com.eksad.expro.service;

import java.util.List;

import com.eksad.expro.model.ClazzModel;

public interface ClazzService {
	public List<ClazzModel> getList();
	public List<ClazzModel> search(String key);
	public ClazzModel getById(Integer id);
	public void insert(ClazzModel model);
	public void update(ClazzModel model);
	public void delete(ClazzModel model);
	
}
