package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.TestimonyModel;

public interface TestimonyDao {
	public List<TestimonyModel> getList();
	public List<TestimonyModel> search(String key);
	public TestimonyModel getById(Integer id);
	public void insert(TestimonyModel model);
	public void update(TestimonyModel model);
	public void delete(TestimonyModel model);

}
