package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.IdleNewsModel;

public interface IdleNewsDao {
	public List<IdleNewsModel> getList();
	public List<IdleNewsModel> search(String key);
	public IdleNewsModel getById(Integer id);
	public void insert(IdleNewsModel model);
	public void update(IdleNewsModel model);
	public void delete(IdleNewsModel model);
}
