package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.IdleNewsDao;
import com.eksad.expro.model.IdleNewsModel;

@Repository
public class IdleNewsDaoImpl implements IdleNewsDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<IdleNewsModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from IdleNewsModel jt order by id";
		Query query = session.createQuery(hql);
		List<IdleNewsModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<IdleNewsModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from IdleNewsModel x where x.title like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public IdleNewsModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from IdleNewsModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		IdleNewsModel result = (IdleNewsModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(IdleNewsModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(IdleNewsModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(IdleNewsModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

}
