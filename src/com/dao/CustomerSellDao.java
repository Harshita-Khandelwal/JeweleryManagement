package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.transform.Transformers;

import com.model.AddItemModel;
import com.model.AddStockModel;
import com.model.CustomerSellModel;


public class CustomerSellDao {

	SessionFactory sessionFactory=null;
	Session session =null;
	public CustomerSellDao()
	{
		sessionFactory=new AnnotationConfiguration().configure().buildSessionFactory();
	}
	public CustomerSellModel save(CustomerSellModel customerSellModel)
	{
		session=sessionFactory.openSession();
		session.beginTransaction();
		try
		{
			session.save(customerSellModel);
			session.getTransaction().commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			if(session!=null)
			{
				session.getTransaction().rollback();
			}
			customerSellModel=null;
			return customerSellModel;
		}
		finally
		{
			if(session!=null)
					session.close();
			if(sessionFactory!=null)
					sessionFactory.close();
		}
		return customerSellModel;
	}
	
	public List<AddItemModel> getItemListOnTheBasisOfItemType(String itemType)
	{
		List<AddItemModel> addItemModels=null;
		Query query=null;
		session=sessionFactory.openSession();
		try
		{
			query=session.createQuery("SELECT aim.id AS id, aim.itemName AS itemName "+
										" FROM AddItemModel aim"+
										" WHERE aim.itemType='"+itemType+"' ");
			query.setResultTransformer(Transformers.aliasToBean(AddItemModel.class));
			addItemModels=query.list();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally{
			if(session!=null)session.close();
		}
		return addItemModels;
			
	}
		
	
	public String deleteCustomerSell(CustomerSellModel customerSellModel){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			session.delete(customerSellModel);
			session.getTransaction().commit();
		}
		catch(Exception e){
			e.printStackTrace();
			if(session!=null)
				session.getTransaction().rollback();
			return "error";
		}
		finally{
			if(session!=null)session.close();
		}
		return "success";
	}
	
	public CustomerSellModel getCustomerItemModel(Integer id){
		session = sessionFactory.openSession();
		CustomerSellModel customerSellModel = (CustomerSellModel) session.get(CustomerSellModel.class, id);
		if(session!=null)
			session.close();
		return customerSellModel;
	}


	}
