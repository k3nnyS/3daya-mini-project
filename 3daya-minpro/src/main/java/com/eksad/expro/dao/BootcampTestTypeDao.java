package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.BootcampTestTypeModel;

public interface BootcampTestTypeDao {
	public List<BootcampTestTypeModel> getList();
	public List<BootcampTestTypeModel> search(String key);
	public BootcampTestTypeModel getById(Integer id);
	public void insert(BootcampTestTypeModel model);
	public void update(BootcampTestTypeModel model);
	public void delete(BootcampTestTypeModel model);
}
