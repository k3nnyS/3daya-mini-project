package com.eksad.expro.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.expro.dao.MenuDao;
import com.eksad.expro.model.MenuModel;

@Repository
public class MenuDaoImpl implements MenuDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<MenuModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select mo from MenuModel mo order by id";
		Query query = session.createQuery(hql);
		List<MenuModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<MenuModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from MenuModel x where x.title like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public MenuModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select mo from MenuModel mo where mo.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		MenuModel result = (MenuModel)query.getSingleResult();
		return result;
	}
	
	@Override
	public String getNewCode() {
		Session session = sessionFactory.getCurrentSession();
		String hql="select cd from MenuModel cd where cd.code=(select max(code) from MenuModel)";
		Query query = session.createQuery(hql);
		String kodeBaru = "";
		if(query.getResultList().size()>0) {
			MenuModel jt = (MenuModel) query.getSingleResult();
			kodeBaru=jt.getCode();
			int mCode = Integer.parseInt(kodeBaru.substring(1,5));
			mCode++;
			kodeBaru="M" + String.format("%04d", mCode);
		} else {
			kodeBaru="M0001";
		}
		
		return kodeBaru;
}
	
	@Override
	public void insert(MenuModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(MenuModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(MenuModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

	

}
