package com.eksad.expro.service;

import java.util.List;

import com.eksad.expro.model.TechnologyModel;

public interface TechnologyService {

	public List<TechnologyModel> getList();
	public List<TechnologyModel> search(String key);
	public TechnologyModel getById(Integer id);
	public void insert(TechnologyModel model);
	public void update(TechnologyModel model);
	public void delete(TechnologyModel model);
	
}
