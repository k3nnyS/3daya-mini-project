package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.ClazzDao;
import com.eksad.expro.model.ClazzModel;

@Repository
public class ClazzDaoImpl implements ClazzDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<ClazzModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select t from ClazzModel t order by id";
		Query query = session.createQuery(hql);
		List<ClazzModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<ClazzModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select t from ClazzModel t where t.batchId like :keySearch" ;
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public ClazzModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select t from ClazzModel t where t.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ClazzModel result = (ClazzModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(ClazzModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(ClazzModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(ClazzModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

}
