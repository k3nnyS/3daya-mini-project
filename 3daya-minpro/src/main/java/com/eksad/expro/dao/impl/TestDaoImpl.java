package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.TestDao;
import com.eksad.expro.model.TestModel;

@Repository
public class TestDaoImpl implements TestDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TestModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		// HQl => Hibernate Query language
		// Hibernate => ORM ( Object Relation Mapping )
		String hql = "select jt from TestModel jt order by id";
		Query query = session.createQuery(hql);
		List<TestModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<TestModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from TestModel x where x.name like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public TestModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from TestModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		TestModel result = (TestModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(TestModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(TestModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(TestModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

}