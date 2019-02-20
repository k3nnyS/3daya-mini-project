package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.RoleDao;
import com.eksad.expro.model.RoleModel;

@Repository
public class RoleDaoImpl implements RoleDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<RoleModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		// HQl => Hibernate Query language
		// Hibernate => ORM ( Object Relation Mapping )
		String hql = "select jt from RoleModel jt order by id";
		Query query = session.createQuery(hql);
		List<RoleModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<RoleModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from RoleModel x where x.name like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public RoleModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from RoleModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		RoleModel result = (RoleModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(RoleModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(RoleModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(RoleModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

}
