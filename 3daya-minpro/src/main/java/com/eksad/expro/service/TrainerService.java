package com.eksad.expro.service;

import java.util.List;

import com.eksad.expro.model.TrainerModel;

public interface TrainerService {
	
	public List<TrainerModel> getList();
	public List<TrainerModel> search(String key);
	public TrainerModel getById(Integer id);
	public void insert(TrainerModel model);
	public void update(TrainerModel model);
	public void delete(TrainerModel model);

}