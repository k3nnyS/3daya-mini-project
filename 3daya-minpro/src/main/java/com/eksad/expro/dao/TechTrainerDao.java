package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.TechTrainerModel;

public interface TechTrainerDao {

	public List<TechTrainerModel> getList();
	public List<TechTrainerModel> search(String key);
	public TechTrainerModel getById(Integer id);
	public void insert(TechTrainerModel model);
	public void update(TechTrainerModel model);
	public void delete(TechTrainerModel model);
}
