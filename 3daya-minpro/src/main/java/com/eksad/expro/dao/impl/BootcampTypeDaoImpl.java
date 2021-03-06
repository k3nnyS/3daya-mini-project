package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.BootcampTypeDao;
import com.eksad.expro.model.BootcampTypeModel;

@Repository
public class BootcampTypeDaoImpl implements BootcampTypeDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<BootcampTypeModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		// HQl => Hibernate Query language
		// Hibernate => ORM ( Object Relation Mapping )
		String hql = "select bt from BootcampTypeModel bt";
		Query query = session.createQuery(hql);
		List<BootcampTypeModel> result = query.getResultList();
		return result;
	}

	public List<BootcampTypeModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select bt from BootcampTypeModel bt where bt.name like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}
	
	@Override
	public BootcampTypeModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select bt from BootcampTypeModel bt where bt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		BootcampTypeModel result = (BootcampTypeModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(BootcampTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
		
	}

	@Override
	public void update(BootcampTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
		
	}

	@Override
	public void delete(BootcampTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
		
	}

	
}