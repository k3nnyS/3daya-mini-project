package com.eksad.expro.dao.impl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.CategoryDao;
import com.eksad.expro.model.CategoryModel;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<CategoryModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select cm from CategoryModel cm order by id";
		Query query = session.createQuery(hql);
		List<CategoryModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<CategoryModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select cm from CategoryModel cm where cm.name like :keySearch or cm.code like :keySearch" ;
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public CategoryModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select cm from CategoryModel cm where cm.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CategoryModel result = (CategoryModel)query.getSingleResult();
		return result;
	}

	@Override
	public String getNewCode() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select xx from CategoryModel xx where xx.code=(select max(code) from CategoryModel)";
		Query query = session.createQuery(hql);
		String kodeBaru = "";
		if (query.getResultList().size()>0) {
			CategoryModel xx = (CategoryModel)query.getSingleResult();
			kodeBaru=xx.getCode();
			int xCode = Integer.parseInt(kodeBaru.substring(1, 5));// value di mulai 1 dan panjang nya 3
			xCode++;
			kodeBaru = "C" + String.format("%04d", xCode);
		} else {
			kodeBaru = "C0001";
		}

		return kodeBaru;
	}
	
	@Override
	public void insert(CategoryModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(CategoryModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(CategoryModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

	
}
