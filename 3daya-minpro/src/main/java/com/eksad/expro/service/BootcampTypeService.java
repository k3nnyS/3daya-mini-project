package com.eksad.expro.service;

import java.util.List;

import com.eksad.expro.model.BootcampTypeModel;

public interface BootcampTypeService {
	
	public List<BootcampTypeModel> getList();
	public List<BootcampTypeModel> search(String key);
	public BootcampTypeModel getById(Integer id);
	public void insert(BootcampTypeModel model);
	public void update(BootcampTypeModel model);
	public void delete(BootcampTypeModel model);

}