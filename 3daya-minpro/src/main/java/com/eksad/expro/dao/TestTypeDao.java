package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.TestTypeModel;

public interface TestTypeDao {
	public List<TestTypeModel> getList();
	public List<TestTypeModel> search(String key);
	public TestTypeModel getById(Integer id);
	public void insert(TestTypeModel model);
	public void update(TestTypeModel model);
	public void delete(TestTypeModel model);
}
