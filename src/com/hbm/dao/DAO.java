package com.hbm.dao;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class DAO {
	static final Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
	static final StandardServiceRegistryBuilder srb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
	static final SessionFactory factory = cfg.buildSessionFactory(srb.build());
}
