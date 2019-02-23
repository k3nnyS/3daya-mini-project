package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.TestimonyDao;
import com.eksad.expro.model.TestimonyModel;

@Repository
public class TestimonyDaoImpl implements TestimonyDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TestimonyModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tm from TestimonyModel tm oder by id";
		Query query = session.createQuery(hql);
		List<TestimonyModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<TestimonyModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from TestimonyModel x where x.title like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public TestimonyModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tm from TestimonyModel tm where tm.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		TestimonyModel result = (TestimonyModel)query.getSingleResult();
		return null;
	}

	@Override
	public void insert(TestimonyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(TestimonyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(TestimonyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

}
