package com.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.transform.Transformers;
import org.springframework.web.multipart.MultipartFile;

import com.model.AddItemModel;
import com.model.AddUserModel;


public class UserRegistrationDao {
	
	SessionFactory sessionFactory = null;
	Session session =null;
	public UserRegistrationDao(){
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	}
	
	public String save(AddUserModel userRegistrationModel,InputStream inputStream,MultipartFile file){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			Blob photo=Hibernate.getLobCreator(session).createBlob(inputStream,file.getSize());
			userRegistrationModel.setPhoto(photo);
			session.save(userRegistrationModel);
			session.getTransaction().commit();
		}
		catch(Exception e){
			e.printStackTrace();
			if(session!=null){
				session.getTransaction().rollback();
			}
			return "error";
		}
		finally{
			if(session!=null)
				session.close();
			if(sessionFactory!=null)
				sessionFactory.close();
		}
		return "success";
	}
	
	public List<AddUserModel> verifyUser(String userName,String password)
	{
		Query query=null;
		List<AddUserModel> addUserModels= null;
		String queryString=" SELECT aum.userName AS userName, aum.emailId as emailId"+
							" FROM AddUserModel aum"+
							" WHERE aum.userName='"+userName+"' AND aum.password='"+password+"'";
		
		session=sessionFactory.openSession();
		try
		{
		query=session.createQuery(queryString).
			setResultTransformer(Transformers.aliasToBean(AddUserModel.class));
		addUserModels=query.list();
		}
		catch(Exception e){}
		finally{if(session!=null)session.close();}
		return addUserModels;
	}
	public String changePassword(String oldPassword,String newPassword,String emailId)
	{
		Query query=null;
		String queryString=" UPDATE AddUserModel aum "+
							"SET aum.password='"+newPassword+"' WHERE aum.emailId='"+emailId+"'";
		session=sessionFactory.openSession();
		session.beginTransaction();
		try
		{
		query=session.createQuery(queryString).
			setResultTransformer(Transformers.aliasToBean(AddUserModel.class));
		query.executeUpdate();
			session.getTransaction().commit();
			}
		catch(Exception e){
			e.printStackTrace();
			if(session!=null){
				session.getTransaction().rollback();
			}
			return "error";
		}
		finally{
			if(session!=null)
				session.close();
			if(sessionFactory!=null)
				sessionFactory.close();
		}
		return "success";
	}
	
}
