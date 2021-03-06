package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.UserDao;
import com.eksad.expro.model.UserModel;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<UserModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from UserModel jt order by jt.id";
		Query query = session.createQuery(hql);
		List<UserModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<UserModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from UserModel x where x.username like :keySearch or x.email like :keySearch ";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public UserModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from UserModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		UserModel result = (UserModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(UserModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(UserModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(UserModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

	@Override
	public void reset(UserModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}
}