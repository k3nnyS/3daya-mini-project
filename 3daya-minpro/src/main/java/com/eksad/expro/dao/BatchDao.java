package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.BatchModel;

public interface BatchDao {
	public List<BatchModel> getList();
	public List<BatchModel> search(String key);
	public BatchModel getById(Integer id);
	public void insert(BatchModel model);
	public void update(BatchModel model);
	public void delete(BatchModel model);
}
