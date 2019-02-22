package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.TestDao;
import com.eksad.expro.dao.TestTypeDao;
import com.eksad.expro.model.TestTypeModel;

@Repository
public class TestTypeDaoImpl implements TestTypeDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TestTypeModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		// HQl => Hibernate Query language
		// Hibernate => ORM ( Object Relation Mapping )
		String hql = "select jt from TestTypeModel jt order by id";
		Query query = session.createQuery(hql);
		List<TestTypeModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<TestTypeModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from TestTypeModel x where x.name like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public TestTypeModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from TestTypeModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		TestTypeModel result = (TestTypeModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(TestTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(TestTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(TestTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

}
