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

public class AddStockDao {

	SessionFactory sessionFactory=null;
	Session session =null;
	public AddStockDao()
	{
		sessionFactory=new AnnotationConfiguration().configure().buildSessionFactory();
	}
	public String save(AddStockModel addStockModel)
	{
		session=sessionFactory.openSession();
		session.beginTransaction();
		try
		{
			session.save(addStockModel);
			session.getTransaction().commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			if(session!=null)
			{
				session.getTransaction().rollback();
			}
			return "error";
		}
		finally
		{
			if(session!=null)
					session.close();
			if(sessionFactory!=null)
					sessionFactory.close();
		}
		return "success";
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
	
	
	
	public List<AddStockModel> showStockItems()
	{
		List<AddStockModel> addStockModels=null;
		
		session=sessionFactory.openSession();
		try
		{
			Criteria criteria=session.createCriteria(AddStockModel.class);
			addStockModels=criteria.list();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally{
			if(session!=null)session.close();
		}
		return addStockModels;
	}
		
		public String deleteStocks(Integer id)
		{
			AddStockModel addStockModel=new AddStockModel();
			addStockModel.setId(id);
			
			session=sessionFactory.openSession();
			session.beginTransaction();
			try
			{
				session.delete(addStockModel);
				session.getTransaction().commit();
			}
			catch(Exception e)
			{
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
		
		public AddStockModel getStock(Integer id)
		{
			session=sessionFactory.openSession();
			AddStockModel addStockModel=null;
			try
			{
				addStockModel=(AddStockModel)session.get(AddStockModel.class,id);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally{
				if(session!=null)session.close();
			}
				return addStockModel;
		}
		public String updateStocks(AddStockModel addStockModel)
		{
			session=sessionFactory.openSession();
			session.beginTransaction();
			try
			{
				session.update(addStockModel);
				session.getTransaction().commit();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				if(session!=null)
				{
					session.getTransaction().rollback();
				}
				return "error";
			}
			finally
			{
				if(session!=null)
						session.close();
				/*if(sessionFactory!=null)
						sessionFactory.close();*/
			}
			return "success";
		}
	}
