package com.eksad.expro.service;

import java.util.List;

import com.eksad.expro.model.BiodataModel;

public interface BiodataService {
	public List<BiodataModel> getList();
	public List<BiodataModel> search(String key);
	public BiodataModel getById(Integer id);
	public void insert(BiodataModel model);
	public void update(BiodataModel model);
	public void delete(BiodataModel model);
}
