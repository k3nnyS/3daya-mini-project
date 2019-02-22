package com.eksad.expro.service;
import java.util.List;
import com.eksad.expro.model.BootcampTestTypeModel;
public interface BootcampTestTypeService {
	public List<BootcampTestTypeModel> getList();
	public List<BootcampTestTypeModel> search(String key);
	public BootcampTestTypeModel getById(Integer id);
	public void insert(BootcampTestTypeModel model);
	public void update(BootcampTestTypeModel model);
	public void delete(BootcampTestTypeModel model);

}
