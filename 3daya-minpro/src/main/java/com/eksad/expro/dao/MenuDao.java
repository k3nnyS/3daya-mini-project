package com.eksad.expro.dao;

import java.util.List;

import com.eksad.expro.model.MenuModel;

public interface MenuDao {

	public List<MenuModel> getList();
	public List<MenuModel> search(String key);
	public MenuModel getById(Integer id);
	// untuk auto increment
	public String getNewCode();
	public void insert(MenuModel model);
	public void update(MenuModel model);
	public void delete(MenuModel model);
}
